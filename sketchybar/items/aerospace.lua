local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

-- Function to get all aerospace workspaces
local function get_workspaces()
  local handle = io.popen("aerospace list-workspaces --all")
  local result = handle:read("*a")
  handle:close()
  
  local workspaces = {}
  for workspace in string.gmatch(result, "[^\r\n]+") do
    table.insert(workspaces, workspace)
  end
  return workspaces
end

-- Function to get current workspace
local function get_current_workspace()
  local handle = io.popen("aerospace list-workspaces --focused")
  local result = handle:read("*a")
  handle:close()
  return result:gsub("%s+", "")
end

-- Function to get apps in a workspace
local function get_workspace_apps(workspace)
  local handle = io.popen("aerospace list-windows --workspace " .. workspace)
  local result = handle:read("*a")
  handle:close()
  
  local apps = {}
  for line in string.gmatch(result, "[^\r\n]+") do
    -- Parse the format: "ID | AppName | Window Title"
    local app_name = line:match("^%d+%s*|%s*([^|]+)%s*|")
    if app_name then
      app_name = app_name:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace
      table.insert(apps, app_name)
    end
  end
  return apps
end

-- Create initial workspaces
local workspaces = get_workspaces()
local current_workspace = get_current_workspace()

for i, workspace in ipairs(workspaces) do
  local space = sbar.add("item", "aerospace.space." .. workspace, {
    icon = {
      string = workspace,
      padding_left = 8,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 8,
      color = colors.grey,
      highlight_color = colors.white,
      font = "sketchybar-app-font:Regular:16.0",
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = (workspace == current_workspace) and colors.black or colors.bg2,
    },
  })
  
  spaces[workspace] = space
  
  -- Single item bracket for space items to achieve double border on highlight
  local space_bracket = sbar.add("bracket", { space.name }, {
    background = {
      color = colors.transparent,
      border_color = (workspace == current_workspace) and colors.grey or colors.bg2,
      height = 28,
      border_width = 2,
    },
  })
  
  space.bracket = space_bracket
  
  -- Click handler
  space:subscribe("mouse.clicked", function(env)
    sbar.exec("aerospace workspace " .. workspace)
  end)
  
  -- Update app icons
  local apps = get_workspace_apps(workspace)
  local icon_line = ""
  if #apps > 0 then
    -- Get unique app names
    local unique_apps = {}
    local app_set = {}
    for _, app in ipairs(apps) do
      if not app_set[app] then
        app_set[app] = true
        table.insert(unique_apps, app)
      end
    end
    
    -- Generate icon line
    for _, app in ipairs(unique_apps) do
      local lookup = app_icons[app]
      local icon = ((lookup == nil) and app_icons["Default"] or lookup)
      icon_line = icon_line .. icon .. " "
    end
    icon_line = icon_line:gsub("%s+$", "") -- Trim trailing space
  else
    icon_line = "—"
  end
  space:set({ label = icon_line })
end

-- Padding at the end
sbar.add("item", "aerospace.padding", {
  width = settings.group_paddings,
})

-- Create a watcher for workspace changes
local aerospace_watcher = sbar.add("item", "aerospace.watcher", {
  drawing = false,
  update_freq = 1,
})

aerospace_watcher:subscribe("routine", function()
  -- Get current workspace
  local new_current = get_current_workspace()
  
  -- Get all workspaces (in case new ones were created)
  local new_workspaces = get_workspaces()
  
  -- Update existing spaces and create new ones if needed
  for _, workspace in ipairs(new_workspaces) do
    if not spaces[workspace] then
      -- Create new workspace item
      local space = sbar.add("item", "aerospace.space." .. workspace, {
        icon = {
          string = workspace,
          padding_left = 8,
          padding_right = 8,
          color = colors.white,
          highlight_color = colors.red,
        },
        label = {
          padding_right = 8,
          color = colors.grey,
          highlight_color = colors.white,
          font = "sketchybar-app-font:Regular:16.0",
          y_offset = -1,
        },
        padding_right = 1,
        padding_left = 1,
        background = {
          color = colors.bg1,
          border_width = 1,
          height = 26,
          border_color = colors.bg2,
        },
      })
      
      spaces[workspace] = space
      
      local space_bracket = sbar.add("bracket", { space.name }, {
        background = {
          color = colors.transparent,
          border_color = colors.bg2,
          height = 28,
          border_width = 2,
        },
      })
      
      space.bracket = space_bracket
      
      space:subscribe("mouse.clicked", function(env)
        sbar.exec("aerospace workspace " .. workspace)
      end)
    end
    
    -- Update highlight state
    local selected = (workspace == new_current)
    spaces[workspace]:set({
      icon = { highlight = selected },
      label = { highlight = selected },
      background = { border_color = selected and colors.black or colors.bg2 },
    })
    
    if spaces[workspace].bracket then
      spaces[workspace].bracket:set({
        background = { border_color = selected and colors.grey or colors.bg2 },
      })
    end
    
    -- Update app icons
    local apps = get_workspace_apps(workspace)
    local icon_line = ""
    if #apps > 0 then
      -- Get unique app names
      local unique_apps = {}
      local app_set = {}
      for _, app in ipairs(apps) do
        if not app_set[app] then
          app_set[app] = true
          table.insert(unique_apps, app)
        end
      end
      
      -- Generate icon line
      for _, app in ipairs(unique_apps) do
        local lookup = app_icons[app]
        local icon = ((lookup == nil) and app_icons["Default"] or lookup)
        icon_line = icon_line .. icon .. " "
      end
      icon_line = icon_line:gsub("%s+$", "") -- Trim trailing space
    else
      icon_line = "—"
    end
    spaces[workspace]:set({ label = icon_line })
  end
  
  -- Remove spaces that no longer exist
  for workspace, space in pairs(spaces) do
    local exists = false
    for _, w in ipairs(new_workspaces) do
      if w == workspace then
        exists = true
        break
      end
    end
    if not exists then
      sbar.remove(space.name)
      if space.bracket then
        sbar.remove(space.bracket.name)
      end
      spaces[workspace] = nil
    end
  end
end)
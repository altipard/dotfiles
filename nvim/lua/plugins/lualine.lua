-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Gruvbox color palette
    local colors = {
      dark0_hard = '#1d2021',
      dark0 = '#282828',
      dark0_soft = '#32302f',
      dark1 = '#3c3836',
      dark2 = '#504945',
      dark3 = '#665c54',
      dark4 = '#7c6f64',
      light0_hard = '#f9f5d7',
      light0 = '#fbf1c7',
      light0_soft = '#f2e5bc',
      light1 = '#ebdbb2',
      light2 = '#d5c4a1',
      light3 = '#bdae93',
      light4 = '#a89984',
      bright_red = '#fb4934',
      bright_green = '#b8bb26',
      bright_yellow = '#fabd2f',
      bright_blue = '#83a598',
      bright_purple = '#d3869b',
      bright_aqua = '#8ec07c',
      bright_orange = '#fe8019',
      neutral_red = '#cc241d',
      neutral_green = '#98971a',
      neutral_yellow = '#d79921',
      neutral_blue = '#458588',
      neutral_purple = '#b16286',
      neutral_aqua = '#689d6a',
      neutral_orange = '#d65d0e',
    }

    local gruvbox_theme = {
      normal = {
        a = { fg = colors.dark0, bg = colors.neutral_green, gui = 'bold' },
        b = { fg = colors.light1, bg = colors.dark2 },
        c = { fg = colors.light3, bg = colors.dark1 },
      },
      command = { a = { fg = colors.dark0, bg = colors.neutral_yellow, gui = 'bold' } },
      insert = { a = { fg = colors.dark0, bg = colors.neutral_blue, gui = 'bold' } },
      visual = { a = { fg = colors.dark0, bg = colors.neutral_orange, gui = 'bold' } },
      terminal = { a = { fg = colors.dark0, bg = colors.neutral_aqua, gui = 'bold' } },
      replace = { a = { fg = colors.dark0, bg = colors.neutral_red, gui = 'bold' } },
      inactive = {
        a = { fg = colors.dark4, bg = colors.dark1, gui = 'bold' },
        b = { fg = colors.dark4, bg = colors.dark0 },
        c = { fg = colors.dark4, bg = colors.dark0_soft },
      },
    }

    -- Import color theme based on environment variable NVIM_THEME
    local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'gruvbox'

    -- Define a table of themes
    local themes = {
      gruvbox = gruvbox_theme,
      onedark = 'onedark',
      nord = 'nord',
    }

    local mode = {
      'mode',
      fmt = function(str)
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'gruvbox', -- Use built-in gruvbox theme
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

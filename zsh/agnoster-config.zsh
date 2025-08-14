#!/usr/bin/env zsh
# Agnoster theme customization

# Hide the username and hostname when you're logged in as yourself on your local machine
# This makes the prompt cleaner
DEFAULT_USER="$USER"
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
  fi
}

# Optional: Shorten the directory path in the prompt
# Uncomment the next line if you want shorter paths
# AGNOSTER_PROMPT_SEGMENTS=(prompt_status prompt_context prompt_virtualenv prompt_dir_short prompt_git prompt_end)

# Optional: Custom colors for Agnoster (Nord-inspired)
# You can customize the segment colors here if needed
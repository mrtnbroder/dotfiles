
# soften status bar color from harsh green to light gray
set -g status-bg default
set -g status-fg 'colour250'

setw -g window-status-format         '#(echo "#{pane_current_command}")  '
setw -g window-status-current-format '#(echo "#{pane_current_command}") '

# setw -g window-status-current-fg red
set -g status-left ""
set -g status-right-length 60
set -g status-right 'Batt: #{battery_percentage} | %a %d-%h %Y %H:%M'


#
# COLORS
#

tm_color_active=colour51
tm_color_inactive=colour241

#
# THEME
#

# source ~/.tmux/plugins/tmux-git-status-bar/git-status-bar.tmux

set -g pane-border-fg colour242
set -g status-bg black
set -g status-fg white
set -g window-status-current-bg default
set -g window-status-current-fg white

# active window title colors
set-window-option -g window-status-current-fg $tm_color_active
set-window-option -g window-status-current-bg default
set-window-option -g  window-status-current-format "#[bold]#I #W"

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# prettify status pane alignment
set -g status-justify centre

#
# LEFT STATUS
#

set -g status-left '#[fg=green]#(whoami)'

#
# RIGHT STATUS
#

tm_date='%a %h-%d %H:%M'

set -g status-right '#{battery_percentage} | '$tm_date

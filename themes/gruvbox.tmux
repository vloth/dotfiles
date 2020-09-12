FG=colour244
BG=colour8
ACTIVE_1=colour4
CONTRAST=colour240

set -g pane-border-style fg=colour235,bg=colour235
set -g pane-active-border-style fg=$ACTIVE_1,bg=colour235

set -g status-justify left
set -g status-position bottom
set -g status-bg default
set -g status-fg $FG
set -g status-left ''
set -g status-right ''

setw -g window-status-current-style fg=$ACTIVE_1,bold

set-option -g status-interval 1

set-option -g message-style bg=$BG,fg=$ACTIVE_1
set-window-option -g mode-style fg=$ACTIVE_1,bg=$CONTRAST

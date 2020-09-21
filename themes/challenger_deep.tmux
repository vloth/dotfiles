FG=colour244
BG=colour0
ACTIVE_1=colour5
CONTRAST=colour240
BORDER=colour0

set -g pane-border-style fg=$BORDER,bg=$BORDER
set -g pane-active-border-style fg=$ACTIVE_1,bg=$BORDER

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

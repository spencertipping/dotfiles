set -g history-limit 65536

set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix

bind-key C-n next-window
bind-key C-p previous-window
bind-key C-c new-window

bind-key C-m swap-window -t +1
bind-key C-[ swap-window -t -1

bind-key k kill-session
bind-key C-k kill-session

bind-key r source-file ~/.tmux.conf

set -g status-left ""
set -g status-right "#h #[fg=white]#S"

set -g status-bg 8
set -g status-fg green
set -g message-bg 8
set -g message-fg yellow

set -g window-status-bell-bg 8
set -g window-status-content-bg 8
set -g window-status-activity-bg 8
set -g window-status-current-bg 8

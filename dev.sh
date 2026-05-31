#!/bin/bash

SESSION="soundsite"

# Don't create a duplicate session
if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit 0
fi

tmux new-session -d -s $SESSION -n 'servers'

# Window 1: servers
tmux send-keys -t $SESSION:0 'npm run start:services' Enter
tmux split-window -h -t $SESSION:0
tmux send-keys -t $SESSION:0 'npm run dev' Enter

# Window 2: terminal
tmux new-window -t $SESSION:1 -n 'terminal'
tmux send-keys -t $SESSION:1 'cd ~/projects/soundsite' Enter

# Attach
tmux attach -t $SESSION
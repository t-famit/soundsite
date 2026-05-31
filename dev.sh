#!/bin/bash
#!/bin/bash

SESSION="soundsite"

# Don't create a duplicate session
if tmux has-session -t $SESSION 2>/dev/null; then
  tmux attach -t $SESSION
  exit 0
fi

tmux new-session -d -s $SESSION

# Window 1: servers
tmux rename-window -t $SESSION:1 'servers'
tmux send-keys -t $SESSION:1 'npx supabase start' Enter
tmux split-window -h -t $SESSION:1
tmux send-keys -t $SESSION:1 'npm run dev' Enter

# Window 2: terminal
tmux new-window -t $SESSION:2 -n 'terminal'
tmux send-keys -t $SESSION:2 'cd ~/projects/soundsite' Enter

# Attach
tmux attach -t $SESSION
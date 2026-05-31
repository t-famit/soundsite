#!/bin/bash
cd ~/projects/soundsite
npm run stop:services
tmux kill-session -t soundsite
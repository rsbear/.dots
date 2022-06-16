#!/bin/sh 
cd ~/work/kitco-cms-next
tmux new-session -s "ktc-frontend" -d
tmux new-window
tmux split-window -v
tmux -2 attach-session -d 

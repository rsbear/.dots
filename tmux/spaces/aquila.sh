#!/bin/sh 
cd ~/work/aquila
tmux new-session -s "aquila" -d
tmux new-window
tmux split-window -h
tmux split-window -v
tmux -2 attach-session -d 

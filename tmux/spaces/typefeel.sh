#!/bin/sh 
cd ~/side/typefeel
tmux new-session -s "typefeel" -d
tmux new-window
tmux split-window -v
tmux -2 attach-session -d 

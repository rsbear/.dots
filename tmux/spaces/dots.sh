#!/bin/sh 
cd ~/.config
tmux new-session -s ".dots" -d
tmux new-window
tmux -2 attach-session -d 

#!/bin/sh 
cd ~
tmux new-session -s "k8s" -d
tmux split-window -h
tmux split-window -v
tmux -2 attach-session -d 

#!/bin/sh 
cd ~/side/providers-ctl
tmux new-session -s "pctl" -d
tmux -2 attach-session -d 

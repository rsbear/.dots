#!/bin/sh 
cd ~/work/cbs-course-catalog
tmux new-session -s "courses" -d
tmux new-window
tmux -2 attach-session -d 

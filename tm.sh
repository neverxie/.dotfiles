#!/bin/bash

session=$1

tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

tmux new-session -d -s $session -n scons
tmux new-window -t $session:2 -n edit
tmux new-window -t $session:3 -n openocd
tmux new-window -t $session:4 -n minicom

tmux select-window -t $session:1
tmux attach-session -t $session

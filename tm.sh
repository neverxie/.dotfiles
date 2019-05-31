#!/bin/bash

session=$1

tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

tmux new-session -d -s $session -n bash
tmux split-window -h
tmux select-pane -t 2
tmux split-window -v

## 竖直分割
#tmux split-window -h
#tmux select-pane -t 1
#tmux split-window -v
## 将窗口分为上下两部分，并通过-p指定比例
#tmux split-window -v -p 40

tmux new-window -t $session:2 -n vim

# 这个暂时先不要了
#tmux new-window -t $session:3 -n minicom

tmux select-window -t $session:1
tmux select-pane -t 1
tmux attach-session -t $session

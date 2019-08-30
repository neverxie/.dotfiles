#!/bin/bash

session=$1

# 判断是否存在 $session 会话
tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

# 创建一个新session名称为 $session，新窗口名为bash，并detach
tmux new-session -d -s $session -n bash
tmux split-window -h
tmux select-pane -t 2
# 将窗口分为上下两部分
tmux split-window -v

## 竖直分割
#tmux split-window -h
#tmux select-pane -t 1
#tmux split-window -v
## 将窗口分为上下两部分，并通过-p指定比例
#tmux split-window -v -p 40

# 创建一个新的窗口
tmux new-window -t $session:2 -n bash

# 这个暂时先不要了
#tmux new-window -t $session:3 -n minicom

# 选择一个默认窗口
tmux select-window -t $session:1
tmux select-pane -t 1
tmux attach-session -t $session

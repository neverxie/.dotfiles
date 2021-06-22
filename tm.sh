#!/bin/bash
#!/bin/zsh

session=$1

# 兼容zsh
export DISABLE_AUTO_TITLE="true"

# 判断是否存在 $session 会话
tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

# 创建一个新session名称为 $session，新窗口名为bash，并detach
tmux new-session -d -s $session -n debug
tmux split-window -h -p 65
tmux split-window -v -p 30 # 窗口分为上下两部分，并通过-p制定比例
#tmux select-pane -t 2
tmux split-window -h -p 30
# 将窗口分为上下两部分
tmux send-keys -t C-s-t

## 竖直分割
#tmux split-window -h
#tmux select-pane -t 1
#tmux split-window -v
## 将窗口分为上下两部分，并通过-p指定比例
#tmux split-window -v -p 40

# 创建一个新的窗口
tmux new-window -t $session:2 -n

# 这个暂时先不要了
tmux new-window -t $session:3 -n

# 选择一个默认窗口
#tmux send-keys -t $session:1 'zsh' C-m
#tmux send-keys -t $session:1 'git status' C-m
tmux select-window -t $session:1
tmux select-pane -t 1
tmux attach-session -t $session

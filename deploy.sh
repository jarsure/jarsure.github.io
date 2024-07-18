#!/bin/bash

# 确保脚本在错误发生时退出
set -e

# 构建 Hugo 站点
hugo

# 进入 public 目录
cd public

# 初始化 Git 仓库（如果没有）
if [ ! -d .git ]; then
    git init
    git remote add origin git@github.com:<username>/<repository>.git
fi

# 配置 git 用户（如果没有配置）
git config user.name "your-username"
git config user.email "your-email@example.com"

# 添加所有更改
git add .

# 提交更改
msg="Rebuilding site `date`"
if [ -n "$1" ]; then
    msg="$1"
fi
git commit -m "$msg"

# 推送到 main 分支
git push -f origin HEAD:main

# 返回到项目根目录
cd ..

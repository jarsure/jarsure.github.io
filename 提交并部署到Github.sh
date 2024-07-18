#!/bin/bash

# 确保脚本在错误发生时退出
set -e

# 构建 Hugo 站点
hugo

# 添加所有文件到暂存区
git add .

# 提交更改
msg="Rebuilding site $(date)"
if [ -n "$1" ]; then
    msg="$1"
fi
git commit -m "$msg"

# 推送到远程仓库的 main 分支
git push origin main

# 返回到项目根目录
cd ..

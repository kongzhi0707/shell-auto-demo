
#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e
# 判断tag是否为空
if [ $# -eq 0 ];
then
  echo 'please input tag name!'
  exit
fi
# 校验tag格式是否正确
TAGPATTERN="^v[1-9]\.[0-9]\.[0-9]$"
if [[ "$1"=~$TAGPATTERN ]]; then :
else
echo "tag format is invalid!"
exit
fi
# 判断build目录是否存在
if [ ! -d "build" ]; then
echo 'build folder cannot found!'
exit
fi

# 创建tag并上传远程Git仓库
git tag $1
git push -f origin $1
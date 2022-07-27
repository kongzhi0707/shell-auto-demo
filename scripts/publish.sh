
#!/usr/bin/env bash
function build() {
  echo $1;
  # 执行打包命令
  yarn build:$1
  # 上传本地的包到服务器指定的目录
  scp -i ~/.ssh/id_rsa -r ./build/* root@47.94.155.8:/home/www/react-test/
}

if [ $1 == "pre" ]; then
  build $1
elif [ $1 == "prod" ]; then
  build $1
else 
  echo "shell脚本命令错误"
fi
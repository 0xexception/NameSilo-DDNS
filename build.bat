@echo off
REM 设置镜像名称
set IMAGE_NAME=ddns-namesilo

REM 构建 Docker 镜像
docker build -t %IMAGE_NAME% -f Dockerfile .

REM 检查构建是否成功
if %errorlevel% neq 0 (
    echo Docker build failed!
    exit /b %errorlevel%
)

docker save %IMAGE_NAME% -o %IMAGE_NAME%.tar

echo Docker image '%IMAGE_NAME%' built successfully.
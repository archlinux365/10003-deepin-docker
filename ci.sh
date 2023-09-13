#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color

echo $PROJECT_NAME
cd $CMD_PATH

cp -fv files/known_hosts /home/runner/.ssh/known_hosts
ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "frs.sourceforge.net"
ssh-keyscan "frs.sourceforge.net" >> /home/runner/.ssh/known_hosts
ssh-keygen -f "/home/runner/.ssh/known_hosts" -R "github.com"
ssh-keyscan "github.com" >> /home/runner/.ssh/known_hosts
cat /home/runner/.ssh/known_hosts

cd $CMD_PATH/files/
rsync -avzP ~/.ssh/ ./.ssh/
ls -al ./.ssh/
env

cd $CMD_PATH


function docker_build()
{
	cd $1
	docker build . -f Dockerfile \
-t ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t ghcr.io/${GITHUB_REPOSITORY}-$1:latest \
-t gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER -t gnuhub/$PROJECT_NAME-$1:latest \
-t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest \
-t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER -t registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest


docker push ghcr.io/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
docker push ghcr.io/${GITHUB_REPOSITORY}-$1:latest
docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER
docker push registry.cn-hangzhou.aliyuncs.com/${GITHUB_REPOSITORY}-$1:latest
# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:$GITHUB_RUN_NUMBER 
# docker push hkccr.ccs.tencentyun.com/${GITHUB_REPOSITORY}-$1:latest 
docker push gnuhub/$PROJECT_NAME-$1:$GITHUB_RUN_NUMBER
docker push gnuhub/$PROJECT_NAME-$1:latest
}

docker_build beige


#!/bin/bash -eu

BUILD_HOME="/opt/docker/zabbix/docker-build"

HUB_USER="YOURNAME"

VERSION=`date '+%Y%m%d'`
TAG="`date '+%m%d'_4.2_${GIT_COMMIT:0:7}`"
TAG="`date '+%m%d'`"

# copy docker-entrypoint.sh to each container
cp $BUILD_HOME/docker-entrypoint.sh zabbix-server-mysql
cp $BUILD_HOME/docker-entrypoint.sh zabbix-web-nginx-mysql

########################################################
IMAGE=${HUB_USER}/zabbix-server-mysql
IMAGE=zabbix-server-mysql

cd $BUILD_HOME/server 
docker build -t ${IMAGE}:latest .
docker tag ${IMAGE}:latest ${IMAGE}:$TAG

docker push ${IMAGE}

########################################################
IMAGE=${HUB_USER}/zabbix-web-nginx-mysql
IMAGE=zabbix-server-mysql

cd $BUILD_HOME/web-nginx-mysql 
docker build -t ${IMAGE}:latest .

#docker tag ${IMAGE}:latest ${IMAGE}:$TAG

#docker push ${IMAGE}

echo "DONE"

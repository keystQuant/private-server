#! /bin/bash

#### 도커 레지스트리/모니터링/로깅 시스템 환경 구축 ####
#### + Redis Cache ####

# install Docker on server
sudo apt-get update
sudo apt-get install docker.io
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# # remove all containers - by wonseok (2017/01/15)
#  docker rm -f $(docker ps -a -q)
#  for f in `docker images | grep -v IMAGE | awk '{split($0,array," ")} {print array[3]}'`
#  do
#   echo "==> delete image : $f"
#   docker rmi $f
# done

docker-compose up -d

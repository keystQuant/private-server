#! /bin/bash

#### 도커 레지스트리/모니터링/로깅 시스템 환경 구축 ####
#### + Redis Cache ####

# install Docker on server
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
apt-get install docker-compose

#remove all containers - by wonseok (2017/01/15)
 docker rm -f $(docker ps -a -q)
 for f in `docker images | grep -v IMAGE | awk '{split($0,array," ")} {print array[3]}'`
 do
  echo "==> delete image : $f"
  docker rmi $f
done

docker-compose up -d

#!/bin/sh

if [ "$(docker ps -a | grep [u]nomp)" != "" ];
then
  docker start pool 
else
  docker run -d --name pool -v $(pwd)/conf/config.json:/root/unomp/config.json -v $(pwd)/conf/litecoin.json:/root/unomp/pool_configs/litecoin.json pool
fi

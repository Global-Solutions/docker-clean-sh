#!/bin/sh

echo "-- REMOVE DANGLING CONTAINERS --"
DANGLING_CONTS=`docker ps -q -f status=exited`
if [ -n "$DANGLING_CONTS" ]; then
  docker rm -v $DANGLING_CONTS
else
  echo "NO DANGLING CONTAINERS" $DANGLING_CONTS
fi

echo "-- REMOVE DANGLING VOLUMES --"
DANGLING_VOLS=`docker volume ls -q -f dangling=true`
if [ -n "$DANGLING_VOLS" ]; then
  docker volume rm $DANGLING_VOLS
else
  echo "NO DANGLING VOLUMES" $DANGLING_VOLS
fi

echo "-- REMOVE DANGLING IMAGES --"
DANGLING_IMGS=`docker images -q -f dangling=true`
if [ -n "$DANGLING_IMGS" ]; then
  docker rmi $DANGLING_IMGS
else
  echo "NO DANGLING IMAGES" $DANGLING_IMGS
fi

#!/bin/sh

echo "-- REMOVE DANGLING CONTAINERS --"
DANGLING_CONTS=`docker ps -q -f status=exited`
if [ -n "$DANGLING_CONTS" ]; then
  docker rm -v $DANGLING_CONTS
else
  echo "NO DANGLING CONTAINERS" $DANGLING_CONTS
fi

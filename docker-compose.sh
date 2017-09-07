#!/bin/sh

set -eu

COMMAND_SUB=${1:-up}

case "$COMMAND_SUB" in
  up )
    docker-compose -f docker-compose.yml up -d --build
    ;;

  down )
    docker-compose -f docker-compose.yml down
    ;;

  * )
    exit
esac

docker-compose -f docker-compose.yml ps

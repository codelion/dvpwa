#!/bin/bash
set -e

if [ "$(id -u)" != '0' ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

docker-compose down --remove-orphans
docker volume ls -qf dangling=true | xargs -r docker volume rm
docker-compose build --memory 500m

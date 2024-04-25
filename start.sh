#!/bin/bash

docker compose up --detach

container_name=mapasculturais-app-1

while [ "$( docker container inspect -f '{{.State.Running}}' $container_name )" == "false" ]
do
  echo "."
done

docker exec -it $container_name chmod 777 -R /var/www/html/assets

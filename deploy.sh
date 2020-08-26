#!/bin/bash
echo "Hello! Welcome to Jehadsama's service!"
echo "deploy.sh start!"

IMAGENAME=jehadsama/deploy

docker login -u jehadsama -p l2598635
docker  pull $IMAGENAME
docker stop $IMAGE && docker rm $IMAGE
docker run --name $IMAGE -p 9000:9000 --restart always --network my-net -d $IMAGENAME

echo 'travis build done!'
echo "deploy.sh end!"
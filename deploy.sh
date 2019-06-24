echo "Hello! Welcome to Jehadsama's service!"

echo "deploy.sh start!"

REPO=$1
echo "REPO is $REPO"
IMAGE=$2
echo "IMAGE is $IMAGE"
TAG=$3
echo "TAG is $TAG"

IMAGENAME=$REPO/$IMAGE:$TAG

docker login -u jehadsama -p l2598635
docker  pull $IMAGENAME
docker stop $IMAGE && docker rm $IMAGE
docker run --name $IMAGE -p 9000:9000 --restart always --network my-net -d $IMAGENAME

echo "deploy.sh end!"
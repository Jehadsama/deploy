echo "Hello! Welcome to Jehadsama's service!"

echo "deploy.sh start!"

IMAGENAME=$1
echo "IMAGESNAME is $IMAGENAME"
index=`expr index $IMAGENAME :`
num=`expr $index - 1`
IMAGE=${IMAGENAME:0:num}
echo "IMAGE is ${IMAGE}"

# docker login -u jehadsama -p l2598635
# docker  pull $IMAGENAME
# docker run --name $IMAGE -p 9000:9000 --restart always --network my-net -d $IMAGENAME

echo "deploy.sh end!"
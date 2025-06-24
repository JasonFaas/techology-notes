docker build -t my-image:latest .
docker tag my-image:latest localhost:5001/my-image:latest
docker push localhost:5001/my-image:latest

docker build -t my-image:latest .
docker tag my-image:latest 192.168.58.2:64689/my-image:latest
docker push 192.168.58.2:64689/my-image:latest # whatever the minikube ip is, like add $(minikube ip), likely a command for the port too

docker build -t my-image:latest .
docker tag my-image:latest localhost:64689/my-image:latest
docker push localhost:64689/my-image:latest # whatever the minikube ip is, like add $(minikube ip), likely a command for the port too

# what this worked?
docker tag my-image:latest $(minikube ip):5000/my-image:latest
#docker push $(minikube ip):5000/my-image:latest # whatever the minikube ip is, like add $(minikube ip), likely a command for the port too

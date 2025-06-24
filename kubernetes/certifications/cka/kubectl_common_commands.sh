# Working and should be clear
## pods and nodes
kubectl get pods --field-selector spec.nodeName=mk

## contexts
kubectl config current-context
kubectl config get-contexts
kubectl config use-context minikube

# May not be working and still need to be understood
kubectl create deployment nginx-app --image=nginx && kubectl expose deployment nginx-app --type=NodePort --port=80 --name=nginx-service && minikube service nginx-service --url
kubectl expose deployment nginx-apps --type=NodePort --port=8090 --name=nginx-service

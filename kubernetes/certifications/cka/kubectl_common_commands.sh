# Working and should be clear
## pods and nodes
kubectl get pods --field-selector spec.nodeName=mk

## contexts
kubectl config current-context
kubectl config get-contexts
kubectl config use-context minikube

## namespace
kubectl get namespaces
kubectl config set-context --current --namespace=jafaas
kubectl config view --minify | yq '.contexts[].context.namespace'
kubectl config view --minify | grep namespace;

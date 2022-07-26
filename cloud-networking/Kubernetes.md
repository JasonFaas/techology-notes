# Kubernetes

## Common Kubectx commands - TODO: describe what each does
* `kubectx` - all environments currently within access
* `kubectx <environment>` - switch context to environment

## Common Kubectl pods commands - TODO: describe what each does
* `kubectl ...`
* `kubectl get pods -A`
* `kubectl get pods -n <ns>`
* `kubectl describe pod <pod_name>` - get containers in pod
* `kubectl delete pods -n <ns> <pod>`

## Common Kubectl logs commands - TODO: describe what each does
* `kubectl logs <pod_name>` - logs from a pod
* `kubectl logs -n <namespace> <pod>` - logs from a pod
* `kubectl log -f <pod_name>` - logs from a pod
* 
## Common Kubectl namespaces commands - TODO: describe what each does
* `kubectl get namespaces`

## Common Kubectl cm commands - TODO: describe what each does
* `kubectl get cm <hmm...what_is_a_cm> -o yaml` - TODO: What is a cm?

## Common Kubectl config commands - TODO: describe what each does
* `kubectl config get-contexts`

## Common Kubectl secrets commands - TODO: describe what each does
* `kubectl get secrets -n <ns>`
* `kubectl get secrets -n <ns> <secret_name> -o yaml`
* `kubectl edit secrets -n <ns> <secret_name>`

## Common Kubens commands - TODO: describe what each does
* `kubens <namespace>` - this allows programs like stern to run, also don't have to add `-n` to all kubectl commands

## Common stern commands - TODO: describe what each does
* `stern '^<pod_prefix_1>|<pod_prefix_2>.*' -s 1m` - displays logs 1 minute back and everything going forward
  * TODO: Research more of these commands as needed
  * https://github.com/wercker/stern

## Manual creation of Kubernetes
* `kubectl create namespace <ns>`

## Common helm commands
* `helm repo add <hmm> <url>`
* `helm install -f <yaml_file> <hmm> <helm_repo_add_hmm> --namespace=<ns>`

## Hmm, other commands to understand more
* `kubectl drain <nodename>`
* `kubectl delete node <nodename>`
* `kubectl get nodes`
* `kubectl get pods -o wide`
* `kubectl get pods -o wide -n <ns>`
* `kubectl cordon <node>` - ensures no new pods will get scheduled to the node while preparing for removal/maintenance
* `kubectl uncordon <node>` - Once maintenance is finished on a node, allow scheduling on the node again
* `kubectl delete pod <pod> -n <ns>`
* `kubectl get deployment -n <ns>`
* `kubectl get deployment -A`
* `kubectl delete deployment <deployment> -n <ns>`
* `kubectl delete namespace <ns>` - after all pods, deployments, etc are removed
* `kubectl get clusterrole -A` - get all cluster roles
* `kubectl delete clusterrole <cluster_role>` - delete a cluster role. May be needed if a namespace does not cleanup properly after delete.
* `kubectl get clusterrolebinding -A`
* `kubectl delete clusterrolebinding <crb>`
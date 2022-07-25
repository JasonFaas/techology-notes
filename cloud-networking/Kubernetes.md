# Kubernetes

## Common commands - TODO: describe what each does
* `kubectx` - all environments currently within access
* `kubectx <environment>` - switch context to environment
* `kubectl ...`
* `kubectl get pods -A`
* `kubectl describe pod <pod_name>` - get containers in pod
* `kubectl logs <pod_name>` - logs from a pod
* `kubectl log -f <pod_name>` - logs from a pod
* `kubectl get namespaces`
* `kubectl get cm <hmm...what_is_a_cm> -o yaml` - TODO: What is a cm?
* `kubectl config get-contexts`
* `kubens <namespace>` - this allows programs like stern to run, also don't have to add `-n` to all kubectl commands
* `stern '^<prefix_1>|<prefix_2>.*' -s 1m` - displays logs 1 minute back and everything going forward
  * TODO: Research more of these commands as needed
  * https://github.com/wercker/stern
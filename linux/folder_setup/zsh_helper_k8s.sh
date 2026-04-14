alias kubectl-state="kubectl config current-context && echo '\nNodes' && k-g-n && echo '\nTaints' && kubectl-taints && echo '\nDeployments' && k-g-d && echo '\nPods' && k-g-pod && echo '\nPVs' && k-g-pv && echo '\nPVCs' && k-g-pvc && echo '\nServices' && k-g-s && echo '\nEndpoint Slices' && k-g-es && echo '\nNamespaces' && kubectl get ns"
alias kubectl-taints="kubectl get nodes --no-headers -o custom-columns=NAME:.metadata.name | xargs -I {} sh -c \"echo {} && kubectl describe node {} | rg 'Taint' && kubectl get pods --field-selector spec.nodeName={} && echo ''\""
alias kubectl-pods-on-node="kubectl get pods --field-selector spec.nodeName=$1"

alias k-g-s="kubectl get service"
alias k-g-e="kubectl get endpoints"
alias k-g-es="kubectl get endpointslices"
alias k-g-pod="kubectl get pods"
alias k-g-pv="kubectl get pv"
alias k-g-pvc="kubectl get pvc"
alias k-g-n="kubectl get nodes"
alias k-g-d="kubectl get deployment"
alias k-a--f="kubectl apply -f $1"

alias kctl=kubectl
alias kns=kubens
alias kctx=kubectx

#!/bin/bash

echo "1 hour is up"

echo ""
echo '$ echo-time'
echo-time


export NO_PROXY="oidc.eks.us-west-2.amazonaws.com,52C83231B68C5BE63EA1CF35EA003920.gr7.us-west-2.eks.amazonaws.com"

echo "\$ ps"
ps | rg -v "zsh"
echo ""

echo "\$ kubectx # replace with kubectl command"
kubectx
echo ""

# echo "\$ kubectl get nodes"
# kubectl get nodes
# echo ""

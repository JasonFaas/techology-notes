docker ps # this outputs the current registries
# docker rm -f registry_mk # look at the right most column of "NAME"

docker run -d -p 5001:5000 --restart=always --name registry_mk_5001 registry:2
curl http://localhost:5001/v2/_catalog # should return at least empty array like {"repositories":[]} (or maybe more)

docker run -d -p 63520:5000 --restart=always --name registry_mk_63520 registry:2
curl http://localhost:63520/v2/_catalog # should return at least empty array like {"repositories":[]} (or maybe more)

minikube addon enable registry

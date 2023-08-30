# Introduction to K8s
This repository serves as an exploration of the basic usage of Kubernetes. It deploys a simple fastapi endpoint which greets the N-th user of the API. The visitor count is incremented using Redis. The whole application consists of two images: the fastapi server and redis. They are deployed in a single node--Control Node in the local kubernetes cluster thanks to Minikube.

## Try it out
Run your own kubernetes deployments locally.

*Note:
Make sure you have [Docker](https://docs.docker.com/engine/install/), [Kubectl](https://kubernetes.io/docs/tasks/tools/), and [Minikube](https://minikube.sigs.k8s.io/docs/start/) installed.*

1. Clone the repository
```shell
git clone git@github.com:jrpespinas/intro-to-k8s.git
```

2. Start your minikube
```shell
minikube start
```

3. Deploy **deployment** definitions first to create instances of our images
```shell
kubectl create -f deployments/redis-deployment.yaml
kubectl create -f deployments/server-deployment.yaml
```

4. Deploy **service** definitions to expose the server to our localhost and to expose a ClusterIP to our redis
```shell
kubectl create -f deployments/redis-service.yaml
kubectl create -f deployments/server-service.yaml
```

5. Check if the pods are running
```shell
kubectl get pods,svc,deployment
```

6. If the status of the deployments are ready and if the pods are running, access the application through the given URL.
```shell
minikube service hello-service --url
```

7. You should see a similar output like this
```json
{
    "message": "Hello, visitor #1!"
}
```

# Introduction to K8s
This repository serves as an exploration of the basic usage of Kubernetes. It deploys a simple fastapi endpoint which greets the N-th user of the API. The visitor count is incremented using Redis. The whole application consists of two images: the fastapi server and redis. They are deployed in a single node--Control Node in our local kubernetes cluster thanks to Minikube.

## Explain Like I'm 5 (ELI5)

In this repository, we will only tackle three things:
1. Deployment
2. Service
3. Pods

**Pods** are the basic unit of kubernetes, it may contain a few docker images or containers. However, best practice suggest few containers or image as possible.

**Services** are used for communication between pods using a `ClusterIP` and for exposing pods outside the cluster using the `NodePort`

**Deployments** are used to define how many pods can be run, which group of pods to associate itself with, and the specifications of a container. Basically, it keeps the defined number of pods running. When one pod fails, it will spin up a new one with the same specification.

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

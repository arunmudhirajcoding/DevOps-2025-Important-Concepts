# K UBERNETE(8length) S(K8S)

## installation of kubernetes in windows

1. we use chocolety to install kubernetes or any other software
2. choco install kubernetes-cli -y
3. verify: kubectl version --client
4. install docker-desktop
5. choco install minikube -y
6. verify : minikube version

## demo

7. minikube start --driver=docker
8. kubectl cluster-info
9. kubectl get nodes
10. kubectl create deployment hello-k8s --image=kicbase/echo-server:1.0
11. kubectl expose deployment hello-k8s --type=NodePort --port=8080 // to expose deployment out of the docker
12. minikube service hello-k8s //it will o

## local deployment

**concepts**: deployment, Pods, ReplicaSets and scaling with kubectl

1. create pod.yml file in local system
2. minikube start --driver=docker
3. minikube status
4. write yml and run: kubectl apply -f pod.yml

### pods

5. kubectl get pods
6. kubectl describe pod myapp-pod
7. kubectl create deployment myapp-deployment --image=kicbase/echo-server:1.0

### Replicas

8. kubectl scale deployment myapp-deployment --replicas=3

### selector

9. kubectl get pods --selector=department=pizza
10. kubectl delete pod myapp-pod

## services, clusterIP, NodePort, LoadBalancer

1. run docker
2. start minikube for docker
3. kubectl apply -f deployment.yml //without run pod file for best price to reduce duplications
4. kubectl get pods
5. run service-nodeport also
6. kubectl get svc
7. minikube service welcome-service

## volumes in kubernetes (pv and pvc)

1. create yml files
2. use git bash to run minikube
3. kubectl apply -f pv.yml
4. kubectl apply -f pvc.yml
5. kubectl apply -f pod-with-volume.yml
6. check status
7. kubectl get pods and pvc
8. write file:

```
kubectl exec -it pod-with-storage -- sh
# echo "arun was here" > /data/note.txt // writing data
# cat /data/note.txt // read the data
arun was here
# exit

```

9. even after delete the pod, data is still there
10. to check it, run the pod again and check the data by using the same command 8

## handling non sensitive data and sensitive data
1. create configmap.yml and secret.yml files
2. start minikube
3. kubectl appy -f configmap.yml, secret.yml and pod-env.yml
4. kubectl exec -it pizza-pod --sh
```write shell script
# env | grep key1
key1=value1
# env | grep key2
key2=value2
# env | grep DB_PASSWORD
DB_PASSWORD=arunkumarsec
```
## namespace and resource limits
1. create namespace.yml file and pod-limits.yml
2. start minikube
3. run namespace and pod-limits
4. kubectl get pods -n my-namespace
5. kubectl describe pod limited-pod -n my-namespace

## working with aws

## Helm (oackage manager for kubernetes)
1. install helm using choco
```bash
choco install kubernetes-helm -y
```
2. start minikube driver before that start docker engine
3. helm repo add bitnami https://charts.bitnami.com/bitnami // where popular projects found
4. helm repo update
5. helm install my-nginx bitnami/nginx --set service.type=NodePort
6. minikube service my-nginx --url
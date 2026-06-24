# K UBERNETE(8length) S(K8S)

## installation of kubernetes in windows

1. we use chocolety(Package manager for windows) to install kubernetes or any other software
2. choco install kubernetes-cli -y
3. verify: kubectl version --client
4. install docker-desktop
5. choco install minikube -y (minikube manages cluster or nodes)
6. verify : minikube version

## Kubernetes architecture
<img src="./kubernetes-cluster-architecture.svg">

## demo

7. minikube start --driver=docker ( where to run the minikube )
8. kubectl cluster-info
9. kubectl get nodes
10. kubectl create deployment hello-k8s --image=kicbase/echo-server:1.0
11. kubectl expose deployment hello-k8s --type=NodePort --port=8080 // to expose deployment out of the docker

or 

kubectl expose deployment hello-k8s \
  --type=NodePort \
  --port=8080 \
  --target-port=8080
  
12. minikube service hello-k8s //it will run the service of image

## local deployment

**concepts**: deployment, Pods, ReplicaSets(creating pods) and scaling with kubectl

1. create pod.yml file in local system
2. minikube start --driver=docker ( to run the minikube)
3. minikube status
4. write yml and run: kubectl apply -f pod.yml
```yml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
    department: development
spec:
  containers:
    - name: myapp-container
      image: kicbase/echo-server:1.0
      ports:
        - containerPort: 8080
```

### pods (which performs task)

5. kubectl get pods
6. kubectl describe pod myapp-pod
7. kubectl create deployment myapp-deployment --image=kicbase/echo-server:1.0

### Replicas (duplicating pods)

8. kubectl scale deployment myapp-deployment --replicas=3

### selector (selecting pods with labels name)

9. kubectl get pods --selector=myapp
10. kubectl delete pod myapp-pod
10. kubectl delete deployment myapp-deployement

## services(network link), clusterIP(ip inside cluster that cant access outside of cluster even in browser (Eg. backend only interact with frontend)), NodePort(expose to browser), LoadBalancer

1. run docker
2. start minikube for docker
3. create `pod.yml`, `deployment.yml`, `service-nodeport`, `service-loadbalancer.yml`
4. run only deployment file , it automatically create pods
```bash
 kubectl apply -f deployment.yml
```
5. kubectl get pods
6. run service-nodeport also
```bash
 kubectl apply -f service-nodeport.yml
```
7. kubectl get svc (check services)
8. minikube service welcome-service (run services on browser)
9. kubectl delete -f `<YML_FILE_NAME>`
```bash
kubectl delete -f service-nodeport.yml
```
## volumes in kubernetes (pv(storage) and pvc(request to store))

1. create yml files `pv.yml`, `pvc.yml`, `pod-with-volume.yml`
2. use git bash to run minikube
3. kubectl apply -f pv.yml
4. kubectl apply -f pvc.yml
5. kubectl apply -f pod-with-volume.yml
6. check status
```bash
kubectl get pv
```
7. kubectl get pods and pvc
8. write file inside the pod:

```bash
kubectl exec -it pod-with-storage -- sh
echo "arun was here" > /data/note.txt # writing data
cat /data/note.txt # read the data
arun was here
exit
```

9. even after delete the pod, data is still there
10. to check it, run the pod again and check the data by using the same command 8

## handling non sensitive data (configmap) and sensitive data (secret)
1. create `configmap.yml` and `secret.yml` files
2. to create a encrypt run the following command in ubuntu or git bash
```bash
echo -n "supersecret" | base64
echo "encryptValue" | base64 --decode
```

2. start minikube
3. kubectl appy -f configmap.yml, secret.yml and pod-env.yml
4. kubectl exec -it `pod_name` --sh
```bash
env | grep key1
key1=value1
env | grep key2
key2=value2
env | grep DB_PASSWORD
DB_PASSWORD=arunkumarsec
```
## namespace and resource limits
1. create `namespace.yml` file and `pod-limits.yml`
2. start minikube
3. run namespace and pod-limits
4. kubectl get pods -n my-namespace
5. kubectl describe pod limited-pod -n my-namespace

## working with aws
- for reference follow below:
<a href="https://github.com/farzeen-ali/Kubernetes-K8s-Installation-on-Linux-Ubuntu"> check this repo</a>

### deploy React App on kubernetes
- for reference follow below:
<a href="https://github.com/farzeen-ali/Deploy-React-App-on-Kubernetes-AWS-EC2-Ubuntu-Instance"> check this repo</a>


## Helm (package manager for kubernetes)
- for reference follow below:
<a href="https://github.com/farzeen-ali/Helm-Kubernetes-Guide"> check this repo</a>

# DevOps Practice
*:DEVOPS
B:DevOps Commands and Configurations
T:In this lesson, we'll practice typing common DevOps commands, Kubernetes manifests, Docker commands, and Dockerfiles.

I:(1) Basic kubectl Commands
S:# Display information about nodes in the cluster
 :kubectl get nodes

I:(2) Creating and Managing Pods
S:# Create a Pod from a YAML manifest
 : apiVersion: v1
 :kind: Pod
 :metadata:
 :  name: mypod
 :spec:
 :  containers:
 :  - name: mycontainer
 :    image: nginx:latest
 :    ports:
 :    - containerPort: 80
 :EOF

I:(3) Deployments and ReplicaSets
S:# Create a Deployment
 :kubectl create deployment myapp --image=myimage

S:# Scale the Deployment
 :kubectl scale deployment myapp --replicas=3

S:# Get information about Deployments
 :kubectl get deployments

I:(4) Services
S:# Expose a Deployment as a service
 :kubectl expose deployment myapp --type=LoadBalancer --port=80

S:# Get information about Services
 :kubectl get services

I:(5) ConfigMaps and Secrets
S:# Create a ConfigMap from a file
 :kubectl create configmap myconfigmap --from-file=config.txt

S:# Create a Secret from literal values
 :kubectl create secret generic mysecret --from-literal=username=admin --from-literal=password=secretpassword

I:(6) Docker Commands
S:# Build a Docker image
 :docker build -t myimage:latest .

S:# Run a Docker container
 :docker run -d --name mycontainer myimage:latest

S:# List running Docker containers
 :docker ps

I:(7) Dockerfile
S:# Sample Dockerfile for a Node.js application
 :FROM node:14
 :WORKDIR /app
 :COPY package*.json ./
 :RUN npm install
 :COPY . .
 :EXPOSE 3000
 :CMD ["node", "app.js"]

I:(8) Persistent Volumes and Persistent Volume Claims
S:# Create a PersistentVolume
 :kubectl apply -f -
 :apiVersion: v1
 :kind: PersistentVolume
 :metadata:
 :  name: mypv
 :spec:
 :  capacity:
 :    storage: 1Gi
 :  accessModes:
 :    - ReadWriteOnce
 :  hostPath:
 :    path: "/mnt/data"
 :EOF

S:# Create a PersistentVolumeClaim
 :kubectl apply -f -
 :apiVersion: v1
 :kind: PersistentVolumeClaim
 :metadata:
 :  name: mypvc
 :spec:
 :  accessModes:
 :    - ReadWriteOnce
 :  resources:
 :    requests:
 :      storage: 1Gi
 :  selector:
 :    matchLabels:
 :      app: myapp
 :EOF

I:(9) Helm
S:# Install a Helm chart
 :helm install mychart ./mychart

S:# List installed Helm charts
 :helm list

Q:Do you want to continue to the next lesson [Y/N] ?
N:MENU


# End-to-End DevOps Pipeline for Banking Application

## Project Description

This project demonstrates the implementation of a complete DevOps workflow for a Banking Application using modern DevOps tools and Kubernetes orchestration.

The application is containerized using Docker, deployed on Kubernetes through Minikube, automated using Jenkins CI/CD pipelines, monitored using Prometheus, and visualized using Grafana dashboards.

The project showcases how DevOps practices improve automation, deployment efficiency, monitoring, and scalability in modern application development.

---

# Objectives

* Develop a simple banking web application
* Containerize the application using Docker
* Deploy the application using Kubernetes
* Automate deployment using Jenkins CI/CD
* Monitor application and cluster health using Prometheus
* Visualize metrics using Grafana dashboards

---

# Banking Application Features

The Banking Application provides basic banking functionalities including:

* Deposit money
* Withdraw money
* Display account balance
* Interactive user interface
* Real-time balance updates

---

# Technologies and Tools Used

| Tool                  | Purpose                           |
| --------------------- | --------------------------------- |
| HTML, CSS, JavaScript | Frontend application development  |
| GitHub                | Source code management            |
| Docker                | Containerization                  |
| Kubernetes            | Container orchestration           |
| Minikube              | Local Kubernetes cluster          |
| Jenkins               | CI/CD automation                  |
| Prometheus            | Monitoring and metrics collection |
| Grafana               | Dashboard visualization           |

---

# Project Architecture

Developer → GitHub → Jenkins → Docker → Kubernetes → Prometheus → Grafana

### Workflow Explanation

1. Developer pushes source code to GitHub
2. Jenkins pipeline fetches the latest code
3. Docker builds the application image
4. Kubernetes deploys the application containers
5. Prometheus collects monitoring metrics
6. Grafana visualizes metrics through dashboards

---

# Project Structure

```text id="prj1"
sp_369/
│
├── index.html
├── style.css
├── script.js
├── Dockerfile
├── deployment.yaml
├── service.yaml
├── Jenkinsfile
├── README.md
└── monitoring/
```

---

# Docker Implementation

## Build Docker Image

```bash id="prj2"
docker build -t banking-app .
```

This command creates a Docker image containing the banking application and its dependencies.

---

## Load Docker Image into Minikube

```bash id="prj3"
minikube image load banking-app
```

This command loads the Docker image into the Kubernetes cluster.

---

# Kubernetes Deployment

## Deploy Application

```bash id="prj4"
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### deployment.yaml

Used to:

* create pods
* manage replicas
* deploy containers

### service.yaml

Used to:

* expose the application externally
* provide network access using NodePort

---

# Verify Deployment

## Check Pods

```bash id="prj5"
kubectl get pods
```

## Check Services

```bash id="prj6"
kubectl get svc
```

---

# Kubernetes Components

## Cluster

A Minikube local Kubernetes cluster was used.

## Node

The project runs on a single Minikube node which acts as both:

* master node
* worker node

## Pods

The cluster contains multiple pods including:

* Banking Application Pods
* Jenkins Pod
* Grafana Pod
* Prometheus Pod
* Monitoring Pods

Total Pods Running: 9

---

# Jenkins CI/CD Pipeline

Jenkins was used to automate deployment processes.

## Pipeline Stages

### 1. Clone Code

Fetches project source code from GitHub.

### 2. Deploy Application

Deploys the banking application to Kubernetes.

### 3. Verify Deployment

Checks whether Kubernetes pods are running successfully.

---

# Jenkinsfile

```groovy id="prj7"
pipeline {
    agent any

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/ftmneha/banking-app.git'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
```

---

# Monitoring with Prometheus

Prometheus was used for collecting monitoring metrics from Kubernetes components.

## Metrics Monitored

* Pod health
* CPU usage
* Memory usage
* Service availability

## Sample Prometheus Queries

### Service Health

```promql id="prj8"
up
```

### CPU Monitoring

```promql id="prj9"
process_cpu_seconds_total
```

### Memory Monitoring

```promql id="prj10"
node_memory_MemAvailable_bytes
```

---

# Visualization with Grafana

Grafana was integrated with Prometheus for real-time dashboard visualization.

## Dashboard Features

* Real-time monitoring
* Interactive graphs
* CPU usage graphs
* Memory monitoring graphs
* Service health panels

## Visualization Types Used

* Time Series
* Gauge
* Stat Panels

---

# Accessing Services

## Banking Application

```bash id="prj11"
minikube service banking-service
```

## Jenkins

```bash id="prj12"
minikube service jenkins
```

## Grafana

```bash id="prj13"
minikube service monitoring-grafana
```

## Prometheus

```bash id="prj14"
minikube service monitoring-kube-prometheus-prometheus
```

---

# Challenges Faced

* Docker configuration issues
* kubectl connection issues
* Jenkins pipeline configuration
* Prometheus query setup
* Grafana visualization configuration

---

# Solutions Implemented

* Configured Minikube correctly
* Simplified Jenkins pipeline
* Verified Kubernetes services
* Connected Grafana with Prometheus datasource
* Used working Prometheus metrics for visualization

---

# Project Outcome

This project successfully demonstrates:

* End-to-end DevOps workflow
* Containerized application deployment
* Kubernetes orchestration
* CI/CD automation
* Monitoring and visualization
* Real-time dashboard creation

---

# Future Enhancements

* Database integration
* User authentication
* Multi-node Kubernetes cluster
* Cloud deployment
* Terraform infrastructure automation

---

# Author

## Neha Fathima

DevOps Banking Application Project

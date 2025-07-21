###
# DEPLOY ARGOCD APP
# SECTION 1: CREATE CUSTOM CHART IF APPLIED.
###

### BEGIN SECTION 1 ###

# Log into GitHub and create custom chart repository

# Clone your new repo
git clone git@github.com:trueml/trueml-consul.git

# Open your repo using VSCode
cd trueml-consul
code .

# Create folder structure for your custom chart.
mkdir -p k8s/helm/trueml-consul/charts
mkdir -p k8s/helm/trueml-consul/templates

# Create files needed 
cd k8s/helm/trueml-consul
touch Chart.yaml
touch values.yaml

# Add the following content to Chart.yaml
apiVersion: v2
name: trueml-consul
description: Internal TrueML Consul Helm Chart
type: application
version: 0.1.0
appVersion: "1.16.0"
dependencies:
  - name: consul
    version: 1.7.2
    repository: https://helm.releases.hashicorp.com

# Add the following content to values.yaml
global:
  name: consul
  datacenter: dc1
  image: "hashicorp/consul:1.7.2"
  
server:
  replicas: 3
  resources:
    requests:
      cpu: "100m"
      memory: "256Mi"
    limits:
      cpu: "500m"
      memory: "512Mi"

client:
  enabled: true
  resources:
    requests:
      cpu: "100m"
      memory: "256Mi"
    limits:
      cpu: "500m"
      memory: "512Mi"

ui:
  enabled: true
  service:
    type: ClusterIP

storage:
  storageClass: "standard"
  size: "10Gi"

# Save files and commit changes
git add .
git commit -m "Add custom trueml-consul Helm chart"
git push origin main

### END SECTION 1 ###
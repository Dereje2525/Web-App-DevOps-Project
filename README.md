# Introduction 

The main gaol of this project is building a comprehensive end-to-end DevOps pipeline to support the organization's internal web application named "app.py", designed to manage and monitor deliveries across the company.
Order List Page: Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.Fig1
![alt text](image.png)
Add New Order Page: Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.Fig2
![alt text](image-1.png)
To do this changes, we will  implement version control, We will use Docker Hub as the preferred container registry, and will leverage Kubernetes to orchestrate the deployment of the containerized application. Lastly we will employ CI/CD (Continuous Integration/Continuous Deployment) practices to automate the build and deployment of the application, streamlining the development pipeline for efficiency and reliability.
We will add the  delivery_date column  in the backend database.

# Version Control

## Adding new feature.

    • Navigate to the forked repository at https://github.com/<Dereje2525>/Web-App-DevOps-Project
    • Create a new branch called feature/add-delivery-date. 
    • We modify the code to incorporate the delivery_date column. To do this we need to update both the app.py and order.html files in the repository.
    • Push the changes to the remote repository. 
    • Submit a pull request to merge the code changes from the feature branch into the main branch.

## Revert the changes made back.

    • Create a new branch called feature/add-delivery-date. 
    • We modify the code to incorporate the delivery_date column. To do this we need to update both the app.py and order.html files in the repository.
    • Push the changes to the remote repository. 
    • Submit a pull request to merge the code changes from the feature branch into the main branch.

# Containerize web application

## Create a Docker file for the application.
                                                                                               
FROM python:3.10-slim

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \
    apt-get clean

RUN pip install --upgrade pip setuptools

COPY requirements.txt /opt/app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
COPY . /app
 
EXPOSE 5000

CMD ["python", "app.py"]

## Docker Commands:

    • Build Docker Image: docker build -t webapp
    • Run Docker Container Localy:docker run -p 5000:5000 webapp
    • Tag to Docker Hub: docker tag webapp Dere2525/webapp:1.0.0.
    • Push to Docker Hub: docker push webapp Dere2525

# Create Terraform Project  and Modules

## Defining a Network Module

In this module we will define Azure Networking components using Terraform.

We will follow the following steps to create a virtual network using Terraform.

1. We define the configuration of our Virtual Network using the azurerm_virtual_network resource block
2. We will define the subnets associated with the virtual network using the azurerm_subnet resource block.
3. we define Network Security Groups (NSGs) using Terraform's azurerm_network_security_group resource block
4. We will first define a Terraform configuration file (main.tf) that defines a VNet in Azure:

### Inpus Variable

variable "resource_group_name" {
  description = "The name of the created resource group."
  type        = string
}

variable "vnet_id" {
  description = "The ID of the created virtual network"
  type        = string
}

variable "control_plane_subnet" {
   description = "The name of the created subnet 1."
   type        = string
}


variable "resource_group_name" {
  description = "The name of the created resource group."
  type        = string
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space  of the vnet"
}

variable "subnet_address_space" {
  type        = list(string)
  description = "Address space of the subnet"
}
  
variable "location" {
  description = "Location of resource group"
  type = string
  
}  

### Output Variable

output "networking_resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.network_pro.name 
}
output "networking_resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.network_pro.name 
}

output "vnet_id" {
  description = "The ID of the created virtual network."
  value       =  azurerm_virtual_network.vnet.id
}

output "control_plane_subnet_id" {
  description = "The ID of the created subnet 1."
  value       = azurerm_subnet.ask_subnet_1.id
}

output "worker_node_subnet_id" {
  description = "TheID of the created subnet 2."
  value       =  azurerm_subnet.ask_subnet_2.id
}

output "resource_group_name" {
  description = "Name of the Azure Resource Group for networking resources."
  value       = azurerm_resource_group.network_pro.name
}
output "aks_nsg_id" {
  description = "ID of the Network Security Group (NSG) for AKS."
  value       = azurerm_network_security_group.nsg.id
}

## Defining an ASK Cluster with IaC

In this module we will define the Terraform configuration for creating an AKS cluster. We will create the following files :variables.tf outputs.tf.tf and main.tf and we will use the following input variables to configure and create the AKS cluster resources in the main.tf file.

1. The aks_cluster_name variable specifies the name of the AKS cluster that will be created
2. The cluster_location defines the Azure region where the AKS cluster will be created
3. The dn_prefix sets the DNS prefix for the AKS cluster, which is used to create a unique DNS name for the cluster
4. The kubernetes_version specifies the version of Kubernetes to be used for the AKS cluster
5. The service_principal_client_id is the Client ID of the service principal used for authenticating and managing the AKS cluster
6. The service_principal_client_secret specifies the Client Secret associated with the service principal used for AKS cluster 

## Input Variable

variable "cluster_location" {
  type        = string
  description = "Location of resource groupr"

}

variable "location" {
  type        = string
  description = "Location of resource groupr"

}

variable "aks_cluster_name" {
  type        = string
  description = "The name of ASK cluster"

}

variable "dns_prefix" {
   type        = string
   description = "DNS prefix of cluster"


}

variable "kubernetes_version" {
   type        = string
   description = "Kebernetes version" 


} 

variable "service_principal_client_id" {
  type = string
  description = "service principal client ID"

}
variable "service_principal_client_secret" {
  type = string
  description = "service principal client Secret"

}

variable "resource_group_name" {
  type = string
  description = "The name of the created resource group."

}

variable "vnet_id" {
  type = string
  description = "The id of the created virtual network."
  
}

variable "control_plane_subnet_id" {
  type =string
  description = "The ID of the created subnet 1."
  
}

variable "worker_node_subnet_id" {
  type = string
  description = "The ID of the created subnet 2."
  
}

variable "vm_size" {
  type = string
  description = "The Virtul Machine Size."
  
}



### Output Variable

output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.ask-cluster.name
}


output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.ask-cluster.name
}


output "ask_cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.ask-cluster.id
}

output "aks_kubeconfig" {
  description = "Kubeconfig file for accessing the AKS cluster."
  value       = azurerm_kubernetes_cluster.ask-cluster.kube_config_raw
}


# Define The project main configuration.

 We will define the main configuration for your project, and we use  the networking module and the AKS cluster module to provision the necessary Azure resources.

 We will use variables for client_id which is the access key for the provider" and client_secret which is the secret key for the provider, which we will store in environment variables to avoid encoding them.
 We will use the network module to provide the necessary network resources for your AKS cluster and we will also use the AKS cluster module to define and provision your AKS cluster as shown in the main.tf file.

## Creating a main.tf 

# Configure the Microsoft Azure Provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  
  features {}
  
    client_id          = var.client_id
    client_secret      = var.client_secret
    subscription_id    = "dfe66b53-7ab5-4f19-8786-668ac367b573"
    tenant_id          = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
  
 
}
   
module "networking" {

  source  = "./networking-module"
 
  resource_group_name         = "networking-resource-group"
  location                    = "UK South"
  vnet_address_space          = ["10.10.0.0/16"]
  subnet_address_space        = ["10.0.1.0/24"]
  
  
}
 
module "aks_cluster" {
 
  source               = "./aks-cluster-module"
  location             = "UK South"
  cluster_location     = "UK South"
  aks_cluster_name     = "terraform-aks-cluster"
  kubernetes_version   = "1.26.6"
  service_principal_client_id       = var.client_id
  service_principal_client_secret   = var.client_secret
  resource_group_name               = module.networking.networking_resource_group_name
  control_plane_subnet_id           = module.networking.control_plane_subnet_id
  worker_node_subnet_id             = module.networking.worker_node_subnet_id
  dns_prefix            = "myaks-project"
  vnet_id               = module.networking.control_plane_subnet_id
  vm_size               = "Standard_DS1_v2"
 
}


# Kebernetes deployment to AKS

Kubernetes Deployment is the process of providing declarative updates to Pods and ReplicaSets, It allows users to declare the desired state in the manifest (YAML), and the controller will change the current state to the declared state.

## Define the Deployment 

A Deployment provides declarative updates for Pods and ReplicaSets.

The replicas key sets the number of instances of the pod that the deployment should keep alive.
The label selector  tell the deployment which pods are part of the deployment. This essentially says "all the pods matching these labels are grouped in our deployment.
The template object.It’s essentially a pod template jammed inside our deployment spec. When the deployment creates pods, it will create them using this template!
The containers section defines the container details such as: Docker image label and the container port

apiVersion: apps/v1
kind: Deployment
metadata:
  name: flask-app-deployment
  labels:
    app: flask-app
spec:
  replicas: 2
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0
  selector:
    matchLabels:
      app: flask-app
  template:
    metadata:
      labels:
        app: flask-app
    spec:
      containers:
      - name: mycontainername
        image: dere230/webapp:latest
        ports:
        - containerPort: 5000

# Define the Services

A Kubernetes Service offers an abstraction and a stable endpoint to expose a group of Pods over the network, allowing communication between various components of an application and external users.
We will use ClusterIP Service  to exposes the application such that it is only reachable from within the Kubernetes cluster. 


    The kind is the type of Kubernetes object defined.
    The spec.type is ClusterIP. 
    The ports section is an array, so you can define multiple TCP 
    The port specifies the Service's port number.
    The targetPort specifies the port number of the container in which the application is running.
    The spec. Selector section defines the selectors to match the Pod labels.


apiVersion: v1
kind: Service
metadata:
  name: flask-app-service 
spec:
  type: ClusterIP
  selector:
    app: flask-app
  ports:
    - port: 80
      targetPort: 5000
      protocol:   TCP


## Deploying the Kubernetes manifests to your AKS cluster

Steps  taken to define the Deployment and Service manifests for the application

1.Create a deployment from the application-manifest.yaml 
 $ kubectl create -f application-manifest.yaml
2.Check if replicas are running successfully
 $ kubectl get deploy -l app=flask-app
3.Check the ReplicaSets of our deployment
 $ kubectl get rs -l app=flask-app
4.Display the pods which are a part of this deployment
 $ kubectl get po -l app=flask-app
5.Check complete details of the deployment that we just created
 $ kubectl describe deploy flask-app-deployment

## Deployment Strategy

WE will use the Rolling Update Deployment strategy with  replace the pods, one by one, of the previous version of our application with pods of the new version without any cluster downtime.


## Testing and Validation

Verifying the status and details of your pods and services within the AKS cluster. Ensuring that the pods are running, and the services are correctly exposed within the cluster. 
1.First get our application container running.
$ kubectl apply -f ./manifests/pod-app.yaml
Checking  the status of our Pods with:
$ kubectl get pods
Display information about your ReplicaSet objects
$ kubectl get replicasets
$ kubectl describe replicasets
2.Create a Service object that exposes the deployment
$ kubectl expose deployment flask-app-deployment --type=ClusterIP  --name=example-service
Display information about the Service:
$ kubectl describe services example-service
3.Port forwarding 
$ kubectl port-forward flask-app-deployment-5f9fc7c7dd-gc722 5000:5000. 
This command establishes a secure channel for the application, allowing you to interact with it locally. With port forwarding implemented, the web application hosted within the AKS cluster can be accessed locally at http://127.0.0.1:5000

# CI/CD Pipeline With Azure DevOP  

Building an Azure CI/CD pipeline involves several steps that allow  to define, automate, and manage application’s continuous integration and deployment process.A CI/CD pipeline can be divided into four main stages:
    1. Source 
    2. Build 
    3. Test 
    4. Deployment  
    
## Steps to Create an Azure CICD Pipeline:

    1. Access Azure DevOps: Log in to  Azure DevOps account.
    2. Create a New Pipeline: Navigate to  project. Go to “Pipelines” from the left sidebar. Click on the “New Pipeline” button.
    3. Select a Repository: Choose the repository that contains  application code in git:Dereje2525/Web-App-DevOps-Project
    4.Review your pipeline YAML.Dereje2525/Web-App-DevOps-Project/azure-pipelines.yml and select run.
    5. Go to project seting and select Github conection to establish integration with Docker Hub.
    Go to service conecction and selecte new selection and select Kebernetes to establish AKS integretion
    6. We used Test analytics wiche provides near real-time visibility into  test data for builds and releases.The top-level view provides a summary of the test pass rate and results for the selected build pipeline and test release, access test analytics from the Analytics link at the top right corner the summary provides an aggregated view of the test pass rate and results for the specified period.
    7. Review and Save: Review the pipeline configuration to ensure everything is set up correctly. Save and commit the pipeline configuration to your repository.
    8. Run and Monitor the Pipeline: Trigger the pipeline manually  on the defined triggers. Monitor the pipeline’s progress and review logs to identify any issues.

# AKS cluster monitoring 

## Metrics Explorer charts used to monitor the AKS cluster

Chart 1: Average Nodes CPU Usage last 24 hours.
![alt text](image1.png)
Chart 2: Average Pod Count
![alt text](image2.png)

Chart 3: Used Disk Percentage
![alt text](image3.png)
Chart 4: Bytes Read and Written per Second
![alt text](image4.png)

#Log Analytics

To query logs is a powerful tool used in Azure to retrieve and analyze data from a  workspace. 

Example to retrieve information about displaying the 50 top activitiy log events
![alt text](<Screenshot from 2024-04-11 08-01-40.png>)

# Set up an alert rule

The alert is checked every 5 minutes and have a loopback period of 15 minutes. The alert is configured to send notifications to email address, so we can determine what is the best strategy for responding to these alarms.

# Secrets management and  Integrating Azure Key Vault with AKS

## Secrets management

Azure Key Vault is a robust solution for the secure storage and management of sensitive information. It is designed to address the challenges associated with managing sensitive information in modern applications, providing a centralized and scalable platform for safeguarding critical information.

### Steps taken to creating an Azure Key Vaul

1. Creating a service principal:We create a new service connection from the project settings page named "key connection".
2. Create key vault named "MyDevopkey" :We have a python app that connects to a MySQL database where we will store the password for the MySQL database as a secret in the key vault.
3.We configured Azure role-based access control. we will select Key Vault Administrator from the list, to provision the desired user with full control over the Key Vault.
4. Adding and Managing Secrets in Key Vault. Adding secrets to Azure Key Vault is a vital step in securing sensitive data effectively. We add  a new secret named "test1"

## Integrating Azure Key Vault with AKS

### Steps taken to integrate AKS with Key Vaul

1.Managed Identity is a crucial security feature in Azure designed to simplify the authentication and authorization processes for applications and services. We creat  System-assigned Managed Identity named "myUserAssignedIdentity"
2.To enable Managed Identity for an AKS cluster: az aks update --resource-group networking-resource-group --name terraform-aks-cluster --enable-managed-identity
3.Assigning Key Vault Permissions:We will  assign the necessary RBAC role to the Managed Identity of an AKS cluster, therefore granting AKS the necessary permissions to interact securely with Azure Key Vault. We will assign the Key Vault Secrets Officer role to the Managed Identity. This role provides permissions to read, list, set and delete secrets, certificates, and keys within the specified Azure Key Vault.
4.Modifying Python Application Code:integrating the applications with Azure Identity and Azure Key Vault libraries, AKS-hosted applications can securely retrieve sensitive information from Azure Key Vault.This approach replaces the need for hard-coding sensitive information within your application, introducing a more secure and dynamic credential management strategy. 

# Software dependencies

flask==2.2.2
pyodbc==4.0.39
SQLAlchemy==2.0.21
werkzeug===2.2.3 
azure-core==1.30.1
msal-extensions==1.1.0
msal==1.28.0
packaging==24.0 
portalocker==2.8.2
azure-keyvault-secrets==4.8.0
isodate==0.6.1

# Using
To run the application, you simply need to run the app.py script in this repository. Once the application starts you should be able to access it locally at http://127.0.0.1:5000. Here you will be meet with the following two pages:

Order List Page: Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

Add New Order Page: Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.



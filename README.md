# Introduction 
The main gaol of this project is building a comprehensive end-to-end DevOps pipeline to support the organization's internal web application, designed to manage and monitor deliveries across the company.
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

variable "worker_node_subnet" {
  description = "The name of the created subnet 2."
  type        = string
}
variable "networking_resource_group_Name" {
  description = "The name of the created subnet 2."

}
variable "aks_nsg" {
  description = "The name of the aks-nsg."
  type        = string
} 

variable "address_space" {
  type        = list(string)
  description = "CIDR of the vnet"
}

  
variable "location" {
  description = "Location of resource group"
  type = string
  
}  
variable "kubernetes_version" {
  description = "The kubernetes_version"
  type = string
  default = "1.26.6"
}   

### Output Variable
output "networking_resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.network_pro.name 
}

output "vnet_id" {
  description = "The ID of the created virtual network."
  value       =  azurerm_virtual_network.my_ask_net.id
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
  value       = azurerm_resource_group.rg-name.name
  description = "Resource group name"
}
output "aks_nsg_id" {
  description = "The ID of the aks-nsg."
  value       = azurerm_network_security_group.nsg.id
  
} 

## Defining an ASK Cluster with IaC
### Input Variable
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
  type =string
  description = "service principal client ID"

}
variable "service_principal_secret" {
  type =string
  description = "service principal client Secret"

 }

variable "resource_group_name" {
  type =string
  description = "The name of the created resource group."

}

variable "vnet_id" {
  type =string
  description = "The id of the created virtual network."
  
}

variable "control_plane_subnet_id" {
  type =string
  description = "The ID of the created subnet 1."
  
}

variable "worker_node_subnet_id" {
  type =string
  description = "The ID of the created subnet 2."
  
}

variable "aks_nsg_id" {
  type =string
  description = "The name of the aks-nsg."
 
}

variable "vm_size" {
  type        = string
  description = "vm size"
}
variable "address_space" {
  type        = list(string)
  description = "CIDR of the 
}
### Output Variable
output "ask_cluster_name" {
  description = "The name of provisioned cluster."
  value = azurerm_kubernetes_cluster.ask-cluster.name
}

output
 "ask_cluster-id" {
  description = "ID of the AKS Cluster"
  value = azurerm_kubernetes_cluster.ask-cluster.id
}

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks-cluster]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.aks-cluster.kube_config_raw
}



# Define The project main configuration.
## Creating a main.tf 


provider "azurerm" {
  
  features {}
  
    client_id          = "${var.client_id}"
    client_secret      = "${var.client_secret}"
 


  
}  
module "networking-module" {

  source  = "./networking-module"
 
  resource_group_name   = var.resource_group_name
  location              = var.location
  address_space         = var.vnet_address_space
  vnet_id               = var.vnet_id
  control_plane_subnet  = var.control_plane_subnet
  worker_node_subnet    = var.worker_node_subnet
  aks_nsg               = azurerm_network_security_group.nsg.name
  networking_resource_group_Name = var.networking_resource_group_Name
  
}
 
module "cluster-module" {
 
  source  = "./aks-cluster-module"
  location = var.location
  aks_cluster_name = var.aks_cluster_name
  service_principal_client_id = var.client_id
  service_principal_secret    = var.client_secret
  resource_group_name = module.networking-module.resource_group_name
  vm_size               = var.vm_size
  address_space         = var.vnet_address_space
  control_plane_subnet_id = module.networking-module.azurerm_subnet.ask_subnet_1.id
  worker_node_subnet_id = module.networking-module.azurerm_subnet.ask_subnet_2.id
  kubernetes_version    = var.kubernetes_version
  aks_nsg_id            = var.aks_nsg_id
  dns_prefix            = var.dns_prefix
  vnet_id               = module.networking-module.azurerm_virtual_network.my_ask_net.id
 
}
 


# Kebernetes Deployment to ASK
# CI/CD Pipeline With Azure DevOP  
 

1.	Installation process
#	Software dependencies

    flask (version 2.2.2)
    pyodbc (version 4.0.39)
    SQLAlchemy (version 2.0.21)
    werkzeug (version 2.2.3)

3.	Latest releases
4.	API references

# Using
To run the application, you simply need to run the app.py script in this repository. Once the application starts you should be able to access it locally at http://127.0.0.1:5000. Here you will be meet with the following two pages:

Order List Page: Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

Add New Order Page: Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.



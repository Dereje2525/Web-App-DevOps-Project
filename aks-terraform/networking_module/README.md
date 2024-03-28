# Introduction 
The main gaol of this project is building a comprehensive end-to-end DevOps pipeline to support the organization's internal web application, designed to manage and monitor deliveries across the company.
Order List Page: Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.Fig1
![alt text](image.png)
Add New Order Page: Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.Fig2
![alt text](image-1.png)
To do this changes, we will  implement version control, we will allow our team to work collaboratively,integrating new features into the web application. We will use Docker Hub as the preferred container registry, and will leverage Kubernetes to orchestrate the deployment of the containerized application. Lastly we will employ CI/CD (Continuous Integration/Continuous Deployment) practices to automate the build and deployment of the application, streamlining the development pipeline for efficiency and reliability.
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


# Create Terraform Project  and Modules

## Defining a Network Module
### Defining a Network Module
### Defining Network Resources and NSG Ruls
### Defining The Network Module output variable
## Defining an ASK Cluster with IaC
### Defining The Cluster Module input Variable
### Defininig Cluster Resources
### Defining The Cluster Module Output Variable
# Define The project main configuration.
## Creating a main.tf 
# Integrate the network module
## Integrate the cluster module
## Integrate the cluster module
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



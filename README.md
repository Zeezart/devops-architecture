# Bertflix DevOps Infrastructure

This repository contains the **DevOps infrastructure and deployment automation** for the Bertflix application.

This is the link to the original application repo https://github.com/berthutapea/mern-movie.git.
The application code is in the APP folder
The DEVOPS folder focuses on **containerization, infrastructure provisioning, deployment automation, and CI/CD pipelines** used to run the application in the cloud.

---

## Project Overview

This project demonstrates a full DevOps workflow using modern cloud and automation tools.

The goal was to design and implement an automated infrastructure capable of:

* Provisioning cloud infrastructure
* Containerizing application services
* Deploying services across multiple virtual machines
* Automating configuration with infrastructure-as-code
* Implementing a CI/CD pipeline for automated builds and deployments

---

## Application Architecture

The application consists of three main services:

* **Frontend** – React application
* **Backend** – Node.js API server
* **Database** – MongoDB

These components are deployed on separate virtual machines within a private network.

---

## Infrastructure Architecture

User
↓
Frontend VM
↓
Backend VM
↓
MongoDB VM

Infrastructure components include:

* VPC network
* Subnets
* Firewall rules
* Compute Engine instances

All infrastructure is provisioned using infrastructure-as-code.

---

## DevOps Stack

The project uses the following technologies:

* Terraform – infrastructure provisioning
* Docker – containerization
* Ansible – configuration management and deployment
* GitHub Actions – CI/CD pipeline
* Google Cloud Platform – cloud provider
* Artifact Registry – container image storage

---

## Infrastructure Provisioning

Infrastructure is provisioned using Terraform.

Terraform creates:

* Virtual Private Cloud (VPC)
* Subnets
* Firewall rules
* Compute Engine instances
* Network configuration

This ensures the infrastructure is **repeatable, version-controlled, and automated**.

---

## Containerization

The application services are containerized using Docker.

Separate images are built for:

* Frontend
* Backend
* MongoDB

Images are stored in Google Cloud Artifact Registry.

---

## Configuration Management

Ansible is used to configure the virtual machines and deploy containers.

Automation includes:

* Installing Docker on instances
* Authenticating with Artifact Registry
* Pulling container images
* Running containers
* Managing application services

---

## CI/CD Pipeline

A CI/CD pipeline is implemented using GitHub Actions.

The pipeline performs the following steps:

1. Trigger on code push
2. Build Docker images
3. Push images to Artifact Registry
4. Deploy updated containers to the infrastructure

This enables automated and repeatable deployments.

---

## Repository Structure

Devops/terraform/
Contains infrastructure provisioning code.

Devops/ansible/
Contains playbooks and roles used for server configuration and deployment.

Dockerfile (within the app folder)
Contains Dockerfiles for container images.

.github/workflows/
Contains CI/CD pipeline configuration.

---

## Disclaimer

The application source code was developed by a different team.

---

## Learning Objectives

This project demonstrates practical experience with:

* Infrastructure as Code
* Containerization
* Configuration Management
* Cloud Networking
* CI/CD Automation
* Multi-service application deployment

---

## Future Improvements

Potential enhancements include:

* Reverse proxy with Nginx
* Load balancing
* HTTPS configuration
* Kubernetes deployment
* Monitoring and logging stack

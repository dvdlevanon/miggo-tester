
# Simple Python Tester for Miggo

This directory contains the simplest Python tester to verify that Miggo is working.

## Overview

This tester emulates a user's application with a simple Python server that listens to HTTP requests at the `/rolldice` endpoint. When called, it chooses a random number and returns it in the response. The purpose of the code is to allow Miggo to instrument this HTTP call and create spans, ensuring that Miggo is functioning correctly.

This directory includes:
- A Dockerfile to wrap the simple application.
- Kubernetes resources to deploy the Docker image into a Kubernetes environment.
- Bash scripts to help deploy, build, and manage the application in Minikube.

Directory Contents
- **app.py:** Contains the application code.
- **Dockerfile:** Wraps app.py in a Docker image.
- **deploy.yaml:** Deploys the Docker image as a Kubernetes deployment.
- **service.yaml:** Exposes the Kubernetes deployment as a load balancer.
- **image-pull-secrets.yaml:** Contains the image pull secrets to pull from Miggo's private Docker registry (user needs to prepare it).
- **docker-build.sh:** Builds the Dockerfile in Minikube.
- **apply.sh:** Installs the application to Kubernetes.
- **delete.sh:** Uninstalls the application from Kubernetes.
- **port-forward.sh:** Exposes the application endpoint from Minikube to localhost.
- **call-rolldice.sh:** Calls the rolldice endpoint of the exposed application.
- **patch.sh:** Adds the Miggo annotation to the deployment for instrumentation.

## Basic Usage

Follow these steps to deploy and test the application:

1. Install and start [Minikube](https://minikube.sigs.k8s.io/docs/start) locally.
2. Run `./docker-build.sh` to build the image inside Minikube.
3. Run `./deploy.sh` to deploy the application to Minikube.
4. Run `./port-forward.sh` followed by ./call-rolldice.sh in another shell to call the HTTP endpoint.
5. Run `./patch.sh` to allow Miggo to instrument the application.

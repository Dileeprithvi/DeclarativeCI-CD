#!/bin/bash

# Added || true - The true command's sole purpose is to return a successful exit status.

# Stopping the Docker container SpringbootApp if it running
sudo docker stop SpringbootApp || true	

# Removing all the Docker images 
sudo docker rmi -f $(docker images) || true 

# Removing the Docker container SpringbootApp
sudo docker rm -f SpringbootApp || true  

#!/bin/bash
sudo docker stop SpringbootApp || true	    
sudo docker rmi -f $(docker images) || true  
sudo docker rm -f SpringbootApp || true  

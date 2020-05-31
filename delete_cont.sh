#!/bin/bash
sudo docker stop SpringbootApp || true	    
sudo docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | egrep 'springboot|tomcat') || true    
sudo docker rm -f SpringbootApp || true  

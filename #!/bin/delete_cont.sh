#!/bin/bash
if [ "$(docker ps -q -f name=SpringbootApp)" ]; then
        echo "Deleting the container"
        docker rm -f SpringbootApp
    else
    echo " no container running"
fi

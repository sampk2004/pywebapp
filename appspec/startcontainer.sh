#!/bin/bash
$(aws ecr get-login --no-include-email --region us-east-1)
docker pull 012128242757.dkr.ecr.us-east-1.amazonaws.com/sampk2004/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 012128242757.dkr.ecr.us-east-1.amazonaws.com/sampk2004/pywebapp:latest

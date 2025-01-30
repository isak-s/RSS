#!/bin/bash

# Variables
APP_NAME="rss"         # Name of the app/repository
DOCKER_USERNAME="sputlas1" # Your Docker Hub username
TAG="latest"               # Tag for the Docker image

# Remove all previous containers using the 'overlov' image
echo "Stopping and removing any existing containers using the $APP_NAME image..."
docker ps -a --filter "ancestor=$APP_NAME:$TAG" --format "{{.ID}}" | xargs -r docker stop
docker ps -a --filter "ancestor=$APP_NAME:$TAG" --format "{{.ID}}" | xargs -r docker rm

# Build the Docker image
echo "Building Docker image..."
docker build -t $APP_NAME:$TAG .

docker run -p 8080:8080 $APP_NAME:$TAG
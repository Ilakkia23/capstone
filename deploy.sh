#!/bin/bash

# Function to build and push Docker image to dev repo
build_and_push_dev_image() {
    # Docker login (replace "your-dockerhub-username" and "your-dockerhub-password" with your credentials)
    docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD

    # Run build script to build Docker image
    ./build.sh

    # Tag the built image
    docker tag $DOCKER_IMAGE_NAME:latest $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME:dev

    # Push the tagged image to dev repo on Docker Hub
    docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME:dev
}

# Check if the branch is dev
if [ "$BRANCH_NAME" = "dev" ]; then
    echo "Building and deploying to dev branch..."
    build_and_push_dev_image
else
    echo "Branch is not dev. No deployment will be done."
fi

#!/bin/bash

# Function to build and push Docker image to dev repo
build_and_push_dev_image() {
    # Docker login (replace "your-dockerhub-username" and "your-dockerhub-password" with your credentials)
    docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD

    # Run build script to build Docker image
    ./build.sh

    # Tag the built image
    docker tag myreactimg  $DOCKERHUB_USERNAME/dev

    # Push the tagged image to dev repo on Docker Hub
    docker push $DOCKERHUB_USERNAME/dev
}

# Check if the branch is dev
if [ $GIT_BRANCH == "origin/dev" ]; then
    echo "Building and deploying to dev branch..."
    build_and_push_dev_image
else
    echo "Branch is not dev. No deployment will be done."
fi

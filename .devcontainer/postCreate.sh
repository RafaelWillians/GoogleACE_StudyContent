#!/bin/bash
 
gnome-terminal -- bash -c "gcloud auth login && gcloud config set project $(gcloud projects list --format='value(projectId)' --limit=1); exec bash"

# echo "init"

# # Authenticate to gcloud
# gcloud auth login

# # Set the default project for the user
# gcloud config set project $(gcloud projects list --format='value(projectId)' --limit=1)

# $SHELL
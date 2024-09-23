#!/bin/bash

# Log in to Google Cloud
gcloud auth login

# Set the project
gcloud config set project $(gcloud projects list --format="value(projectId)" --limit=1)
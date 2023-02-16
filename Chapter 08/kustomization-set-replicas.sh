#!/bin/bash

# This will create a kustomization.yaml file
# The increase in replicas will applied to the deployment as a patch.

# Create a patch set_replicas.yaml
cat <<EOF > set_replicas.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gitops-deployment
spec:
  replicas: 3
EOF

cat <<EOF >./kustomization.yaml
resources:
- chap-8-gitops-deploy.yaml
patchesStrategicMerge:
- set_replicas.yaml
EOF

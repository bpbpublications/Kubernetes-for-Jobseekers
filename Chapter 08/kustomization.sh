#!/bin/bash

# Create a kustomization.yaml file
# This file is used to define the resources to be customized
# we will use the pod definition we used to demonstrate ConfigMap and Secret
# as the pod that must be created.
cat <<EOF >./kustomization.yaml
resources:
- chap-8-gitops-deploy.yaml
configMapGenerator:
- name: db-config
  literals:
  - db_connection_string="postgresql+psycopg2://app_user:{password}@dbhost/mydb"
  - db_user="app_user"
  - db_host="dbhost"
  - DB_NAME="mydb"
secretGenerator:
- name: db-password
  literals:
  - username=admin
  - password="My$u&4du5er$ecr%8"
EOF

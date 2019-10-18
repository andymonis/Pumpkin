#!/usr/bin/env bash

#
# Create directory and file for AWS credentials 
# Taken directly from Pumpkin-Gen
# AMONIS 2019
#

mkdir -p ~/.aws

cat > ~/.aws/credentials << EOL
[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}
EOL
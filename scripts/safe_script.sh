#!/bin/bash

set -e  # Encounter error then exit the script

mkdir /tmp/devops-test || echo "Directory already exists"
cd /tmp/devops-test || echo "Cannot browse Directory"
touch /tmp/devops-test/file1.txt || echo "Cannot create a file"

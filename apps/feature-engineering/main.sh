#!/bin/bash

# Execute spark job for feature engineering 
docker exec -it $(docker ps | grep namenode | awk '{print $1}') /bin/bash -c \
"spark-submit /opt/testing/feature-engineering/main.py"

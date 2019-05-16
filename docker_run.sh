#!/bin/bash

docker run -v /home/wh-adm/docker_results:/results \
   -it cbrennan/orthofinder \
   /bin/bash


   #-u `id -u $USER` \

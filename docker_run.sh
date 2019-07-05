#!/bin/bash

docker run \
-v /home/wh-adm/results:/results \
-u `id -u $USER` \
-w=/tmp \
cbrennan/orthofinder:latest \
orthofinder -f /results -S diamond -M msa -A mafft -T fasttree




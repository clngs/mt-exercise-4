#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

models=$base/models
configs=$base/configs

mkdir -p $models

num_threads=10
#device=0

# measure time

SECONDS=0

logs=$base/logs


mkdir -p $logs

for model_name in "deen_transformer_regular_post" "deen_transformer_regular_pre" 
do
    echo "training $model_name"
    mkdir -p $logs/$model_name
    OMP_NUM_THREADS=$num_threads python3.10 -m joeynmt train $configs/$model_name.yaml > $logs/$model_name/out 2> $logs/$model_name/err
    echo "time taken:"
    echo "$SECONDS seconds"
done


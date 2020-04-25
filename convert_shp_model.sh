#!/bin/bash

####################
####################

source /opt/intel/openvino/bin/setupvars.sh

pushd ./models/public/single-human-pose-estimation-0001/single-human-pose-estimation-0001

python3 /opt/intel/openvino/deployment_tools/tools/model_downloader/pytorch_to_onnx.py \
	--model-name=SinglePersonPoseEstimationWithMobileNet \
	--weights=single-human-pose-estimation-0001.pth \
	--input-shape=1,3,384,288 \
	--output-file=single-human-pose-estimation-0001.onnx\
       	--output-names=heatmaps0,heatmaps1,heatmaps2,heatmaps3,heatmaps4,heatmaps \
	--input-names=data \
	--import-module=models

echo "=====================CONVERT to ONNX SUCCEED============================"
echo "====================================================="

python3 /opt/intel/openvino/deployment_tools/model_optimizer/mo_onnx.py\
       	--input=data \
	--mean_values=data[123.675,116.28,103.53] \
	--scale_values=data[58.395,57.12,57.375] \
	--input_model=single-human-pose-estimation-0001.onnx

echo "=====================CONVERT to IR SUCCEED============================"
popd

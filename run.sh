#!/bin/bash

###########################
# Configure here
DETECTOR_MODEL_PATH=./models/intel/pedestrian-detection-adas-0002/FP16/pedestrian-detection-adas-0002.xml
ESTIMATOR_MODEL_PATH=./models/public/single-human-pose-estimation-0001/single-human-pose-estimation-0001/single-human-pose-estimation-0001.xml
INPUT_FILE=/home/hd/Pictures/dinasor.jpg
ACCELERATOR=CPU
###########################

### Do not change here

source /opt/intel/openvino/bin/setupvars.sh


python3 shp_demo.py \
	-m_od $DETECTOR_MODEL_PATH\
	-m_hpe $ESTIMATOR_MODEL_PATH\
	-i $INPUT_FILE\
	--person_label 1\
	--device $ACCELERATOR




#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")  # Corrected space between `date` and `+`
comment="1fps_far_param"
for i in 0
do
RESULT_PATH_KITTI="../../results/photo/kitti/stereo/${timestamp}_${comment}"
mkdir -p $RESULT_PATH_KITTI
../bin/kitti_stereo \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Kitti/93_stereo.yaml \
    ../cfg/gaussian_mapper/RGB-D/Kitti/kitti_tuned.yaml \
    ../../dataset/kitti_93 \
    $RESULT_PATH_KITTI 

done


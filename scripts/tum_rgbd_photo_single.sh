#!/bin/bash

for i in 0
do

RESULT_PATH_FR1_ROOM="../../results/photo/tum_rgbd_single/rgbd_dataset_freiburg1_room"
mkdir -p $RESULT_PATH_FR1_ROOM
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg1_desk.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg1_room \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/fr1_room.txt \
    $RESULT_PATH_FR1_ROOM \
    no_viewer
done

#!/bin/bash


for i in 0 1 2
do
RESULT_PATH_FR1="../../results/photo/tum_rgbd_$i/rgbd_dataset_freiburg1_desk"
mkdir -p $RESULT_PATH_FR1
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg1_desk.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg1_desk \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg1_desk.txt \
    $RESULT_PATH_FR1 \
    no_viewer

RESULT_PATH_FR1_ROOM="../../results/photo/tum_rgbd_$i/rgbd_dataset_freiburg1_room"
mkdir -p $RESULT_PATH_FR1_ROOM
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg1_desk.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg1_room \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/fr1_room.txt \
    $RESULT_PATH_FR1_ROOM \
    no_viewer

RESULT_PATH_FR2="../../results/photo/tum_rgbd_$i/rgbd_dataset_freiburg2_xyz"
mkdir -p $RESULT_PATH_FR2
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg2_xyz.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg2_xyz \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg2_xyz.txt \
    $RESULT_PATH_FR2 \
    no_viewer

RESULT_PATH_FR3="../../results/photo/tum_rgbd_$i/rgbd_dataset_freiburg3_long_office_household"
mkdir -p $RESULT_PATH_FR3
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg3_long_office_household.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg3_long_office_household \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg3_long_office_household.txt \
    $RESULT_PATH_FR3 \
    no_viewer
done

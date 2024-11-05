#!/bin/bash


for i in 0 1
do
RESULT_PATH_FR1 = "../../results/orb/tum_rgbd_$i/rgbd_dataset_freiburg1_desk"
mkdir -p $RESULT_PATH_FR1
../bin/tum_rgbd_orb \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg1_desk.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg1_desk \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg1_desk.txt \
    ../../results/orb/tum_rgbd_$i/rgbd_dataset_freiburg1_desk \
    no_viewer \
    fr1_run_$i.txt

RESULT_PATH_FR1_ROOM = "../../results/orb/tum_rgbd_$i/rgbd_dataset_freiburg1_room"
mkdir -p $RESULT_PATH_FR1_ROOM
../bin/tum_rgbd_orb \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg1_desk.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg1_room \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg1_room.txt \
    ../../results/orb/tum_rgbd_$i/rgbd_dataset_freiburg1_room \
    no_viewer \
    fr1_run_$i.txt

RESULT_PATH_FR2 = "../../results/tum_rgbd_$i/rgbd_dataset_freiburg2_xyz"
mkdir -p $RESULT_PATH_FR2
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg2_xyz.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg2_xyz \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg2_xyz.txt \
    ../../results/tum_rgbd_$i/rgbd_dataset_freiburg2_xyz \
    no_viewer \
    fr1_run_$i.txt

RESULT_PATH_FR3 = "../../results/tum_rgbd_$i/rgbd_dataset_freiburg3_long_office_household"
mkdir -p $RESULT_PATH_FR3
../bin/tum_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/TUM/tum_freiburg3_long_office_household.yaml \
    ../cfg/gaussian_mapper/RGB-D/TUM/tum_rgbd.yaml \
    ../../dataset/TUM/rgbd_dataset_freiburg3_long_office_household \
    ../cfg/ORB_SLAM3/RGB-D/TUM/associations/tum_freiburg3_long_office_household.txt \
    ../../results/tum_rgbd_$i/rgbd_dataset_freiburg3_long_office_household \
    no_viewer \
    fr3_run_$i.txt
done

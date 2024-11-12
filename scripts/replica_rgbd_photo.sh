#!/bin/bash


for i in 0 1 2
do
RESULT_PATH_OFFICE0="../../results/photo/replica$i/office0"
mkdir -p $RESULT_PATH_OFFICE0
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office0.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/office0 \
    $RESULT_PATH_OFFICE0 \
    no_viewer
    

RESULT_PATH_OFFICE1="../../results/photo/replica$i/office1"
mkdir -p $RESULT_PATH_OFFICE1
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office1.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/office1 \
    $RESULT_PATH_OFFICE1 \
    no_viewer

RESULT_PATH_OFFICE2="../../results/photo/replica$i/office2"
mkdir -p $RESULT_PATH_OFFICE2
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office2.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/office2 \
    $RESULT_PATH_OFFICE2 \
    no_viewer

RESULT_PATH_OFFICE3="../../results/photo/replica$i/office3"
mkdir -p $RESULT_PATH_OFFICE3
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office3.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/office3 \
    $RESULT_PATH_OFFICE3 \
    no_viewer

RESULT_PATH_OFFICE4="../../results/photo/replica$i/office4"
mkdir -p $RESULT_PATH_OFFICE4
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/office4.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/office4 \
    $RESULT_PATH_OFFICE4 \
    no_viewer

RESULT_PATH_ROOM0="../../results/photo/replica$i/room0"
mkdir -p $RESULT_PATH_ROOM0
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room0.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/room0 \
    $RESULT_PATH_ROOM0 \
    no_viewer

RESULT_PATH_ROOM1="../../results/photo/replica$i/room1"
mkdir -p $RESULT_PATH_ROOM1
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room1.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/room1 \
    $RESULT_PATH_ROOM1 \
    no_viewer

RESULT_PATH_ROOM2="../../results/photo/replica$i/room2"
mkdir -p $RESULT_PATH_ROOM2
../bin/replica_rgbd \
    ../ORB-SLAM3/Vocabulary/ORBvoc.txt \
    ../cfg/ORB_SLAM3/RGB-D/Replica/room2.yaml \
    ../cfg/gaussian_mapper/RGB-D/Replica/replica_rgbd.yaml \
    ../../dataset/Replica/room2 \
    $RESULT_PATH_ROOM2 \
    no_viewer
done


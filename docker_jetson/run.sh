#!/bin/bash

# Define environment variables
DISPLAY_VAR=${DISPLAY}
XAUTHORITY_VAR=${XAUTHORITY:-$HOME/.Xauthority}
XDG_RUNTIME_DIR_VAR=${XDG_RUNTIME_DIR}
CONTAINER_NAME="photo_gpu"

# Run the Docker container
docker run \
  --env="DISPLAY=${DISPLAY_VAR}" \
  --env="QT_X11_NO_MITSHM=1" \
  --env="QT_QPA_PLATFORM=xcb" \
  --runtime="nvidia" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --volume="${XAUTHORITY_VAR}:/root/.Xauthority" \
  --volume="/dev/dri:/dev/dri" \
  --volume="./../src:/dev_ws/Photo-SLAM/src" \
  --volume="./../cfg:/dev_ws/Photo-SLAM/cfg" \
  --volume="./../include:/dev_ws/Photo-SLAM/include" \
  --volume="./../CMakeLists.txt:/dev_ws/Photo-SLAM/CMakeLists.txt" \
  --volume="./../scripts:/dev_ws/Photo-SLAM/scripts" \
  --volume="./../examples:/dev_ws/Photo-SLAM/examples" \
  --volume="./../ORB-SLAM3/src:/dev_ws/Photo-SLAM/ORB-SLAM3/src" \
  --volume="./../ORB-SLAM3/include:/dev_ws/Photo-SLAM/ORB-SLAM3/include" \
  --volume="./../../results:/dev_ws/results" \
  --volume="./../../thesis_utils/download_benchmark_data/dataset:/dev_ws/dataset" \
  --network="host" \
  --privileged \
  --gpus="all"\
  -it --rm \
  --name ${CONTAINER_NAME} \
  t4dashi/photo_slam_jetson:dev /bin/bash


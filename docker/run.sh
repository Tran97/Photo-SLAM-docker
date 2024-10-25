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
  --volume="./../../photo_slam/Replica:/dev_ws/Photo-SLAM/data/Replica" \
  --network="host" \
  --privileged \
  --gpus="all"\
  -it --rm \
  --name ${CONTAINER_NAME} \
  photo_slam:dev /bin/bash


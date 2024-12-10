# Steps to build:

1. cd `Photo-SLAM-docker`
1. Build the opencv base: `docker build -t t4dashi/opencv-cuda:11.4.0-jetpack -f  ./docker_jetson/Dockerfile.opencv .`
1. Build the photo-slam image (using some of the binaries from the opencv image) `docker build -t t4dashi/photo_slam_jetson:dev -f  ./docker_jetson/Dockerfile.small .`
1. Go to jetson docker folder `cd docker_jetson`
1. Use docker-compose to spin up container `docker compose up dev`
1. Build the small image on top of that: docker compose build dev



## Container toolkit issue:
OBS: some issues with `NVIDIA_DRIVER_CAPABILITIES=all` (see docker compose) in container toolkit 1.17.2 (see https://github.com/NVIDIA/nvidia-container-toolkit/issues/795)

Downgraded container toolkit to 1.16.2 with the following steps

```bash
sudo apt purge nvidia-container-toolkit
sudo apt-get install -y --allow-downgrades nvidia-container-toolkit-base=1.16.2-1
sudo apt-get install -y --allow-downgrades nvidia-container-toolkit=1.16.2-1
```

```bash
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```


## Base images
Jetson containers (used as base images): https://catalog.ngc.nvidia.com/containers


Full jetpack: https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-jetpack


Only cuda (to be used as base image). Use the -devel to use the image containing the CUDA Toolkit and cuDNN dev library and not just the runtime libraries and ressources to use for e.g. pre-built CUDA applications which is the case for the -runtime tag. The runtime can be used if cuda and cudnn is installed manually afterwards.
https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-cuda

Based on Photo-SLAM original repo the, Jetpack (OS for AGX Xavier or Orin) installation has other depnedencies than for the Ubuntu.

## Pytorch
pytorch: https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform/index.html


# cmake
add to CMakeLists.txt (define name of executable, refer to script etc, define dependencies)

```bash
cd build
cmake ..
sudo make -j

cd bin
sudo ./executable (if not running as sudo it might not be able to use CUDA)
```





# Monitor RAM
Can use `tegrastats` and use awk to get the data of interest (position 4 is RAM usage, pos 5 is RAM available).  
```bash
tegrastats | while read -r line; do      echo "$line" | awk '{split($4,a,"/"); print a[1]}'; done
```

## CUDA
Can use the CUDA code in the `src/test` folder.

### Build

If nvcc is not available (e.g. check by `nvcc --version`)
```bash
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
```

```bash
source ~/.bashrc
```

The following will build the cuda code and save an executable in the binaries (`bin`) folder:

If running `sudo`:
```bash
cd /dev_ws/Photo-SLAM/src/test
sudo env "PATH=$PATH" nvcc -o ../../bin/gpu_monitor gpu_monitor.cu
```

If not running sudo:
```bash
cd /dev_ws/Photo-SLAM/src/test
sudo chmod u+w /dev_ws/Photo-SLAM/src/test
nvcc -o ../../bin/gpu_monitor gpu_monitor.cu
```

### Execute
```bash
cd /dev_ws/Photo-SLAM/bin
sudo ./gpu_monitor
```

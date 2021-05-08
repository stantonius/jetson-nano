  
#!/bin/bash
#
# Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA Corporation and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA Corporation is strictly prohibited.
#

version="4.5.0"
folder="workspace"

echo "** Remove other OpenCV first"
sudo sudo apt-get purge *libopencv*


echo "** Install requirement"
sudo apt-get update
sudo apt upgrade -y
sudo apt remove python3-apt -y
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python3.7-dev python3-numpy python3.7
apt install python3-apt -y
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y curl

update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2

# CUDA
echo 'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/cuda/bin"' >> /etc/environment
echo 'LD_LIBRARY_PATH="/usr/local/cuda/lib64"' >> /etc/environment


echo "** Download opencv-"${version}
fallocate -l 6G /mnt/6GB.swap
mkswap /mnt/6GB.swap
swapon /mnt/6GB.swap
swapon -s
mkdir $folder
cd ${folder}
curl -L https://github.com/opencv/opencv/archive/${version}.zip -o opencv-${version}.zip
curl -L https://github.com/opencv/opencv_contrib/archive/${version}.zip -o opencv_contrib-${version}.zip
unzip opencv-${version}.zip
unzip opencv_contrib-${version}.zip
cd opencv-${version}/


echo "** Building..."
mkdir release
cd release/
cmake -D WITH_CUDA=ON -D CUDA_ARCH_BIN="5.3,6.2,7.2" -D CUDA_ARCH_PTX="" -D OPENCV_GENERATE_PKGCONFIG=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${version}/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D PYTHON_EXECUTABLE=/usr/bin/python3.7 -D PYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3.7 ..
make -j$(nproc)
sudo make install

ldconfig
mkdir /usr/lib/python3.7/dist-packages
cp lib/python3/cv2.cpython-37m-aarch64-linux-gnu.so /usr/lib/python3.7/dist-packages


echo "** Install opencv-"${version}" successfully"
echo "** Bye :)"

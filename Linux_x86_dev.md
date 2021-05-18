# Notes on Linux x86 Development

## Nvidia Drivers

Despite checking the box to install the latest drivers during Ubuntu install, I was still stuck with an Nvidia GPU driver (460) that wouldn't support Nvidia containers.

Therefore I had to follow [this link](https://developer.nvidia.com/cuda-downloads?target_os=Linux) to update the driver to >465

## Docker

There is no Docker Desktop for Linux, which I have relied upon before. So below are more basic commands and notes then there might otherwise be.

As per my [Nvidia Jetson forum post](https://forums.developer.nvidia.com/t/jetson-model-training-on-wsl2-docker-container-issues-and-approach/177875/3), the recommended container for training *locally* before sending the model to the Jetson was [this NGC container](https://ngc.nvidia.com/catalog/containers/nvidia:pytorch).

Note that because of the driver I updated above and **new installation of Docker > 19.03**, I do not need the *legacy* `nvidia-docker2`. However, as mentioned in the **very useful** [Nvidia container docs](https://docs.nvidia.com/deeplearning/frameworks/user-guide/index.html#runcont), I still need to download the `nvidia-container-toolkit`:

* `sudo apt-get install -y docker nvidia-container-toolkit`

Downloading and running a container
* `sudo docker run --gpus all --ipc=host -it --rm -v ~/Projects/tracker:/workspace nvcr.io/nvidia/pytorch:21.04-py3`
  * Because of the `nvidia-container-toolkit`, I only need to use the `--gpus all` to grant access to GPU locally
  * `/workspace` is the main directory loaded by this container
### Docker Compose

In order to run a container defined in a `docker-compose.yaml` file, and if we have a service specified, use the following command to run it in `-it` interactive mode:

`docker-compose run --rm myapp` - where myapp is the service specified in the docker compose file

However if a container is already running, use the following command:

`docker exec -ti <container name> /bin/bash`

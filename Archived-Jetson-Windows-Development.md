## Update

While below was my initial approach, I am now led to believe that the right approach is to develop on the x86 container, and then transfer my model to the Jetson when it is ready for fine-tuning. So I will write a new tutorial for that.

Following [this tutorial](https://dev.to/azure/building-jetson-containers-for-nvidia-devices-on-windows-10-with-vs-code-and-wsl-v2-1ao) on how to set up a Jetson development nevironment for Windows. 

## Notable Issues

* Given this was my first time working with `Makefile`, I didn't understand that I needed to create the `.env` file myself first. The repo mentioned in the article above came with a `.evntemp` file - I just had to remove the `temp` and suddenly the `Ctrl+Shift+B` commend in VSCode worked to start the build
  * I also went with the method of adding `NV_USER=my_email` in the `.env` file

* Ran into a permissions issue mentioning `token_seed`. The resolution was to delete that file via the following command: `rm /home/craig/.docker/.token_seed`
  * If that had not worked, some suggsted to remove `.token_seed.lock` file as well

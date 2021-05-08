# Jetson Nano Camera Setup on Python 3.7

This took forever to get right (because of Python3.7 requirement), so here are my notes

## ssh
This is my first time using `ssh` between two of my own computers. It made using my regular keyboard and monitor possible while developing on the nano. 

* On the nano, type `ifconfig` and scroll down to the `wlan` section - here you weill see the `ip address` of the nano. You will also need to know the name of your computer (found with `whoami` commaned
* Then on the main computer in a shell type `ssh name@ip_address`. It will then ask for a password - once that is filled in, you have successfully tunnelled into your jetson nano.
* You can also do this in VSCode - add the extension RemoteSSH and follow its instructions. You will need the same details as above. You can then find the ssh details in the green *bottom left corner* of your VSCode window.

## Virtual Envs

Do not use `conda` to run this script. A lot of the tutorials online suggested to use `virtualenv`, and I thought `conda` could have been a drop-in replacement. As it turns out, this wasn't the case (or at least I am not familiar enough with Linux to make it the case). Therefore I decided to install this setup globally (without `virtualenv`) as I figured I'd need this for multiple projects

## The script

I just admitted I wasn't skilled at Linux. Therefore clearly this script was borrowed and modified:
* Someone named *zdary* posted the helpful script [here](https://forums.developer.nvidia.com/t/jetson-nano-opencv-4-1-0/77367/2)

I think the swap memory feature helped with the install (compile) speed, so make sure to include that.

The script was run in the home (`~`) directory

## The Env Variables

I added the following to my `.bashrc` file in `~` directory:

```
export PATH=/home/craig/Development/cmake-3.13.0/bin/:$PATH
export PYTHONPATH=$PYTHONPATH:~/opencv-4.5.0/release/python_loader
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.7/dist-packages/cv2

export DISPLAY=:0.0
```

I actually don't think the first one was needed - I think it was a line from an older attempt. 

## The lens focusing

Once the camera was working, the picture was out of focus. It turnes out that the IMX219-200 camera that I have has a manual focus adjustment knob that is *really hard to turn* - but it does focus the picture.

## Summary

Once the above was done, I was able to run a conda environment with Python3.7 and install my required packages while `cv2` was available from this global setup.

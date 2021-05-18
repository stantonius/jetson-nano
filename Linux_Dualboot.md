# Linux Dualboot

I was having troubles using WSL2 - the latest driver release was preventing using GPU, which was the whole point of training on the desktop instead of the Jetson

## Considerations

### Choosing the Drive

I had to clear up some space on my main NVME C: drive. This was because I chose to load Linux Ubuntu on the C: drive so I could use the Windows Boot Manager - I'm not sure if this is a requirement, but I did this as opposed to loading it on the D: drive - I wanted this drive to be used for data storage, regardless of the OS being used.

### Partitioning the Drive

When creating a drive partition on C: (by right-clicking the start menu in Windows, and selecting 'Disk Management') I had very little space to partition. This was because I had been using it for a while, and different objects had been written in different spots on the disk. Therefore I needed to "move" files to a specific "region" of the drive to have a clean partition for Ubuntu.

Most [videos on Youtube](https://www.youtube.com/watch?v=Z-Hv9hOaKso) don't mention this issue. However [other videos](https://www.youtube.com/watch?v=bBQBW932j3U&t=3s) show how to clean up the drive for parititioning using a tool called **GParted**.

GParted is a Linux distro run entirely on a USB key that you can boot up and clean up the drives. All you need to do is follow the setup above, and then restart into BIOS (fo0r me, pressing the Del button) and choosing to boot from the USB drive first.

### Backing up

I did a full backup on Windows before this, including moving all files to OneDrive - unsure about this, as `OneDrive` is now another directory in my file tree, but it was a safe choice.

I also saved a complete image to my D: drive before doing any of the above

### OS choice

There were a tonne of Linux distros available, but I went with the standard Ubuntu 20.04 LTS - I find the more I try to use the latest tools instead of the ones that are *confirmed* to work, the more time I waste.

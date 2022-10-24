# pi_setup

Raspberry Pi Setup for coral imaging

## physical setup

- Raspberry Pi Model 4, 2GB (at least 2GB)
- 128 GB micro SD card
- 1 TB SSD connected via USB-A to the Pi
- Microscope lens by Pimonori
- Raspberry Pi High Quality Camera
- ethernet cable for network connection
- power-over-ethernet hat for Pi
- (opt) USB-C power cable for Pi
- (opt) mouse & keyboard for Pi
- (opt) micro-HDMI to HDMI cable + display 


## OS setup

- A specific CSLICS image has been created (currently uploading to cloudstor)
- Image was created using Win32 Disk Imager on Windows 10
- Alternatively, we can recreate the OS as follows:
  - Raspberry Pi OS Version 11, ''Bullseye'', 64-bit (can be installed via Raspberry Pi Imager). After going through all the install bits (setting up time zone, etc)
  
        sudo apt update
        sudo apt upgrade

  - Enable SSH interface under the Raspberry Pi Configuration tool
  - Install ROS Noetic: https://wiki.qut.edu.au/display/cyphy/Technical+Handbook, copy the steps under installing software only
  
        sudo apt install -y ca-certificates
        sudo -E apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-key 5B76C9B0
        sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://packages.qcr.ai $(lsb_release -sc) main" > /etc/apt/sources.list.d/qcr-latest.list'
        sudo apt install ros-noetic-perception ros-noetic-robot-bringup ros-noetic-roscore-daemon
        
  - Possibly resolving rosdep issues (assuming having run rosdep init)
 
        sudo sh -c 'sed -i "1iyaml https:\/\/raw.githubusercontent.com\/qcr\/package_lists\/master\/$(lsb_release -sc)\/sources.yaml" /etc/ros/rosdep/sources.list.d/20-default.list'

  - install other programs that make the Pi/Linux-based OS much more usable:
        
        sudo apt install build-essential vim-gtk terminator openssh-server git gcc make cmake pkg-config zip unzip g++ curl dkms wget exfat-fuse exfat-utils guvcview net-tools ffmpeg cheese -y    
        
  - Set static IP address: TODO - @Riki?
  - Set time synchronisation: TODO - @Riki? current work-around is to either connect to an internet connection, or SSH in and use the following command to manually set the correct date/time:
 
        sudo date -s 'YYYY-MM-DD HH:MM:SS'
        
  - set username to unique ID, e.g. cslics01: https://raspberrytips.com/change-raspberry-pi-username/   
 
# Code setup & Installation

  - Settup git access via SSH
  - Setup user info:
 
        git config --global user.name "Dorian Tsai"
        git config --global user.email dorian.tsai@gmail.com
        
  - Install relevant git repos:
  
        git clone git@github.com:Coral-Imaging/pi_setup.git
        git clone git@github.com:Coral-Imaging/rrap-scheduler.git
        git clone git@github.com:Coral-Imaging/rrap-downloader.git
        git clone git@github.com:Coral-Imaging/coral_spawn_imager.git
        git clone git@github.com:Coral-Imaging/rrap-server.git
        



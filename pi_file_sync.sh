#!/bin/bash

# assume /etc/hosts file is setup with each Pi, named and numbered
# ssh cslics04@cslics03 mkdir /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log

# ssh cslics04@cslics03 mkdir /home/cslics04/temp_ws 2>&1 | tee cslics03.log



# generate ssh key on main computer (similar to github key-gen)
# copy over id key to each pi
# ssh-copy-id -i ~/.ssh/id_ed25519.pub cslics04@cslics03


echo "cslics01: pulling repos"
# ssh cslics04@cslics01 rm -rf temp_ws 2>&1 | tee cslics01.log
# ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws/coral_spawn_imager; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws/rrap-scheduler; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws/rrap-server 2>&1 | tee cslics01.log

# scp qcr-env.bash cslics04@cslics01:/home/cslics04/qcr-env.bash
# ssh cslics04@cslics01 sudo mv /home/cslics04/qcr-env.bash /etc/qcr/qcr-env.bash 2>&1 | tee cslics01.log # I ended up just loging in and `sudo mv`

ssh cslics04@cslics01 git config --global pull.rebase true 2>&1 | tee cslics01.log

# discard all local changes
ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager reset --hard 2>&1 | tee cslics01.log

ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/rrap-server reset --hard  2>&1 | tee cslics01.log

ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/rrap-scheduler reset --hard  2>&1 | tee cslics01.log

# pull repos
ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager pull git@github.com:Coral-Imaging/coral_spawn_imager.git 2>&1 | tee cslics01.log

ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/rrap-server pull git@github.com:Coral-Imaging/rrap-server.git 2>&1 | tee cslics01.log

ssh cslics04@cslics01 git -C /home/cslics04/cslics_ws/src/rrap-scheduler pull git@github.com:Coral-Imaging/rrap-scheduler.git 2>&1 | tee cslics01.log



echo "cslics03: pulling repos"

# ssh cslics04@cslics03 rm -rf temp_ws 2>&1 | tee cslics03.log
ssh cslics04@cslics03 git config --global pull.rebase true  2>&1 | tee cslics03.log

# discard all local changes
ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager reset --hard  2>&1 | tee cslics03.log

ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/rrap-server reset --hard 2>&1 | tee cslics03.log 

ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/rrap-scheduler reset --hard  2>&1 | tee cslics03.log

# pull repos
ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager pull git@github.com:Coral-Imaging/coral_spawn_imager.git 2>&1 | tee cslics03.log

ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/rrap-server pull git@github.com:Coral-Imaging/rrap-server.git 2>&1 | tee cslics03.log

ssh cslics04@cslics03 git -C /home/cslics04/cslics_ws/src/rrap-scheduler pull git@github.com:Coral-Imaging/rrap-scheduler.git 2>&1 | tee cslics03.log


# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws/rrap-scheduler; ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws/rrap-server 2>&1 | tee cslics03.log

echo "cslics04: pulling repos"

# ssh cslics04@cslics03 rm -rf temp_ws 2>&1 | tee cslics03.log
ssh cslics04@cslics04 git config --global pull.rebase true  2>&1 | tee cslics04.log

# discard all local changes
ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager reset --hard  2>&1 | tee cslics04.log

ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/rrap-server reset --hard  2>&1 | tee cslics04.log

ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/rrap-scheduler reset --hard  2>&1 | tee cslics04.log

# pull from repos
ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/coral_spawn_imager pull git@github.com:Coral-Imaging/coral_spawn_imager.git 2>&1 | tee cslics04.log

ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/rrap-server pull git@github.com:Coral-Imaging/rrap-server.git 2>&1 | tee cslics04.log

ssh cslics04@cslics04 git -C /home/cslics04/cslics_ws/src/rrap-scheduler pull git@github.com:Coral-Imaging/rrap-scheduler.git 2>&1 | tee cslics04.log

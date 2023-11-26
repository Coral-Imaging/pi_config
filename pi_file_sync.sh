#!/bin/bash

# assume /etc/hosts file is setup with each Pi, named and numbered

# generate ssh key on main computer (similar to github key-gen)
# copy over id key to each pi
# ssh-copy-id -i ~/.ssh/id_ed25519.pub cslics04@cslics03

# cslics_id=cslics07
cslics_id=$1
echo "$cslics_id: pulling repos"
# ssh cslics04@$cslics_id touch hello.txt 2>&1 | tee cslics01.log
# ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws/coral_spawn_imager; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws/rrap-scheduler; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws/rrap-server 2>&1 | tee cslics01.log

# scp qcr-env.bash cslics04@cslics01:/home/cslics04/qcr-env.bash
# ssh cslics04@cslics01 sudo mv /home/cslics04/qcr-env.bash /etc/qcr/qcr-env.bash 2>&1 | tee cslics01.log # I ended up just loging in and `sudo mv`

ssh cslics04@$cslics_id git config --global pull.rebase true 2>&1 | tee $cslics_id.log

# # discard all local changes
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/coral_spawn_imager reset --hard 2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/coral_spawn_counter reset --hard 2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-server reset --hard  2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-scheduler reset --hard  2>&1 | tee $cslics_id.log

# # pull repos online
# ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/coral_spawn_imager pull git@github.com:Coral-Imaging/coral_spawn_imager.git 2>&1 | tee $cslics_id.log
# ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-server pull git@github.com:Coral-Imaging/rrap-server.git 2>&1 | tee $cslics_id.log
# ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-scheduler pull git@github.com:Coral-Imaging/rrap-scheduler.git 2>&1 | tee $cslics_id.log

# pull repos from localserver
ssh cslics04@$cslics_id git -C /home/cslcis04/cslics_ws/src/coral_spawn_imager pull localserver main 2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/coral_spawn_counter pull localserver main 2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-server pull localserver master 2>&1 | tee $cslics_id.log
ssh cslics04@$cslics_id git -C /home/cslics04/cslics_ws/src/rrap-scheduler pull localserver main 2>&1 | tee $cslics_id.log

echo "Done"

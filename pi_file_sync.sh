

# assume /etc/hosts file is setup with each Pi, named and numbered
# ssh cslics04@cslics03 mkdir /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log
# ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws 2>&1 | tee cslics03.log

# ssh cslics04@cslics03 mkdir /home/cslics04/temp_ws 2>&1 | tee cslics03.log


# generate ssh key on main computer (similar to github key-gen)
# copy over id key to each pi
# ssh-copy-id -i ~/.ssh/id_ed25519.pub cslics04@cslics03


echo "cslics01: cloning repos"
ssh cslics04@cslics01 rm -rf temp_ws 2>&1 | tee cslics01.log
ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws/coral_spawn_imager; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws/rrap-scheduler; ssh cslics04@cslics01 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws/rrap-server 2>&1 | tee cslics01.log

echo "cslics03: cloning repos"
ssh cslics04@cslics03 rm -rf temp_ws 2>&1 | tee cslics03.log
ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/coral_spawn_imager.git /home/cslics04/temp_ws/coral_spawn_imager; ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-scheduler.git /home/cslics04/temp_ws/rrap-scheduler; ssh cslics04@cslics03 git clone git@github.com:Coral-Imaging/rrap-server.git /home/cslics04/temp_ws/rrap-server 2>&1 | tee cslics03.log
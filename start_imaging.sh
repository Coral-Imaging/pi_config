#!/bin/bash

# start camera trigger on all pi's

# assume hostnames setup on all pi's in /etc/hosts file


echo "run cslics01"
ssh cslics04@cslics01 "sed -i -e '5isource /home/cslics04/cslics_ws/devel/setup.bash\' ~/.bashrc" 2>&1 | tee cslics01.log
# ssh -X cslics04@cslics01 "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics01.log

echo "run cslics03"
# put source of workspace into top of bashrc (before non-interactive stuff)
ssh cslics04@cslics03 "sed -i -e '5isource /home/cslics04/cslics_ws/devel/setup.bash\' ~/.bashrc" 2>&1 | tee cslics03.log
# run the ros node
# ssh -X cslics04@cslics03 "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics03.log

echo "run cslics04"
# put source of workspace into top of bashrc (before non-interactive stuff)
ssh cslics04@cslics04 "sed -i -e '5isource /home/cslics04/cslics_ws/devel/setup.bash\' ~/.bashrc" 2>&1 | tee cslics04.log
# run the ros node
# ssh -X cslics04@cslics04 "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics04.log


echo "starting camera triggers"

# TODO - has a syntax error - ask Gav?
ssh -X cslics04@cslics01 nohup "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics01.log & ; ssh -X cslics04@cslics03 nohup "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics03.log & ; ssh -X cslics04@cslics04 nohup "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics04.log
#! /bin/bash
ssh -X cslics04@cslics04 nohup "rosrun coral_spawn_imager CameraTrigger.py" 2>&1 | tee cslics04.log
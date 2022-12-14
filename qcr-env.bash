#!/bin/bash

# --------- QCR Related --------------
export QCR_ROBOT_VERSION="0.1"
# Get current path of this script
export QCR_ROBOT_CONF_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/qcr-env.bash"
# Robot type managed by this device
export QCR_ROBOT_TYPE=
# Sets this robot to be a ROS MASTER (true) or a USER PC (false)
export QCR_IS_MASTER=true

# --------- ROS Related --------------
if $QCR_IS_MASTER; then
    export ROS_MASTER_URI=http://$(hostname):11311
else
    export ROS_MASTER_URI=http://user-pc:11311
fi

# Sets the default location from which to source ROS packages
export ROS_WORKSPACE=/opt/ros/noetic/setup.bash

# --------- Bringup Related --------------
# The command to run before bringing up the robot service
export QCR_ROBOT_PRELAUNCH=

# The command that used by the bringup service to launch the robot stack
export QCR_ROBOT_LAUNCH="flask --app /home/cslics04/cslics_ws/src/rrap-server/app --debug run --host=0.0.0.0"

# The command to run when the bringup service exits
export QCR_ROBOT_POSTEXIT=

# --------- System Related -----------
export NETWORK_CONFIG_DIR=/etc/systemd/network
export PYTHONPATH=/home/cslics04/.local/lib/python3.9/site-packages:$PYTHONPATH

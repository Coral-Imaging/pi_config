#! /usr/bin/env python3

# code to send the correct date/time from central computer to pi's

import os
import requests
import datetime

CSLICS_ID = 'cslics03'
REMOTE=f'{CSLICS_ID}:5000'

# get current time:
datestr = datetime.datetime.now().isoformat()
sendstr = datestr[0:19]

# send the string
resp = requests.post(f'http://{REMOTE}/set-time', json=sendstr)

print(resp)

# sudo date -s 'YYYY-MM-DD HH:MM:SS'
#! /usr/bin/env python3

# code to send the correct date/time from central computer to pi's

import os
import requests
import datetime

cslics_id_file = './remotes'
remotes = []
with open(cslics_id_file, 'r') as f:
    lines = f.readlines()
    for line in lines:
        line = line.rstrip()
        remotes.append(line)
        
for CSLICS_ID in remotes:
    # print(line)

    REMOTE=f'{CSLICS_ID}:5000'

    print(f'setting time: {REMOTE}')
    # get current time:
    datestr = datetime.datetime.now().isoformat()
    sendstr = datestr[0:19]

    print(sendstr)
    # send the string
    resp = requests.post(f'http://{REMOTE}/set-time', json=sendstr)

    print(resp)

# sudo date -s 'YYYY-MM-DD HH:MM:SS'
print('done')
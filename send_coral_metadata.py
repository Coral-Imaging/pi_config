#! /usr/bin/env python3

# send coral metadata

import os
import json
import requests

CSLICS_ID = 'cslicsdt'
REMOTE = f'{CSLICS_ID}:5000'

# read json as dictionary
CORAL_METADATA_FILE = 'coral_metadata.json'
with open(CORAL_METADATA_FILE) as f:
    sendmetadata = json.load(f)

# send dictionary
resp = requests.post(f'http://{REMOTE}/set-coral-metadata', json=sendmetadata)

print(resp)

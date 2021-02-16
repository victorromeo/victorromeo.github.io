#!/usr/bin/env python3
import requests
import json

mbed_mcu_list_url = 'https://raw.githubusercontent.com/ARMmbed/mbed-os/master/targets/targets.json'

def process(mcu_list):
    full_list = {}

    def get_target(target):
        if not type(target) == str:
            target = target[0]
        t = mcu_list[target]

        if type(t) == dict:
            if 'inherits' in t.keys():
                t = {**get_target(t['inherits']), **t}
        
        return t

    for k in mcu_list.keys():
        full_list[k] = get_target(k)

    return full_list

with requests.get(mbed_mcu_list_url) as response:
    if 200 >= response.status_code < 300:
        mcu_list = json.loads(response.content)
        with open('mbed_os_targets.json', 'w') as out:
            json.dump(process(mcu_list), out)
        

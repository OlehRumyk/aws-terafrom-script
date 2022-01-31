#!/usr/bin/env python3

import json

def output_from_terraform(input_param, output_file_from_terraform):
    try:
        with open(output_file_from_terraform) as data_file:
            data = json.load(data_file)
            view_instance_id = data[input_param]['value']
            return view_instance_id
    except:
        print("Something wrong! Check please terraform output file")
        return False


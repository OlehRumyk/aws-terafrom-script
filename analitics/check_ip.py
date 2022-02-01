#!/usr/bin/env python3

import requests

def expertal_ip():
    try:
        f = requests.request('GET', 'http://myip.dnsomatic.com')
        ip = f.text
        return ip
    except:
        print("Something wrong! I don't know yuor external IP. Sorry.")
        return False

def check_ip_with_white_list(white_list, expertal_ip):
    try:
        ip = expertal_ip + "/32"
        if ip in white_list:
            print('Your IP exists in the whitelist!')
        else:
            print('IP not exists!')
    except:
        print("Something wrong! I don't can check yuor IP")
        return False

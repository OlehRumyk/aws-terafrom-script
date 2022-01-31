#!/usr/bin/env python3

import requests
import socket
import time

def check_url(url):
    try:
        r = requests.get(url)
        if r.status_code == 200:
            return True
    except:
        print("Something wrong! Check please your correct url or ip!")
        return False

def check_url_with_use_proxy(url, proxy_host_port):
    try:
        proxies = {
            'http': proxy_host_port,
        }

        response = requests.get(url, proxies=proxies)
        if response.status_code == 200:
            return True

    except:
        print("Something wrong!")
        return False

def isOpen(ip, port):
    retry = 5
    delay = 10
    timeout = 3

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(timeout)
    try:
        s.connect((ip, int(port)))
        s.shutdown(socket.SHUT_RDWR)
        return True
    except:
        return False
    finally:
        s.close()

def checkHost(ip, port):
    ipup = False
    for i in range(retry):
        if isOpen(ip, port):
            ipup = True
            break
        else:
            time.sleep(delay)
    return ipup

    if checkHost(ip, port):
        print(ip + " is UP")

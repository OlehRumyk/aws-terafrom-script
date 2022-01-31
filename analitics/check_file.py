#!/usr/bin/env python3

import paramiko

def check_bit_in_file(host_ssh,username,key_file):
    try:
        check_param = 'x'
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(host_ssh, port='2222', username=username, password='', key_filename=key_file)
        stdin, stdout, stderr = ssh.exec_command('cd /opt/project &&  ls -l | awk \'{print $1}\'')
        data = stdout.readlines()
        i = check_param in str(data)
        ssh.close()
        if i == True:
            print("You should change the file permissions")
        else:
            print("Everything is fine with a file access rights")
    except:
        print("Something wrong! Error ssh connect")
        return False





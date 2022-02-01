#!/usr/bin/env python3

import os
import info_from_terraform
import info_from_aws
import check_service
import check_ip
import check_file
from dotenv import load_dotenv


output_file_from_terraform = "./../infrastructure.json"

if os.path.exists(output_file_from_terraform):
    print("------------------------------------------------")
    print(" Information from terraform")
    print("___________________________")
    print(info_from_terraform.output_from_terraform('instance_id', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('instance_platform', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('instance_public_ip', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('vpc_id', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('vpc_subnet_id', output_file_from_terraform))
    print(info_from_terraform.output_from_terraform('ip_access_list', output_file_from_terraform))
else:
    print("Generate terraform output file, read README.md please")

print("------------------------------------------------")
print(" Check permission to web and ssh service ")
print("________________________________________")
print("Your external IP: ", check_ip.expertal_ip())

white_list = info_from_terraform.output_from_terraform('ip_access_list', output_file_from_terraform)
your_external_ip = check_ip.expertal_ip()
check_ip.check_ip_with_white_list(white_list, your_external_ip)

web_domain = info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform)
web_url = "http://" + info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform)
print("Checked access from white ip to web server URL:", check_service.check_url(web_url))
print("Checked ssh access to service:", check_service.isOpen(web_domain, '2222'))

proxy_host = os.environ["PROXY_HOST"]
proxy_port = os.environ["PROXY_PORT"]
proxy_server = "http://" + proxy_host + ":" + proxy_port

test_proxy_service = check_service.isOpen(proxy_host, proxy_port)

if test_proxy_service == True:
    check_service.check_url_with_use_proxy(web_url, proxy_server)
else:
    print("Check please values: proxy host and port")

info_from_aws.info_ec2()

remote_user = os.environ["REMOTE_USER"]
remote_ssh_port = os.environ["REMOTE_SSH_PORT"]
path_key_file = os.environ["PATH_KEY_FILE"]

check_file.check_bit_in_file(web_domain,remote_user,path_key_file)

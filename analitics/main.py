#!/usr/bin/env python3

import os
import info_from_terraform
import info_from_aws
import check_service
import check_ip
import check_file

print("#######################################################")
print("#               Information from terraform            #")
print("#######################################################")

output_file_from_terraform = './../infrastructure.json'
print(info_from_terraform.output_from_terraform('instance_id', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('instance_platform', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('instance_public_ip', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('vpc_id', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('vpc_subnet_id', output_file_from_terraform))
print(info_from_terraform.output_from_terraform('ip_access_list', output_file_from_terraform))

print("#######################################################")
print("#                    Check external                   #")
print("#######################################################")
print("Your external IP: ", check_ip.expertal_ip())

white_list = info_from_terraform.output_from_terraform('ip_access_list', output_file_from_terraform)
your_external_ip = check_ip.expertal_ip()
check_ip.check_ip_with_white_list(white_list, your_external_ip)

web_domain = info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform)
# print("Domain :", web_domain)
web_url = "http://" + info_from_terraform.output_from_terraform('lb_dns', output_file_from_terraform)
print("Checked access from white ip to web server URL:", check_service.check_url(web_url))
print("Checked ssh access to service:", check_service.isOpen(web_domain, '2222'))

proxy_host_port = 'https://113.28.90.66:80'
# +
info_from_aws.info_ec2()

# print(check_service.check_url_with_use_proxy(url_load_balancer))

print("#######################################################")
print("#               Checking file in server               #")
print("#######################################################")
remote_user = 'ec2-user'
remote_ssh_port = '2222'
path_key_file = '/home/vagrant/.ssh/task/key'
check_file.check_bit_in_file(web_domain,remote_user,path_key_file)

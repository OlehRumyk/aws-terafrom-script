#!/usr/bin/env python3

import os
import boto3
from botocore.exceptions import ClientError
from dotenv import load_dotenv

load_dotenv()

def info_ec2():
    try:
        print("Info about EC2")
        region          = os.getenv('AWS_REGION')
        instance_name   = os.getenv('INSTANCE_NAME')
        connect_to_ec2  = boto3.client('ec2', region_name=region)
        response = connect_to_ec2.describe_instances()
        for r in response['Reservations']:
            for i in r['Instances']:
                # print(i)
                instance_id = i['InstanceId']
                print ("Instance id -", i['InstanceId'])
                ami_id = i['ImageId']
                print ("AMI id =", i['ImageId'])
                instance_tag = i['Tags']
                for tags in i['Tags']:
                    print(tags['Key'], "-", tags['Value'])
    except ClientError as e:
        print(e)
    else:
        return instance_id, ami_id, instance_tag

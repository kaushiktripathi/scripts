#!/bin/bash
echo "nameserver 10.75.52.55" >> /etc/resolv.conf
wget https://s3.amazonaws.com/amazoncloudwatch-agent/suse/amd64/latest/amazon-cloudwatch-agent.rpm
rpm -ivh amazon-cloudwatch-agent.rpm
wget https://raw.githubusercontent.com/kaushiktripathi/scripts/main/config.json
cat config.json > /opt/aws/amazon-cloudwatch-agent/bin/config.json
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status



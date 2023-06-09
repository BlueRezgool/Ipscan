#!/bin/bash
RED='\033[0;96m'

NC='\033[0m' # No Color

echo -e "${RED}#######
> Turn On your VPN and then press any key and Enter... 
> Questions -> press y and enter ${NC} "

read delayvar


pkg upgrade

pkg install python

# Install requests library for Python

pip install requests

# Create the ip.py file

echo 'import requests

url= "https://api.github.com/repos/vfarid/cf-clean-ips/contents/list.txt"

response = requests.get(url)

data = response.json()

text = requests.get(data["download_url"]).text

import re

ip_addresses = re.findall(r'\''\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}'\'', text)

with open("ipad.txt", "w") as file:

    for ip in ip_addresses:

        file.write(ip + "\n")' > ip.py

# Upgrade cfscanner

pip install cfscanner --upgrade

# Execute the ip.py script

python ip.py

# Execute cfscanner with ipad.txt
echo -e "${RED}#######
> Turn off your VPN and then press any key and Enter...
> In Error situations , repeat instruction ${NC}"
read delayvar
cfscanner -t 1 -s ./ipad.txt -DS 200 -US 5
echo -e "${RED}
### You can change your VPN IP address using the IPs listed above.
### ###
Now, you can search for a new IP by typing the command below and then pressing the Enter button.

${NC}python ip.py && cfscanner -t 1 -s ./ipad.txt -DS 200 -US 5
${RED} ### to gain the best IP Addresses IP  ${NC}"

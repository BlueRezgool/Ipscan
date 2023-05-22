#!/bin/bash

apt install python

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

cfscanner -t 16 -s ./ipad.txt -DS 5 -US 5

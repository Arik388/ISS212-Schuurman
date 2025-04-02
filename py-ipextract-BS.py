#Name: Douglas Schuurman
#Date: 4/1/2025

import re
##Opens the log file this is hard coded so must be with the script location
with open('auth.log','r') as file:
    log_data = file.read()
#Creates the pattern to look for failed logon attempts and extract the ip
pattern = r"Failed password .* from (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"
#This part attempts to match the pattern to the log data to return the suspicious ips
suspicious_ips = re.findall(pattern,log_data)
#Converts the list of suspiciou IPs to set  and remove duplicates to provide only unique IPs / Then print those IPs
unique_ips = set(suspicious_ips)
print("Suspicious IP Addresses:")
#Iterate through each unique IP address and prints it
for ip in unique_ips:
    print(ip)
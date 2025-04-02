# ISS 212 CS Scripting - WK 8 TD 6- PowerShell - Event Log Monitoring
# PS script using Regex -- Redacting data using pattern matching
#

'''
.DESCRIPTION
Add {your name} and {date} to the first comment line.
ISS 212 - CS Scripting - PowerShell Script: ps-FailLog.ps1
Citations:

.PURPOSE
Week 8 PS script using Regex to match IP data using regex.

.USAGE
Run script from file with command or from terminal. | .\ps-FailLog.ps1
'''

# Week 8 PS script using Regex -- extracting data using regex

# This is setting the file that it is analyzing for failed logon attempts. Attempting to match the pattern parameter
# To extract IPs from the failed attempts this is also set to look for all matches and not just the first match
# finally it saves the results to the failed attempts variable
$logFile = "security.log"
$failedAttempts = Select-String -Path $logFile -Pattern "Login attempt failed from IP (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})" -AllMatches

# This creates an empty hash table to store the count of failed login attempts for each unique IP
#The if statement checks for the IP address and for every time it finds a failed attempt it adds to the count
#Then it finally creates a dictionary of IP addresses and their failed logon attempts.
$ipCounts = @{}
foreach ($match in $failedAttempts) {
    $ip = $match.Matches.Groups[1].Value
    if ($ipCounts.ContainsKey($ip)) {
        $ipCounts[$ip] += 1
    } else {
        $ipCounts[$ip] = 1
    }
}

# tThis is the output part of the script to print out the IP associated but it specifically looks for failed logons
# Greater then three attempts to print out
Write-Host "Potentially Malicious IPs:"
foreach ($ip in $ipCounts.Keys) {
    if ($ipCounts[$ip] -gt 3) {
        Write-Host "$ip has $($ipCounts[$ip]) failed login attempts"
    }
}

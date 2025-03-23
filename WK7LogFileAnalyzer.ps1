<#
Name: Douglas Schuurman
Date:3/23/2025
Assignment: WK7 Log File Analyzer
Citations / Resources Used:
ChatGPT for Debugging - Primarilly with my log output I was having issues with having it output correctly / read correctly
I didn't account for the brackets and it kept coming back as zero entries. ChatGPT Recommended / gave me debugging statements
to ensure that the log file was actually being read then showed me how to account for the brackets. Which I realized I should
have just looked at the example script as it is handled in a similiar way
Google Prompt to help get started "powershell logfile analyzer sample script" worked with the AI Overview 1st search result
Professors Example Script primarilly for variable creation / proper search fields / Getting Started
#>

$logFilePath = "WK7LOG.txt"  # Path to your log file

# Verify that the log file exists and attempt to open it
try {
    $logContent = Get-Content -Path $logFilePath -ErrorAction Stop
} catch {
    Write-Error "Failed to read the log file: $($_.Exception.Message)"
    exit
}

# Log Level Array (Add any other log levels you might have)
$logLevels = @("INFO", "WARNING", "ERROR", "CRITICAL")

# Hash Table for the descriptions
$logDescript = @{
    "INFO" = "General Info"
    "WARNING" = "Potential Issue"
    "ERROR" = "High Level Issue"
    "CRITICAL" = "System Failure"
}

# Warn User of Accepted Levels
Write-Host "Accepted Log Levels are: INFO, WARNING, ERROR, CRITICAL"

# Gather the user input for Log Level
$selectedLevel = Read-Host "Enter a Log Level"
Write-Host ($logDescript[$selectedLevel] ?? "Invalid Log Level")

# Log summary initialization
$logSummary = @{}
$logLevels | ForEach-Object { $logSummary[$_] = 0 }

# Debugging: Print the first few lines of the log content to confirm it's being read
Write-Host "`nLog File Content Preview (First 5 lines):"
$logContent[0..4] | ForEach-Object { Write-Host $_ }

# Process the Log File
foreach ($line in $logContent) {
    # Regex to match log entries with the required components:
    # Timestamp (YYYY-MM-DD HH:MM:SS), Log Level (inside [ ]), IP Address, and Message
    if ($line -match '(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}) \[(.*?)\] ([\d\.]+) - (.*)') {
        # Extracting the components
        $timestamp = $matches[1]  # Timestamp
        $logLevel = $matches[2]   # Log Level (inside [ ])
        $ipAddress = $matches[3]  # IP Address
        $message = $matches[4]    # Log Message

        # Debugging: Output the matched components for each line
        Write-Host "Matched Line - Timestamp: $timestamp, Log Level: $logLevel, IP: $ipAddress, Message: $message"

        # Count occurrences of each log level
        if ($logSummary.ContainsKey($logLevel)) {
            $logSummary[$logLevel]++
        }

        # Optionally: Add more processing based on specific message content
        if ($message -like "*failed authentication*") {
            Write-Host "Failed login detected from IP: $ipAddress"
        }
    }
}

# Output of the Log Summary
Write-Host "`nLog Level Summary:"
$logSummary.GetEnumerator() | ForEach-Object { Write-Host "$($_.Key): $($_.Value) occurrences" }



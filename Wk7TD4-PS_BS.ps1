# Jenn Moody - ISS212 - Tool Development Exercise 4
# Resources: ISS212 Week 7 Tool Development Exercise 4 walkthrough
# "Prompt"(ChatGPT) or citation

# Define the log file path if your log file is not in same folder as PS script.
$logFilePath = "WK7LOG.txt"

# Tell me whats happening here..
if (-Not (Test-Path $logFilePath)) {
    Write-Host "Log file not found!"
    exit
}

# Tell me whats happening here..
$logEntries = Get-Content $logFilePath

# Tell me whats happening here..
$logStats = @{}

# Tell me whats happening here..
$failedLogins = @()

# Tell me whats happening here..
foreach ($entry in $logEntries) {
    # Tell me whats happening here..
    if ($entry -match "^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} \[(.*?)\] (.*?) - (.*)$") {
        $logLevel = $matches[1]
        $ipAddress = $matches[2]
        $message = $matches[3]

        # Tell me whats happening here..
        if ($logStats.ContainsKey($logLevel)) {
            $logStats[$logLevel]++
        } else {
            $logStats[$logLevel] = 1
        }

        # Tell me whats happening here..
        if ($message -like "*failed authentication*") {
            $failedLogins += "$ipAddress - $entry"
        }
    }
}

# Tell me whats happening here..
Write-Host "Log Level Breakdown:"
$logStats.GetEnumerator() | ForEach-Object { Write-Host "$($_.Key): $($_.Value)" }

# Tell me whats happening here..
Write-Host "`nFirst 10 Failed Login Attempts:"
$failedLogins | Select-Object -First 10


# SP25 - ISS 212 Week 4 Tool Dev 2
# Jenn Moody
# Tool Dev Scenario 6

$ip = Read-Host "Enter IP Address"
$ports = @(22, 80, 443)
foreach ($port in $ports) {
    $result = Test-NetConnection -ComputerName $ip -Port $port -WarningAction SilentlyContinue
    if ($result.TcpTestSucceeded) {
        Write-Host "Port $($port): OPEN"
    } else {
        Write-Host "Port $($port): CLOSED"
    }
}

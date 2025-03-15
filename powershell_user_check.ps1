# SP25 - ISS 212 Week 4 Tool Dev 2
# Jenn Moody
# Tool Dev Scenario 4

if (([System.Security.Principal.WindowsIdentity]::GetCurrent()).Groups -contains "S-1-5-32-544") {
    Write-Host "Administrator Privileges: Yes"
} else {
    Write-Host "Administrator Privileges: No"
}

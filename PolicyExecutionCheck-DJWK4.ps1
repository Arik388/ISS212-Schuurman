 # Douglas Schuurman
    # SP25 Week 4 Tool Dev Exercise
    #Notes / Reference
Write-Host "Current Execution Policy: $(Get-ExecutionPolicy)"
if ((Get-ExecutionPolicy) -in "Unrestricted", "Bypass"){
    Write-Host "Warning: Your execution policy allows all scripts to run. Ensure trusted sources are only allowed to run."
}
elseif((Get-ExecutionPolicy) -eq "Restricted") {
    Write-Host "Script cannot be executed on this system."
}
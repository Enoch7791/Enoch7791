
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Enoch Bibama
    LinkedIn        : inkedin.com/in/enochebibama/
    GitHub          : github.com/Enoch7791
    Date Created    : 2025-01-07
    Last Modified   : 2025-01-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500).ps1 
#>


# Define the registry path and value name
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Eventlog\Application"
$valueName = "MaxSize"
$newValue = 0x00008000  # This is the value for 32KB in DWORD format

# Check if the registry key exists; if not, create it
if (-not (Test-Path $regPath)) {
    Write-Host "Registry path does not exist. Creating it now..."
    New-Item -Path $regPath -Force
}

# Set the MaxSize registry value
Write-Host "Setting the MaxSize registry value to $newValue..."
Set-ItemProperty -Path $regPath -Name $valueName -Value $newValue

# Verify if the change was applied successfully
$updatedValue = Get-ItemProperty -Path $regPath -Name $valueName
Write-Host "MaxSize is set to: $($updatedValue.$valueName)"

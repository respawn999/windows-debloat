# Relaunch as admin if not already elevated
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Set-ItemProperty -path "HKLM:\SYSTEM\ControlSet001\Control\PriorityControl" -name "win32priorityseparation" -value "40"
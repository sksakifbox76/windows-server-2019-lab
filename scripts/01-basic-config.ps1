<#
.SYNOPSIS
  Basic configuration of the lab domain controller (MCSA topic 21).
.DESCRIPTION
  Renames the server, sets a static IPv4 address, points DNS at itself,
  sets the time zone and restarts. Run in an elevated PowerShell window.
  Find your adapter name first with: Get-NetAdapter
#>
param(
    [string]$ComputerName = "DC01",
    [string]$Adapter      = "Ethernet0",
    [string]$IPAddress    = "192.168.10.10",
    [int]   $PrefixLength = 24,
    [string]$DnsServer    = "127.0.0.1",
    [string]$TimeZoneId   = "India Standard Time"
)

Rename-Computer -NewName $ComputerName
New-NetIPAddress -InterfaceAlias $Adapter -IPAddress $IPAddress -PrefixLength $PrefixLength
Set-DnsClientServerAddress -InterfaceAlias $Adapter -ServerAddresses $DnsServer
Set-TimeZone -Id $TimeZoneId
Restart-Computer

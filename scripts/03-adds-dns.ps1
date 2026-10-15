<#
.SYNOPSIS
  Install AD DS and DNS, then promote DC01 to the first domain controller of a new forest (MCSA topics 2 and 3).
.NOTES
  Run in an elevated PowerShell window on DC01. You are prompted for the
  DSRM (Directory Services Restore Mode) password: use a strong one and keep it out of screenshots and Git.
  The server restarts by itself when the promotion finishes.
#>
Install-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools

Install-ADDSForest -DomainName "lab.local" -DomainNetbiosName "LAB" -InstallDns `
  -SafeModeAdministratorPassword (Read-Host -AsSecureString "DSRM password") -Force

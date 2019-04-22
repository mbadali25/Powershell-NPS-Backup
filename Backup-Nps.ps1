#----------------------------------------------------------------------------------------------
# Script: Backup-NPS.ps1
# Author: Matthew Badali
# Date: 04/21/2019 
# Comments:
#---------------------------------------------------------------------------------------------

### Parameters
Param(

   [Parameter(Mandatory=$true)]
   [ValidateScript({Test-Path $_ -PathType ‘Container’})]
   [string]$BackupDest,

   [string]$ComputerName = $env:COMPUTERNAME

) #end param

$date=(get-date).ToString("yyyy-MM-dd")
$BackupPath ="$($BackupDest)\$($ComputerName)\"
$BackupFileName = "$($BackupPath)$($ComputerName)-$($date)-NPSExport.xml"
if (!(Test-Path $BackupPath)) {new-item $BackupPath -ItemType Directory}

Export-NpsConfiguration -path $BackupFileName

##########Clean  up backups older than 7 days##############


$days ="-7"
$daysback= (Get-Date).AddDays($days)
(Get-ChildItem -Path $BackupPath -Recurse -force -ErrorAction SilentlyContinue | where {($_.CreationTime -lt  (Get-Date).AddDays($days) )} )| Remove-Item -Verbose -Force -Recurse -ErrorAction SilentlyContinue
 

###############################################################

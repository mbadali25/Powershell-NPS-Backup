# Powershell-NPS-Backup
NPS Backup Powershell for Server 2012 and up

Usage Example
.\Backup-Nps.ps1 -BackupDest "Path"

**Path accepts both UNC or regular drive path"

.\Backup-Nps.ps1 -BackupDest \\remotepath

This script will export the NPS Configuration to the desired path and put a date stamp on it.

Also it will check and remove files over than 7 days in the path.
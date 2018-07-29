@{

# Script module or binary module file associated with this manifest.
ModuleToProcess = 'ACLight.psm1'

# Version number of this module.
ModuleVersion = '2.0'

# ID used to uniquely identify this module
GUID = 'as1he1d9-s83j-38a7-mf27-fjs994j238sa'

# Author of this module
Author = "Asaf Hecht (@hechtov), it's using functions from PowerView project created by - Will Schroeder (@harmj0y)"

# Copyright statement for this module
Copyright = 'BSD 3-Clause'

# Description of the functionality provided by this module
Description = 'Privileged Account scanner through ACLs analysis - discover Shadow Admins'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Functions to export from this module
FunctionsToExport = @(
    'Get-ObjectAcl' ,
    'Invoke-ACLScanner'
    'Start-domainACLsAnalysis'
    'Start-ACLsAnalysis'
)

# List of all files packaged with this module
FileList = 'ACLight.psm1', 'ACLight.psd1', 'ACLight.ps1'

}

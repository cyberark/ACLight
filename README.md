# ACLight
A script for advanced discovery of Privileged Accounts - includes Shadow Admins.

The tool was published as part of the "Shadow Admins" research presentation at the InfoSecurity conference:
http://www.infosecurityeurope.com/en/Sessions/39674/Shadow-Admins-Underground-Accounts-That-Undermine-The-Network

# Overview
ACLight is a tool for discovering privileged accounts through advanced ACLs (Access Lists) analysis.
It includes the discovery of Shadow Admins in the scanned network.

The tool queries the Active Directory (AD) for its objects' ACLs and then filters and analyzes the sensitive permissions of each one.
The result is a list of domain privileged accounts in the network (from the advanced ACLs perspective of the AD).
You can run the scan with just any regular user (could be non-privileged user) and it automatically scans all the domains of the scanned network forest.

Execute it and check the result.
You should take care of all the privileged accounts that the tool discovers for you.
Especially - take care of the Shadow Admins - those are accounts with direct sensitive ACLs assignments (not through membership in other known privileged groups).

# Usage:
Option 1:
-	Double click on "Execute-ACLight.bat".
Option 2:
-	Open PowerShell (with -ExecutionPolicy Bypass)
-	Go to "ACLight" main folder
-	“Import-Module '.\ACLight.psm1'”
-	“Start-ACLsAnalysis”

# Reading the results files:
1) First check the - "Accounts with extra permissions.txt" file - It's straight-forward & important list of the privileged accounts that were discovered in the scanned network.
2) "All entities with extra permissions.txt" – Lists all the privileged entities that were discovered, it will include not only the user accounts but also other “empty” entities like empty groups or old accounts.
3) "Privileged Accounts Permissions - Final Report.csv" - This is the final summary report - in this file you will find what are the exact sensitive permissions each account has.
4) "Privileged Accounts Permissions - Irregular Accounts.csv" - Similar to the final report with only the privileged accounts that have direct assignment of ACL permissions (not through their group membership).
5) "research.com - Full Output.csv" – Raw ACLs lists for each scanned domain.

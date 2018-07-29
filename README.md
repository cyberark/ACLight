# ACLight
A tool for advanced discovery of Privileged Accounts - it includes Shadow Admins.  
ACLight2 is the improved version of the tool.

# Shadow Admins Research
The tool (version 1) was published as part of the "Shadow Admins" research - more details on "Shadow Admins" are in the blog post: https://www.cyberark.com/threat-research-blog/shadow-admins-stealthy-accounts-fear  
  
The research was also presented at the InfoSecurity conference, London:  
http://www.infosecurityeurope.com/en/Sessions/39674/Shadow-Admins-Underground-Accounts-That-Undermine-The-Network  

# Overview
ACLight is a tool for discovering privileged accounts through advanced ACLs analysis (objects’ ACLs - Access Lists, aka DACL\ACEs).  
It includes the discovery of Shadow Admins in the scanned network.
  
The tool queries the Active Directory (AD) for its objects' ACLs and then filters and analyzes the sensitive permissions of each one.
The result is a list of most privileged accounts in the network (from the advanced ACLs perspective of the AD).
You can run the scan with just any regular user, it could be a non-privileged user because it only performs legitimate read-only LDAP queries to the AD.

Just run it and check the result.

You should take care of all the privileged accounts that the tool discovers for you.  
Especially - take care of the Shadow Admins - those are accounts with direct sensitive ACLs assignments (as opposed of getting privileges as part of membership in known privileged groups).

For scanning cloud environments and discover the most privileged entities in AWS, check the new open source tool - SkyArk:  
https://github.com/cyberark/SkyArk  

# ACLight2

This is ACLight2 - the new version of ACLight scan. It’s much quicker, has a new scan architecture and better results.  
It solves scalability and performance issues from the previous version.  
  
In addition, ACLight2 is built on a recursive scan and provides multi-layered privileged accounts analysis.  
As a first step, the scan starts by building the first layer of privileged accounts. Those are the accounts who have direct privileges over the domain’s sensitive objects. Then, as a second step, the tool continues and scans the ACLs over those newly discovered privileged accounts from layer 1 and builds an optional second layer of new privileged accounts who have privileges over the accounts from the first layer. This second step is recursive, the tool keeps scanning for more optional layers of privileged accounts until all the privileged accounts chains are being enumerated.

# Usage:
Option 1:
-	Double click on "Execute-ACLight.bat".

Option 2:
-	Open PowerShell (with -ExecutionPolicy Bypass)
-	Go to "ACLight2" main folder
-	“Import-Module '.\ACLight2.psm1'”
-	“Start-ACLsAnalysis”

Choose the target domain:  
By default, ACLight automatically scans all the domains of the scanned network forest. You can use the “Domain” parameter if you are interested in scanning only one specific domain:
- Start-ACLsAnalysis -domain "DomainName.com"

# Reading the results files:
1) First, check the scan’s executive summary "Privileged Accounts - Layers Analysis.txt" - It's an important and straight-forward list of the most privileged accounts that were discovered in the scanned network.  
2) "Privileged Accounts Permissions - Final Report.csv" - This is the final summary report, in this file you will find what are the exact sensitive permissions each account has.  
4) "Privileged Accounts Permissions - Irregular Accounts.csv", similar to the final report with only the privileged accounts that have direct assignment of ACL permissions (not through their group membership).

# References:
The tool uses functions from the open source project PowerView by Will Schroeder ([@harmj0y](https://twitter.com/harmj0y)) - a great project.

For more comments and questions, you can contact Asaf Hecht (([@Hechtov](https://twitter.com/Hechtov)) and CyberArk Labs.

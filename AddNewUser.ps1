<#
.SYNOPSIS
    Brief description of what the script does.
    This script adds users to an Active Directory Organizational Unit from an existing .csv database.
	
	

.DESCRIPTION
    Detailed explanation of the script's purpose, functionality, and any important notes.

    This script imports a user database from a .csv file. After reading the data from reach column, users are created in the OU using the provided first names, last names, desired usernames, and user email addresses.

.PARAMETER <ParameterName>
    

.EXAMPLE
    Example usage:
    PS> .\AddNewUser.ps1 -Param1 "Path to users.csv"

.NOTES
    Author: Arslaan Khokhar
    Created: 2026-10-05
    Version: 1.01
    Last Modified: 2026-10-05
    Change Log:
        1.0 -   Initial Release
        1.01 -  Modified .csv directory


.LINK
    https://github.com/TheRealShani/SYST16023---Powershell-Scripts
#>

#Execution Code



import-csv "C:\Users\Administrator\Documents\Users.csv" | ForEach-Object {
$NewUserParameters =@{
'GivenName'= $_.FirstName
'Surname' = $_.LastName
'Name' = $_.UserName
"UserPrincipalName" = $_.UserPrincipalName 
"AccountPassword" = (ConvertTo-SecureString "p@33w0rd" -asPlainText -Force)
 }
New-ADUser @NewUserParameters -PassThru | Enable-ADAccount
 } 

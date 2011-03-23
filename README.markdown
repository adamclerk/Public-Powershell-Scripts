#Public Powershell Scripts#

##Lib Scripts##
###Microsoft.PowerShell_profile.ps1###
This is my profile for powershell.  It loads anything in the c:\ps1\lib\ folder that starts with lib-*.  I pulled the code for this file off of [Stackoverflow](
http://stackoverflow.com/questions/138144/whats-in-your-powershell-profile-ps1file/146937#146937).  

###lib-getConfigs.ps1###
Global function that is used to load config files.  Just pass in the path of the file minus the .config ending. I like to have my config files mirror my script names (script.ps1, script.config).

Usage:
	getConfigs c:\ps1\script
Returns:
	//filled hash of config strings
	@{}

###lib-repeatString.ps1###
Global function that is used to repeat strings.  I use rainmeter with a mono spaced font to display code and server stats.  It's a nice to have function when working with monospaced fonts

Usage:
	repeatString s 10

Returns
	//ssssssssss

##Useful Scripts##
###GetTCBuildStatus.ps1###
###PingSite###

##Not So Useful Scripts##
###AddDone.ps1###
###AddTodo.ps1###
###Widone.ps1###

##In Process Scripts##
###RemoteWebConfigUpdate.ps1###

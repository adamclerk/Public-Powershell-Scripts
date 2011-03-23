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
Pings the TeamCity installation and gets the status of the build. This script uses the getConfigs lib function with 2 separate config files

####GetTCBuildStatus.config####
	<configuration>
		<scriptSettings>
			<add key="username" value="XXXXXXX"/>
			<add key="password" value="YYYYYYY"/>
		</scriptSettings>
	</configuration>

####GetTCBuildStatus.build.config####
This config file takes a unique build label and the build number you want to query.  You can find the build number on your TeamCity installation.  Check the query string links for the build.
	<configuration>
		<scriptSettings>
			<add key="Unique Build Label" value="1"/>
			<add key="Unique Build Label" value="2"/>
		</scriptSettings>
	</configuration>

###PingSite.ps1###
Pings websites to see if they are up and running.  Will show the error number if somthing is wrong. I havent really tested this out too much. This script also uses the getConfigs lib function with the following config file.

####PingSite.config####
This config file takes as many key/value pairs as needed.  Key is the url, value is the label for the site.
	<configuration>
		<scriptSettings>		
			<add key="www.google.com" value="Google"/>
			<add key="www.msdn.com" value="MSDN"/>
		</scriptSettings>
	</configuration>

##Not So Useful Scripts##
###AddTodo.ps1###
Adds items to a todo list
###AddDone.ps1###
Adds items to a done list
###Widone.ps1###
Adds items to the done list
not sure why I created this one...

##In Process Scripts##
###RemoteWebConfigUpdate.ps1###
Need a script to remotly update webconfigs on remote environments.  Assumes you have access to a remote share that contains web.config

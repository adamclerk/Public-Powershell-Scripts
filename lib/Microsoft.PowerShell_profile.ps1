#Getting all libs into the global content
#http://stackoverflow.com/questions/138144/whats-in-your-powershell-profile-ps1file
Get-ChildItem c:\ps1\lib\lib-*.ps1 | % { 
      . $_
      #write-host "Loading library file:`t$($_.name)"
}

#create profilePath global variable
$global:profilePath = (Split-Path $MyInvocation.MyCommand.Path -Parent) 

#create lib drive
(New-PSDrive -Name lib -PSProvider FileSystem -Root c:\ps1\lib) > c:\temp.out
rm c:\temp.out

#move to ps1 folder
cd c:\ps1

#change background if admin
#http://bradwilson.typepad.com/blog/2010/06/getisadminps1.html
if ((isAdmin) -and (-not $psISE)) {
    $Host.UI.RawUI.BackgroundColor = "DarkRed"
    clear
}



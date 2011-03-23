#http://stackoverflow.com/questions/138144/whats-in-your-powershell-profile-ps1file
Get-ChildItem c:\ps1\lib\lib-*.ps1 | % { 
      . $_
      write-host "Loading library file:`t$($_.name)"
    }

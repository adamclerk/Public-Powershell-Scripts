# Test Sites
function printStatus($URL, $ALIAS)
{
	$FULLURL = 'http://' + $URL
	$i = 23
	$i = $i - [string]$ALIAS.Length

    trap
	{
		$error = [regex]::matches($($_.Exception), 'Unable to connect to the remote server')
		if($error[0].Value -eq 'Unable to connect to the remote server')
		{
			$num = 'TO'
		}
		else
		{
			$err = [regex]::matches($($_.Exception), "[0-9]+")
			$num = $err[0].Value
			$i = $i-1
		}
		
		$space = repeatString " " $i
		$ALIAS + $space + $num
		continue
    }
	
    $webclient = New-Object Net.WebClient
    # This is the main call
    if($webclient.DownloadString($FULLURL) -ne '')
	{
		$space = repeatString " " $i
		$ALIAS + $space + 'OK'
	}
}

$ss = getConfigs ($MyInvocation.MyCommand).Definition.replace(".ps1", "");

"-------------------------"
foreach ($site in $ss.keys)
{
	printStatus $site $ss[$site]
}
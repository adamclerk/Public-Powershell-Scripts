$command = $args[0]
$param = $args[1]

$xml = New-Object XML
$xml.Load("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Done\Done\Done.txt")

if($command -eq 'add')
{
	$xml.Done.Items = $xml.Done.Items +"- " +$param+ "`r`n" 
}

if($command -eq 'rm')
{
	$param = [int]$param
	$done = [string]$xml.Done.Items
	$done = $done.replace("`r","")
	$done = $done.replace("`n","")
	$dones = $done.split("-")
	$result = ""
	for($i=1; $i -le $dones.Length - 1; $i++)
	{
		if($i -ne ($param))
		{
			$result = $result +"- " +$dones[$i].Trim() + "`r`n"
		}
	}
	$xml.Done.Items = $result
}

if($command -eq 'clear')
{
	$xml.Done.Items = '' 
}
$xml.Save("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Done\Done\Done.txt")
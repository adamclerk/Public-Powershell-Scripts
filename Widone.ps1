$param = $args[0]

$xml = New-Object XML
$xml.Load("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Done\Done\Done.txt")
if($param -eq 'clear')
{
	$xml.Done.WI = ""	
}
else
{
	$xml.Done.WI = $xml.Done.WI + $param+ "`r`n" 
}
$xml.Save("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Done\Done\Done.txt")
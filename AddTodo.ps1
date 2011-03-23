$command = $args[0]
$param = $args[1]

$xml = New-Object XML
$xml.Load("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Notes\Notes\Notes.txt")

if($command -eq 'add')
{
	$xml.Todo.Notes = $xml.Todo.Notes +"- " +$param+ "`r`n" 
}

if($command -eq 'rm')
{
	$param = [int]$param
	$note = [string]$xml.Todo.Notes
	$note = $note.replace("`r","")
	$note = $note.replace("`n","")
	$notes = $note.split("-")
	$result = ""
	for($i=1; $i -le $notes.Length - 1; $i++)
	{
		if($i -eq ($param))
		{
			./addDone.ps1 add $notes[$i].Trim()
			#$result = $result +"- " +$notes[$i].Trim() + "`r`n"
		}
		else
		{
			$result = $result +"- " +$notes[$i].Trim() + "`r`n"
		}
	}
	$xml.Todo.Notes = $result
}
$xml.Save("C:\Users\adamc.UNITYMG\Documents\Rainmeter\Skins\SimpleMeter_v2.0\Notes\Notes\Notes.txt")
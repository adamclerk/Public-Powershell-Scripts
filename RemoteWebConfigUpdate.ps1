$webConfigs = getConfigs ($MyInvocation.MyCommand).Definition.replace(".ps1", "")
$webConfigArr = @()

foreach ($wc in $webConfigs.keys)
{
	$webConfigArr += $wc
}
$webConfigArr = $webConfigArr | Sort-Object
$webConfigArr += 'Quit'

#$bad = "Test Jlog Manager","Test Jlog Client","Dev Jlog Manager","Dev Jlog Client","Stage Jlog Manager","Stage Jlog Client"
$selection = menu $webConfigArr "WHICH WEB CONFIG DO YOU WANT TO TOGGLE?"
Write-Host "YOU SELECTED : $selection ... DONE!`n"


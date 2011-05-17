function printStatus($buildName, $buildID)
{
	$wc = new-object system.net.webclient
	$wc.credentials = new-object system.net.networkcredential($as["username"], $as["password"])
	$url = "http://tc.unitymg.com:8111/httpAuth/feed.html?buildTypeId=bt$buildID&itemsType=builds&itemsCount=1"
	[xml]$xml = $wc.DownloadString($url)
	$i = 25
	$i = $i - [string]$buildName.Length
	if($xml.feed.entry.creator -eq "Successful Build")
	{
		$i = $i-2
		$space = repeatString " " $i
		$buildName + $space + "OK"
	}
	else
	{
		$i = $i-4
		$space = repeatString " " $i
		$buildName + $space + "FAIL"
	}
}

$as = getConfigs ($MyInvocation.MyCommand).Definition.replace(".ps1", "")
$builds = getConfigs ($MyInvocation.MyCommand).Definition.replace(".ps1", ".build")

"-------------------------"
foreach ($build in $builds.keys)
{
	printStatus $build $builds[$build]
}
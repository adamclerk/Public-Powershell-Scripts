#http://rkeithhill.wordpress.com/2006/06/01/creating-and-using-a-configuration-file-for-your-powershell-scripts/
function global:getConfigs
{
	param(
		[string]$configName = ""
	)
	
	try
	{
		if($configName -eq "")
		{
			return @{}
		}

		$appSettings = @{}
		$configName = $configName + ".config"
		$config = [xml](get-content $configName -ErrorAction STOP)
		if($config -eq '')
		{
			return $appSettings["isEmpty"] = "true"
		}
		
		foreach($addNode in $config.configuration.scriptsettings.add){
			$value = $addNode.Value
			$appSettings[$addNode.Key] = $value
		}
		return $appSettings
	}
	catch
	{
		return @{}
	}
}
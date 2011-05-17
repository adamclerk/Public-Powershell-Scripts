#http://rkeithhill.wordpress.com/2006/06/01/creating-and-using-a-configuration-file-for-your-powershell-scripts/
function global:Get-List
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

		$config = [xml](get-content $configName -ErrorAction STOP)
		
		foreach($node in $config.list.item)
		{
			$node
		}
	}
	catch
	{
		$node
	}
}
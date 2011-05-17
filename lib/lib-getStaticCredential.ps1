function global:Get-StaticCredential
{
	param(
		[string]$passwordFilePath = "",
		[string]$account = ""
	)
	
	if($account -eq "")
	{
		$comp = GWMI -ComputerName "." -Class Win32_ComputerSystem
		$account = $comp.UserName
	}
	
	if($passwordFilePath -eq "")
	{
		$passwordFilePath = 'c:\password.txt'
	}
	
	$password = get-content $passwordFilePath | convertto-securestring
	$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $account, $password
	return $credential
}
function global:Create-PasswordFile
{
	param(
		[string]$fileName = "password.txt"
	)

	try
	{
		"Please provide a password and press enter"
		read-host -assecurestring | convertfrom-securestring | out-file $fileName	
	}
	catch
	{
		"An error has occured"
	}

}

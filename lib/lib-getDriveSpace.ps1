function global:Get-DriveSpace
{
	#$input
		
	foreach ($computer in $input)
	{
		$pass = Get-Content $computer.passwordFile | ConvertTo-SecureString
		$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $computer.account, $pass
		$drives = Get-WmiObject -ComputerName $computer.ipaddress Win32_LogicalDisk -Credential $cred | Where-Object {$_.DriveType -eq 3} 

		foreach($drive in $drives) 
		{ 
	        $size1 = $drive.size / 1GB  
	        $size = "{0:N2}" -f $size1 
	        $free1 = $drive.freespace / 1GB 
	        $free = "{0:N2}" -f $free1 
	        $ID = $drive.DeviceID 
	        $a = $free1 / $size1 * 100 
	        $b = "{0:N2}" -f $a 
 		
	        if (($ID -eq "C:") -and ($free1 -lt 1)) 
	        {
				$line = New-Object PSObject -Property @{
					Computer = $computer.name
					IPAddress = $computer.ipaddress
					Drive = $ID
					Size = [float]$size
					Free = [float]$free
					Status = "WARNING"
					}
#					Add-Member -Input $line NoteProperty "Computer" $computer.name
#					Add-Member -Input $line NoteProperty "IPAddress" $computer.ipaddress
#					Add-Member -Input $line NoteProperty "Drive" $ID
#					Add-Member -Input $line NoteProperty "Size" [float]$size
#					Add-Member -Input $line NoteProperty "Free" [float]$free
#					Add-Member -Input $line NoteProperty "Status" "WARNING"
				
				$line
	        } 
			else
			{
				$line = New-Object PSObject -Property @{
					Computer = $computer.name
					IPAddress = $computer.ipaddress
					Drive = $ID
					Size = [float]$size
					Free = [float]$free
					Status = "OK"
					}
#					Add-Member -Input $line NoteProperty "Computer" $computer.name
#					Add-Member -Input $line NoteProperty "IPAddress" $computer.ipaddress
#					Add-Member -Input $line NoteProperty "Drive" $ID
#					Add-Member -Input $line NoteProperty "Size" [float]$size
#					Add-Member -Input $line NoteProperty "Free" [float]$free
#					Add-Member -Input $line NoteProperty "Status" "OK"
				
				Write-Output $line
			}
			
	    } 
	}
}
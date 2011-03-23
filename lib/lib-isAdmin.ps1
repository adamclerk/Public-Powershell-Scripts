#http://bradwilson.typepad.com/blog/powershell/
function global:isAdmin()
{
	$windowsIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$windowsPrincipal = new-object 'System.Security.Principal.WindowsPrincipal' $windowsIdentity
	 
	return $windowsPrincipal.IsInRole("Administrators")
}
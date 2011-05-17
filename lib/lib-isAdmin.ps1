#http://bradwilson.typepad.com/blog/2010/06/getisadminps1.html
function global:isAdmin()
{
	$windowsIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$windowsPrincipal = new-object 'System.Security.Principal.WindowsPrincipal' $windowsIdentity
	 
	return $windowsPrincipal.IsInRole("Administrators")
}
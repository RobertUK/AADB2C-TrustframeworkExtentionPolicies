#
# CAREFUL! 
# This script is intended to reset a B2C demo environment
# It deletes IEF Keys, IEF Policies, Users (excl GlobalAdmins), Groups and Applications (excl b2c-extensions-app)
#
#exit # safety switch

#$auth =Connect-AzureADB2CDevicelogin -TenantID $global:TenantName -Scope "TrustFrameworkKeySet.ReadWrite.All Policy.ReadWrite.TrustFramework Application.ReadWrite.All User.ReadWrite.All Group.ReadWrite.All"
#$authHeader =@{ 'Content-Type'='application/json'; 'Authorization'=$auth.token_type + ' ' + $auth.access_token }



eyJ0eXAiOiJKV1QiLCJub25jZSI6Ikh1bnJfNHM3NW5IVlg2dDF2UnNkWm5QX3QwTmxrMUVvZkx3bC0wV2l3bDgiLCJhbGciOiJSUzI1NiIsIng1dCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyIsImtpZCI6Ii1LSTNROW5OUjdiUm9meG1lWm9YcWJIWkdldyJ9.eyJhdWQiOiIwMDAwMDAwMy0wMDAwLTAwMDAtYzAwMC0wMDAwMDAwMDAwMDAiLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9mMWM3MTVmZC02YjVmLTQ0NDMtYTYyMS02Y2M4MzEwMTdjMjEvIiwiaWF0IjoxNjg2MzEzMzM1LCJuYmYiOjE2ODYzMTMzMzUsImV4cCI6MTY4NjQwMDAzNSwiYWNjdCI6MCwiYWNyIjoiMSIsImFpbyI6IkFUUUF5LzhUQUFBQWorbGNnTlB5T1grQllBak84Q1FRMkN3d0toMUNIUGw4TWY0ZEtaaENaK29FNGdzZGdweUFJM3RlMlVlYlFoMzMiLCJhbXIiOlsicHdkIl0sImFwcF9kaXNwbGF5bmFtZSI6IkdyYXBoIEV4cGxvcmVyIiwiYXBwaWQiOiJkZThiYzhiNS1kOWY5LTQ4YjEtYThhZC1iNzQ4ZGE3MjUwNjQiLCJhcHBpZGFjciI6IjAiLCJnaXZlbl9uYW1lIjoid3d3IiwiaWR0eXAiOiJ1c2VyIiwiaXBhZGRyIjoiOTIuNDAuMTk3LjIwIiwibmFtZSI6InJvYmVydCIsIm9pZCI6IjgxNzdiZDdmLWZjMWItNDE3Yi05MWVkLWNlMzYwYzBhZWZhZCIsInBsYXRmIjoiMyIsInB1aWQiOiIxMDAzMjAwMjNFMTkyNDlBIiwicmgiOiIwLkFTTUFfUlhIOFY5clEwU21JV3pJTVFGOElRTUFBQUFBQUFBQXdBQUFBQUFBQUFBakFHTS4iLCJzY3AiOiJBUElDb25uZWN0b3JzLlJlYWQuQWxsIEFQSUNvbm5lY3RvcnMuUmVhZFdyaXRlLkFsbCBBcHBsaWNhdGlvbi5SZWFkLkFsbCBBcHBsaWNhdGlvbi5SZWFkV3JpdGUuQWxsIENhbGVuZGFycy5SZWFkV3JpdGUgQ2hhdC5SZWFkIENoYXQuUmVhZEJhc2ljIENvbnRhY3RzLlJlYWRXcml0ZSBEZXZpY2VNYW5hZ2VtZW50QXBwcy5SZWFkLkFsbCBEZXZpY2VNYW5hZ2VtZW50QXBwcy5SZWFkV3JpdGUuQWxsIERldmljZU1hbmFnZW1lbnRNYW5hZ2VkRGV2aWNlcy5SZWFkLkFsbCBEZXZpY2VNYW5hZ2VtZW50TWFuYWdlZERldmljZXMuUmVhZFdyaXRlLkFsbCBEZXZpY2VNYW5hZ2VtZW50UkJBQy5SZWFkLkFsbCBEZXZpY2VNYW5hZ2VtZW50U2VydmljZUNvbmZpZy5SZWFkLkFsbCBEZXZpY2VNYW5hZ2VtZW50U2VydmljZUNvbmZpZy5SZWFkV3JpdGUuQWxsIERpcmVjdG9yeS5BY2Nlc3NBc1VzZXIuQWxsIERpcmVjdG9yeS5SZWFkLkFsbCBEaXJlY3RvcnkuUmVhZFdyaXRlLkFsbCBGaWxlcy5SZWFkV3JpdGUuQWxsIEdyb3VwLlJlYWRXcml0ZS5BbGwgSWRlbnRpdHlSaXNrRXZlbnQuUmVhZC5BbGwgSWRlbnRpdHlVc2VyRmxvdy5SZWFkV3JpdGUuQWxsIE1haWwuUmVhZCBNYWlsLlJlYWRXcml0ZSBNYWlsYm94U2V0dGluZ3MuUmVhZFdyaXRlIE5vdGVzLlJlYWRXcml0ZS5BbGwgb3BlbmlkIFBlb3BsZS5SZWFkIFBsYWNlLlJlYWQgUG9saWN5LlJlYWRXcml0ZS5UcnVzdEZyYW1ld29yayBQcmVzZW5jZS5SZWFkIFByZXNlbmNlLlJlYWQuQWxsIFByaW50ZXJTaGFyZS5SZWFkQmFzaWMuQWxsIFByaW50Sm9iLkNyZWF0ZSBQcmludEpvYi5SZWFkQmFzaWMgcHJvZmlsZSBSZXBvcnRzLlJlYWQuQWxsIFNpdGVzLlJlYWRXcml0ZS5BbGwgVGFza3MuUmVhZFdyaXRlIFRydXN0RnJhbWV3b3JrS2V5U2V0LlJlYWRXcml0ZS5BbGwgVXNlci5SZWFkIFVzZXIuUmVhZC5BbGwgVXNlci5SZWFkQmFzaWMuQWxsIFVzZXIuUmVhZFdyaXRlIFVzZXIuUmVhZFdyaXRlLkFsbCBlbWFpbCIsInN1YiI6IkJPZG1SbnMyX1Rjb0dnU18zYm0tRnc1NFhyWmdabllFLWZpY2Zybjl2Y2MiLCJ0ZW5hbnRfcmVnaW9uX3Njb3BlIjoiRVUiLCJ0aWQiOiJmMWM3MTVmZC02YjVmLTQ0NDMtYTYyMS02Y2M4MzEwMTdjMjEiLCJ1bmlxdWVfbmFtZSI6InJvYmVydEBpdHRoaW5nc2IyYy5vbm1pY3Jvc29mdC5jb20iLCJ1cG4iOiJyb2JlcnRAaXR0aGluZ3NiMmMub25taWNyb3NvZnQuY29tIiwidXRpIjoiRVl4TXMyQi04RXFxcVVDZ0E4QUVBQSIsInZlciI6IjEuMCIsIndpZHMiOlsiNjJlOTAzOTQtNjlmNS00MjM3LTkxOTAtMDEyMTc3MTQ1ZTEwIiwiOWI4OTVkOTItMmNkMy00NGM3LTlkMDItYTZhYzJkNWVhNWMzIiwiYmUyZjQ1YTEtNDU3ZC00MmFmLWEwNjctNmVjMWZhNjNiYzQ1IiwiMGY5NzFlZWEtNDFlYi00NTY5LWE3MWUtNTdiYjhhM2VmZjFlIiwiNmU1OTEwNjUtOWJhZC00M2VkLTkwZjMtZTk0MjQzNjZkMmYwIiwiYjc5ZmJmNGQtM2VmOS00Njg5LTgxNDMtNzZiMTk0ZTg1NTA5Il0sInhtc19jYyI6WyJDUDEiXSwieG1zX3NzbSI6IjEiLCJ4bXNfc3QiOnsic3ViIjoiZmZsOTl1M0xyLWw1SGF4Nk1HN3pZX3NzaTlnVnJUSXdBUS0yMUhJSnlxVSJ9LCJ4bXNfdGNkdCI6MTYzNDA0MTcyMn0.qmQkuG5gnlEuro3izmuisdx5N_bSKlD9ykgSAKf2vVg-7V8SSBnU5eioqTeM_bEGZnm3vO_EmM7fXeFZmhfkJs5G039yPyrVosrfNpDcXYeppoxJDEo97F0f9X95mcNxqZu47FPn6CT-vkZI6ITiW-RlUNpms2qouaNELMvtHgSE9lYMo9Va9uWIxDyOnf_VOq9PcTaqVgHxu4NPzewenbUIAVvIWtAts2G0Z87Im8eTgpvvkPD7aObTFSXa1igfGNzuNDbMhnUNd56XLxgtAc0Kvu9UaDy24ExgknYFkxlv4PG0OAH5sann4-p0pvrjsWf1YMXFKJQSKDNJUPJyHQ


# delete all IEF Policy Keys
$url = "https://graph.microsoft.com/beta/trustFramework/keySets"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $pkey in $resp.value ) {
     $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($pkey.id)" -Headers $authHeader  
}

# delete all IEF Custom Policies
$url = "https://graph.microsoft.com/beta/trustFramework/policies"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $p in $resp.value ) {
     $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($p.id)" -Headers $authHeader  
}

# get all Global Admins (so we don't delete them)
$url = "https://graph.microsoft.com/beta/directoryRoles?`$filter=displayName eq 'Global Administrator'"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
$idGlobalAdmin = $resp.value.id

$url = "https://graph.microsoft.com/beta/directoryRoles/$idGlobalAdmin/members"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
$globalAdmins = $resp.value

# delete all users EXCEPT admins (otherwise you would be locked out)
$url = "https://graph.microsoft.com/beta/users"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $u in $resp.value ) {
    # don't delete Admins
    # if ( !($u.UserPrincipalName.IndexOf("#EXT#") -gt 0 -or $u.UserPrincipalName.StartsWith("graphexplorer@") -eq $True) ) {
    if ( $null -eq ( Compare-Object -IncludeEqual -ExcludeDifferent $u.id $globalAdmins.id) ) {
        $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($u.id)" -Headers $authHeader  
    } else {
        write-host "Skipping Global Admin " $u.id $u.displayName 
    }
}

# delete all groups
$url = "https://graph.microsoft.com/beta/groups"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $g in $resp.value ) {
    $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($g.id)" -Headers $authHeader  
}

# delete all applications
$url = "https://graph.microsoft.com/beta/applications"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $a in $resp.value ) {
    if ( !$a.displayName.StartsWith("b2c-extensions-app")) { # do NOT delete this app
        $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($a.id)" -Headers $authHeader  
    }
}

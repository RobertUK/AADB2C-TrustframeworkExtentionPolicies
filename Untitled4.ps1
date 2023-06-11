Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
if ($null -eq (get-module Az.Accounts)) {
    Install-Module -Name Az.Accounts -Scope CurrentUser -Repository PSGallery -Force
    Import-Module -Name Az.Accounts
}


cd G:\git\AADB2C-TrustframeworkExtentionPolicies\default
Import-Module -

 Import-Module ..\Az.ADB2C.psm1 -Force

 ..\aadb2c-create-graph-app.ps1

 Connect-AzADB2C -ConfigPath .\b2cAppsettings_itthingsb2c.json -TenantName "itthingsb2c.onmicrosoft.com"

Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All"

Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All"

   "client_id":  "31fd2d44-5cbe-4d56-8123-681fc6e683e8",
                              "client_secret":  "Uet8Q~h-OpipTsZgnvF12hTqhjKjicD6MiACoab6"

New-AzADB2CGraphApp -n "B2C-Graph-App" -CreateConfigFile
  Import-Module .\Az.ADB2C.psm1 -Force

  Import-Module .\AzureADB2C-Scripts.psm1


  AzureADB2C-Scripts.psm1

Connect-AzADB2CDevicelogin - -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Application.Read.All Policy.ReadWrite.TrustFramework" -ClientID "31fd2d44-5cbe-4d56-8123-681fc6e683e8" -


Connect-AzADB2C -ConfigPath .\b2cAppSettings_yourtenant.json




 Connect-AzureAD 
cd G:\git\AADB2C-TrustframeworkExtentionPolicies\test
Connect-AzADB2CDevicelogin2 - - -Interactive  -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Application.Read.All Policy.ReadWrite.TrustFramework"

Read-AzADB2CConfig -PolicyPrefix 'demo'
New-AzADB2CPolicyProject -PolicyPrefix "" 
)
{

    if ( $True -eq $Clean ) {
        $TenantName = "itthingsb2c.onmicrosoft.com"
        $IefAppName = "IdentityExperienceFramework"
       $global:b2cAppSettings.IefProxyAppName = "ProxyIdentityExperienceFramework"

Connect-AzADB2CDevicelogin

Set-AzADB2CPolicyDetails -Clean



Get-Application -DisplayName $iefProxyAdppName -Select "id,appid"


Invoke-GraphRestMethodGet "applications?`$filter=displayName eq '$iefProxyAppName'&`$select=id,appid"


Import-AzADB2CPolicyToTenant 
Test-AzADB2CPolicy -n "IEF-Test-App"-p .\SignUpOrSignin.xml

Repair-AzADB2CUserJourneyOrder
..\clean-b2c-tenant.ps1


Remove-AzADB2


Import-Module Microsoft.Graph.Identity.SignIns

Remove-MgTrustFrameworkKeySet -TrustFrameworkKeySetId $trustFrameworkKeySetId
Connect-AzADB2C -ConfigPath .\b2cAppSettings_yourtenant.json

CPolicyFromTenant

$auth =Connect-AzureADB2CDevicelogin -TenantID $global:TenantName -Scope "TrustFrameworkKeySet.ReadWrite.All Policy.ReadWrite.TrustFramework Application.ReadWrite.All User.ReadWrite.All Group.ReadWrite.All"
$authHeader =@{ 'Content-Type'='application/json'; 'Authorization'=$auth.token_type + ' ' + $auth.access_token }

import-Module AzureADPreview -Force -AllowClobber -Confirm
Connect-AzureAD -Tenant "itthingsb2c.onmicrosoft.com" -MsAccessToken -cr

Get-AzureADMSTrustFrameworkPolicy -Verbose

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

New-AzADB2CGraphApp -n "B2C-Graph-App"


Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All" -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d"

Install-Module AzureADPreview

$AzureAdCred = Get-Credential
Connect-AzureAD -Tenant "itthingsb2c.onmicrosoft.com" -Credential $AzureAdCred


Get-AzureADMSTrustFrameworkPolicy


 Import-Module ..\Az.ADB2C.psm1 -Force

Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All" -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d" 

 New-AzADB2CGraphApp -n "B2C-Graph-App" -CreateConfigFile -Verbose -Debug


 $DeviceCodeRequestParams

 Import-Module ..\Az.ADB2C.psm1 -Force

 $Resource = "https://graph.microsoft.com/"
 $ClientId = "68958472-9497-4daf-b29c-e4140fb12e6d" 
 $Scope = "Directory.ReadWrite.All"

     $url = "https://microsoft.com/devicelogin"
    $pgm, $params = Get-BrowserInfo -Chrome $True  -Incognito $True -NewWindow $True
    #try {
        $DeviceCodeRequestParams = @{
            Method = 'POST'
            Uri    = "https://login.microsoftonline.com/$TenantName/oauth2/devicecode"
            Body   = @{
                resource  = $Resource
                client_id = $ClientId
                scope = $Scope
            }
        }
        $DeviceCodeRequest = Invoke-RestMethod @DeviceCodeRequestParams
        write-host $DeviceCodeRequest
        Write-Host $DeviceCodeRequest.message -ForegroundColor Yellow
        $url = $DeviceCodeRequest.verification_url

        Set-Clipboard -Value $DeviceCodeRequest.user_code

        Start-Browser -pgm $pgm -params $params -url $url    
        $Timeout = 300
        
        $TokenRequestParams = @{
            Method = 'POST'
            Uri    = "https://login.microsoftonline.com/$TenantName/oauth2/token"
            Body   = @{
                grant_type = "urn:ietf:params:oauth:grant-type:device_code"
                code       = $DeviceCodeRequest.device_code
                client_id  = $ClientId
            }
        }
        $TimeoutTimer = [System.Diagnostics.Stopwatch]::StartNew()
        while ([string]::IsNullOrEmpty($TokenRequest.access_token)) {
            if ($TimeoutTimer.Elapsed.TotalSeconds -gt $Timeout) {
                throw 'Login timed out, please try again.'
            }
            $TokenRequest = try {
                Invoke-RestMethod @TokenRequestParams -ErrorAction Stop
            }
            catch {
                $Message = $_.ErrorDetails.Message | ConvertFrom-Json
                if ($Message.error -ne "authorization_pending") {
                    throw
                }
            }
            Start-Sleep -Seconds 1
        }
        $retVal = $TokenRequest
        write-host $TokenRequest.access_token



        $Token = Connect-AzureDevicelogin -Interactive -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d" 
$Headers = @{'Authorization' = "Bearer $Token" }
$UsersUri = 'https://graph.microsoft.com/v1.0/users?$top=5'
$Users = Invoke-RestMethod -Method GET -Uri $UsersUri -Headers $Headers
$Users.value.userprincipalname

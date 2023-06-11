$TokenRequestParams = @{
    Method = 'POST'
    Uri    = "https://login.microsoftonline.com/itthingsb2c.onmicrosoft.com/oauth2/token"
    Body   = @{
        grant_type = "urn:ietf:params:oauth:grant-type:device_code"
        code       = $DeviceCodeRequest.device_code
        client_id  = $ClientId
    }
}
$TokenRequest = Invoke-RestMethod @TokenRequestParams
$auth = Invoke-RestMethod @TokenRequestParams

$auth =Connect-AzureADB2CDevicelogin -TenantID $global:TenantName -Scope "TrustFrameworkKeySet.ReadWrite.All Policy.ReadWrite.TrustFramework Application.ReadWrite.All User.ReadWrite.All Group.ReadWrite.All"
$authHeader =@{ 'Content-Type'='application/json'; 'Authorization'=$auth.token_type + ' ' + $auth.access_token }




# delete all IEF Policy Keys
$url = "https://graph.microsoft.com/beta/trustFramework/keySets"
$resp = Invoke-RestMethod -Method GET -Uri $url -Headers $authHeader  
foreach( $pkey in $resp.value ) {
     $ret = Invoke-RestMethod -Method "DELETE" -Uri "$url/$($pkey.id)" -Headers $authHeader  
}


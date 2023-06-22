
    Import-Module -Name Az.Accounts



cd G:\git\AADB2C-TrustframeworkExtentionPolicies\default


 Import-Module ..\Az.ADB2C.psm1 -Force



# Connect-AzADB2C -ConfigPath .\b2cAppsettings_itthingsb2c.json -TenantName "itthingsb2c.onmicrosoft.com" -


#Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All" -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d"


Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Application.Read.All Policy.ReadWrite.TrustFramework" -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d" 

#Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All" -ClientID "c94fd5ca-09d3-4740-8998-627c22e2bdce"

#Enable-AzADB2CIdentityExperienceFramework -n "ABC-WebApp" -f "abc123"

Import-AzADB2CPolicyToTenant 





#Test-AzADB2CPolicy -n "IEF-Test-App"-p .\SignUpOrSignIn.xml -Incognito $False -NewWindow $False #'-Firefox $true
#cd G:\git\AADB2C-TrustframeworkExtentionPolicies\old2



Test-AzADB2CPolicy -n "IEF-Test-App"-p .\SignUpOrSignIn.xml 




Test-AzADB2CPolicy -n "IEF-Test-App"-p .\SignUpOrSignInWithPhone.xml




Repair-AzADB2CUserJourneyOrder


#New-AzADB2CPolicyProject -PolicyPrefix "smfa" -PolicyType "SocialAndLocalAccountsWithMfa"

Set-AzADB2CCustomizeUX -FullContentDefinition  -DownloadHtmlTemplates -urlBaseUx "https://itthings.blob.core.windows.net/public/b2c"
 
 Set-AzADB2CAppInsights -InstrumentationKey "0767870b-14e3-4ba0-bebf-da140824069b" 

Add-AzADB2CClaimsProvider -ProviderName "google" -client_id "37277257186-v6vefm376h91d89ncsj2elhur15ol6iq.apps.googleusercontent.com" -BasePolicyFileName "Phone_Email_Base.xml"

Add-AzADB2CClaimsProvider -ProviderName "amazon" -client_id "amzn1.application-oa2-client.029a9735514244ca8635dda00cc2c0f2"
Add-AzADB2CClaimsProvider -ProviderName "linkedid" -client_id "78ko5x2dd5my14"
Add-AzADB2CClaimsProvider -ProviderName "AzureAD" -client_id "69520ca6-defe-4a2e-b303-c4f6b10b2b16" -AadTenantName "itthings.co.uk" 
Add-AzADB2CClaimsProvider -ProviderName "github" -client_id "aa627537488804f38ed493abee10eb3795b0b96f"


New-AzADB2CPolicyKey -KeyContainerName "GithubSecret" -KeyType "secret" -KeyUse "sig" -Secret "aa627537488804f38ed493abee10eb3795b0b96f"
New-AzADB2CPolicyKey -KeyContainerName "ITThingsSecret" -KeyType "secret" -KeyUse "sig" -Secret "pMP8Q~NO~vl.pNVAUR0kDorFUialPU8awbxiMaNF"
New-AzADB2CPolicyKey -KeyContainerName "AmazonSecret" -KeyType "secret" -KeyUse "sig" -Secret "f72dca411009a7b2a6ea20c1413d54088d9f4e2fa799a852d5a3cfb65ac0155c"
New-AzADB2CPolicyKey -KeyContainerName "LinkedInSecret" -KeyType "secret" -KeyUse "sig" -Secret "bXCwyMMP4lkHdDwa"
New-AzADB2CPolicyKey -KeyContainerName "GoogleSecret" -KeyType "secret" -KeyUse "sig" -Secret "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"
New-AzADB2CPolicyKey -KeyContainerName "MicrosoftAccountSecret" -KeyType "secret" -KeyUse "sig" -Secret "rwm8Q~S62yIv2c2hOFn1mhXI4MWHcPaVxc.SJdcj"
New-AzADB2CPolicyKey -KeyContainerName "FacebookSecret" -KeyType "secret" -KeyUse "sig" -Secret "41441d795a4577c6b05645ee129b2e90"
New-AzADB2CPolicyKey -KeyContainerName "AzureStorageSecret" -KeyType "secret" -KeyUse "sig" -Secret "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q=="

New-AzADB2CPolicyKey -KeyContainerName "ITThingsAppSecret" -KeyType "secret" -KeyUse "sig" -Secret "pMP8Q~NO~vl.pNVAUR0kDorFUialPU8awbxiMaNF"

 Import-Module ..\Az.ADB2C.psm1 -Force

 Import-AzADB2CHtmlContent -f "\html\idp_logos\white\itthings.png" -a "itthings" -p "public/b2c/idp_logos/white" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
 Import-AzADB2CHtmlContent -f "\html\idp_logos\colored\itthings.png" -a "itthings" -p "public/b2c/idp_logos/colored" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 

 Import-AzADB2CHtmlContent -f "\html\idp_logos\white\github.svg" -a "itthings" -p "public/b2c/idp_logos/white" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
 Import-AzADB2CHtmlContent -f "\html\idp_logos\colored\github.svg" -a "itthings" -p "public/b2c/idp_logos/colored" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 

 cd G:\test\AADB2C-TrustframeworkExtentionPolicies\old2

  Import-AzADB2CHtmlContent -f "\html\unified.cshtml" -a "itthings" -p "public/b2c" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
  Import-AzADB2CHtmlContent -f "\html\exception.cshtml" -a "itthings" -p "public/b2c" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
  Import-AzADB2CHtmlContent -f "\html\selfAsserted.cshtml" -a "itthings" -p "public/b2c" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
Import-AzADB2CHtmlContent -f "\html\idpSelector.cshtml" -a "itthings" -p "public/b2c" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 
Import-AzADB2CHtmlContent -f "\html\multifactor-1.0.0.cshtml" -a "itthings" -p "public/b2c" -k "3riZNMFsvpLbuNQ4joHYbw8nLvcN14XguERFlMMN8OxvVZCcgbNXbaqx8VhwIib3B4Ux+BemuwYe+AStROd35Q==" 


Test-AzADB2CPolicy -n "IEF-Test-App"-p .\SignUpOrSignIn.xml

$username = "robert@itthingsb2c.onmicrosoft.com"
$password = convertto-securestring -String "Rooftop1!" -AsPlainText -Force

$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password

#
Connect-AzureAD -t "itthingsb2c.onmicrosoft.com" -Credential $cred
#

# 1. get the user
$user = (Get-AzureADUser -ObjectId  "e02a77f6-9eaf-44f2-9c4b-99158f942ff3")
 
# 2. create the group
$group = New-AzureADGroup -DisplayName "Blog Administrators" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"
 
# 3. add the user as a member of the group
Add-AzureADGroupMember -ObjectId $group.ObjectID -RefObjectId $user.ObjectID
 
# 4. get the app's service principal
$spo =(Get-AzureADServicePrincipal -Filter "DisplayName eq 'Blog'")
 
# 5. find the role by name
$roleAppAdmin = ($spo.AppRoles | Where {$_.DisplayName -eq "admin"})
 
# 6. Assign the group to the AppRole
New-AzureADGroupAppRoleAssignment -ObjectId $group.ObjectId -PrincipalId $group.ObjectId -ResourceId $spo.ObjectId -Id $roleAppAdmin.id



Test-AzADB2CPolicy -n "Blog"-p .\SignUpOrSignIn.xml
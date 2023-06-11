cd ./de


 Import-Module .\Az.ADB2C.psm1

 Connect-AzADB2CDevicelogin -TenantName "itthingsb2c.onmicrosoft.com" -Scope "Directory.ReadWrite.All" -ClientID "68958472-9497-4daf-b29c-e4140fb12e6d"

 New-AzADB2CGraphApp -n "B2C-Graph-App" -CreateConfigFile
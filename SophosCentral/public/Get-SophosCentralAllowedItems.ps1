function Get-SophosCentralAllowedItems {
    <#
        .DESCRIPTION
        https://developer.sophos.com/docs/endpoint-v1/1/routes/settings/allowed-items/get
    #>
    $uriChild = '/endpoint/v1/settings/allowed-items'
    $uri = [System.Uri]::New($GLOBAL:SophosCentral.RegionEndpoint + $uriChild)
    Invoke-SophosCentralWebRequest -Uri $uri
}
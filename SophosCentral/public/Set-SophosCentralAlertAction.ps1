function Set-SophosCentralAlertAction {
    <#
    .SYNOPSIS
        Trigger a scan on Endpoints in Sophos Central
    .DESCRIPTION
        Trigger a scan on Endpoints in Sophos Central
    .PARAMETER Action
        The alert action to perform. To get the possible actions for an alert, check it the results from Get-SophosCentralAlerts

        The action must be in the same capitalization as listed, otherwise it will fail
    .EXAMPLE
        Set-SophosCentralAlertAction. -AlertID "6d41e78e-0360-4de3-8669-bb7b797ee515" -Action "clearThreat"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [Alias("ID")]
        [string[]]$AlertID,

        [Parameter(Mandatory = $true)]
        [ValidateSet('acknowledge', 'cleanPua', 'cleanVirus', 'authPua', 'clearThreat', 'clearHmpa', 'sendMsgPua', 'sendMsgThreat')]
        [string]$Action,

        [string]$message
    )
    begin {
        $uriChild = "/common/v1/alerts/{0}/actions"
        $uriString = $GLOBAL:SophosCentral.RegionEndpoint + $uriChild
    }
    process {
        foreach ($alert in $AlertID) {
            $uri = [System.Uri]::New($uriString -f $alert)
            $body = @{
                action = $Action
            }
            Invoke-SophosCentralWebRequest -Uri $uri -Method Post -Body $body
        }
    }
}
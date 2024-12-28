function Set-ProxyEnv {
    <#
        .SYNOPSIS
            Set proxy server and credentials information into environment variables that other functions can use
    #>
    [CmdletBinding(SupportsShouldProcess = $True)]
    param (
        [Parameter(Mandatory = $False, Position = 0)]
        [System.String] $Proxy,

        [Parameter(Mandatory = $False, Position = 1)]
        [System.Management.Automation.PSCredential]
        $ProxyCredential = [System.Management.Automation.PSCredential]::Empty
    )

    begin {}
    process {
        try {
            if ($PSBoundParameters.ContainsKey("Proxy")) {
                if ($PSCmdlet.ShouldProcess("Set proxy server variable", "Proxy")) {
                    $params = @{
                        Name  = "EvergreenProxy"
                        Value = $Proxy
                        Scope = "Script"
                        Force = $True
                    }
                    New-Variable @params
                }
            }
            if ($PSBoundParameters.ContainsKey("ProxyCredential")) {
                if ($PSCmdlet.ShouldProcess("Set proxy credential variable", "ProxyCredential")) {
                    $params = @{
                        Name  = "EvergreenProxyCreds"
                        Value = $ProxyCredential
                        Scope = "Script"
                        Force = $True
                    }
                    New-Variable @params
                }
            }
        }
        catch [System.Exception] {
            throw $_
        }
    }
}

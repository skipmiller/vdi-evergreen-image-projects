function Get-GitForWindows {
    <#
        .SYNOPSIS
            Returns the available Git for Windows versions.

        .NOTES
            Author: Trond Eirik Haavarstein
            Twitter: @xenappblog
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "", Justification = "Product name is a plural")]
    [CmdletBinding(SupportsShouldProcess = $false)]
    param (
        [Parameter(Mandatory = $false, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSObject]
        $res = (Get-FunctionResource -AppName ("$($MyInvocation.MyCommand)".Split("-"))[1])
    )

    # Pass the repo releases API URL and return a formatted object
    $params = @{
        Uri            = $res.Get.Uri
        MatchVersion   = $res.Get.MatchVersion
        VersionReplace = $res.Get.VersionReplace
        Filter         = $res.Get.MatchFileTypes
    }
    $object = Get-GitHubRepoRelease @params
    Write-Output -InputObject $object
}

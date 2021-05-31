<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.NOTES
    Parameters is matching "hooks.json". This file is called every time, so that programming actions is easier.
    Additional parameters may be added.
#>

param(
    [parameter(Position=0)]
    [string]$Repository,
    [parameter(Position=1)]
    [string]$CommitId,
    [parameter(Position=2)]
    [string]$PusherUsername,
    [parameter(Position=3)]
    [string]$PusherEmail
)

try {

    $Path = "C:\Users\Admin\Documents\Lab\docs\Sites\localhost\content\test"
    if (Test-Path $Path){
        $ScriptBlock = {
            Set-Location $Path
            Start-Process "git.exe" -Wait -NoNewWindow -ArgumentList "pull"
        }
        Invoke-Command -ScriptBlock $ScriptBlock
        Write-Output "$Repository ($CommitId) by $PusherUsername ($PusherEmail)"
    }
    
}
catch {
    
}
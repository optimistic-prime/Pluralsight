Param (
    # [string]$Path = "$PSScriptRoot/demo.yaml"
    [string]$Path = ""
)

If (-Not $Path) {
    Write-Host "Please supply Path variable"
    Write-Host "./myscript.ps1 -Path <>"
    exit 1
}

Write-Host "installing yaml module"
Import-Module powershell-yaml
Write-Host "installed yaml module"
Write-Host ""

$MyArray = [ordered]@{
    "primary-key" = "some value"
    "secondary-key" = @{
        "sec-first-key" = "sec-first-value"
        "sec-second-key" = "sec-second-value" }
    "tertiary-key" = "tertiary-value"
}

$MyJson = $MyArray | ConvertTo-Json

$MyYaml = $MyJson | ConvertFrom-Json | ConvertTo-Yaml

$MyYaml | Out-File -FilePath $Path

Get-Content $Path

Remove-Item $Path

If (-Not (Test-Path $Path)) {
    Write-Host "File successfully removed"
} else {
    Write-Host "File still exists somehow"
}

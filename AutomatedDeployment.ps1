param([string]$env, [string]$x)

Write-Host $env
Write-Host $x

if ($env -eq "INT")

{

New-Item -ItemType directory -Path \\server\E$\SRC_18.11.$x

New-Item -ItemType directory -Path \\server\E$\SRC_18.11.$x\Settings
copy-Item -Path \\Buildpath\drop\$x\retail\RTPCore\amd64\Sql\* -Destination "\\server\E$\SRC_18.11.$x\" -Recurse -Force;

copy-Item -Path \\Buildpath\drop\\$x\retail\RTPCore\amd64\Settings\* -Destination "\\server\E$\SRC_18.11.$x\Settings" -Recurse -Force;

invoke-command -computername $server-ScriptBlock 
{
Set-Location G:\SRC_18.11.4398.0903\Utils\Migration
./ImportManifest.cmd ABCHDFAO Live
OnlineUpgradePartitions.cmd ABCHDFAO Live 0 19

}

else 

{

}

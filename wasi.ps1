#!/usr/bin/env pwsh
$wasi_bin_path = "$env:WASI_SDK_PATH\bin"
$wasi_self = $MyInvocation.MyCommand.Name
$wasi_cmd = $args[0]
if ($args.Length -eq 0) {
  Write-Host "Usage: $wasi_self executable [arguments]"
  exit 1
}
if (-not (Test-Path "$wasi_bin_path\$wasi_cmd.exe")) {
  Write-Host "Error: $wasi_cmd is not a valid executable in $wasi_bin_path"
  exit 2
}
$args = $args[1..($args.Length - 1)]
& "$wasi_bin_path\$wasi_cmd.exe" $args

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'EXE'
  url  = 'https://todoist.com/windows_app'
  checksum      = '618F9D7F07D0AFBA7BA076714A2B541E2022643113DC9E2A7B0EAA940676F1E8'
  checksumType  = 'sha256'
  validExitCodes = @(0)
}
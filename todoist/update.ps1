import-module au
import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
      "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.RemoteVersion)'"
    }
  }
}

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
     $regex   = '.exe$'
     $url     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
     $version = $url -split '-|.exe' | select -Last 1 -Skip 2 #3
     return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor none

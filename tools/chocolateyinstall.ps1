$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.8.1/standalone-glazewm-v3.8.1-x64.msi'
  checksum64     = '2fe716634e7c78b1fbe1207697a8a8207c6b4b902f4a5c65d100abf5bda796d5' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

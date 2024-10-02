$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.3.0/standalone-glazewm-v3.3.0-x64.msi'
  checksum64     = '' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

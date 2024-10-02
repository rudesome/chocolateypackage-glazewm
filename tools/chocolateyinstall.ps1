$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.3.0/standalone-glazewm-v3.3.0-x64.msi'
  checksum64     = '980af8aaad3136efb301a682c5e87e8577386ed9464305e38a103e743f4ff5c8' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

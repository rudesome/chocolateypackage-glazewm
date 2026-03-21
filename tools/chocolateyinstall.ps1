$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.10.1/standalone-glazewm-v3.10.1-x64.msi'
  checksum64     = 'ad4122dd4420690e502e7df3ce8d1e4772bf1246cc815db0dd2aaac0e4dc583f' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.8.0/standalone-glazewm-v3.8.0-x64.msi'
  checksum64     = '2883e284dfb4459dee351288bd03bbb4cb046ac6647facd9ac8fd333338086c6' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

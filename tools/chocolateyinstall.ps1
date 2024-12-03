$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.7.0/standalone-glazewm-v3.7.0-x64.msi'
  checksum64     = '733c09b3d19bf68fd5a522ee8f068f48cade8ec7422a4aa8a0d18b2beebe3494' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

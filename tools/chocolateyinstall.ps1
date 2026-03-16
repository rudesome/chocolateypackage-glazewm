$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.10.0/standalone-glazewm-v3.10.0-x64.msi'
  checksum64     = 'b83d3633ac23391004a38f6165b681b2f0526b51be8c1460a137f86c4b138d1d' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

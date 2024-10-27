$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.5.0/standalone-glazewm-v3.5.0-x64.msi'
  checksum64     = '35a936d9cc8d1b939cbc69da5eb91696e2619b42cd20ec7efd618d9c33eca68a' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

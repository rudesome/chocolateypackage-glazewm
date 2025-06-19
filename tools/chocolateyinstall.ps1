$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.9.1/standalone-glazewm-v3.9.1-x64.msi'
  checksum64     = '071ea95f5f0de018a7e9e05dcb86213e3b5657c699df21f8e573d85439957850' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.9.0/standalone-glazewm-v3.9.0-x64.msi'
  checksum64     = '70fdfc73cea6a042e3a552032bd55b29ef239ff317cbc361fb118ed904b3fc2d' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

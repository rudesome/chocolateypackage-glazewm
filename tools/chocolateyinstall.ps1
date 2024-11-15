$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.6.0/standalone-glazewm-v3.6.0-x64.msi'
  checksum64     = '762a0ef381ddba009d14061775719a76c692cba3f697cc0a68403a6df849139c' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

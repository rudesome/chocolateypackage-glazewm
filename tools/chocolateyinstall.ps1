$ErrorActionPreference = 'Stop';
$params = @{
  packageName  = 'glazewm'
  FileType     = 'exe'
  SilentArgs   = '/silent'
  Url          = 'https://github.com/glzr-io/glazewm/releases/download/v3.1.1/glazewm-3.1.1.exe' 
  checksum     = '18974cd2f9c8884c23edd3d13137449b233a6c67cd0a210605852302091b2374' 
  checksumType = 'sha256'
}
Install-ChocolateyPackage @params

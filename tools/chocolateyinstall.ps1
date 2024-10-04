$ErrorActionPreference = 'Stop';
$params = @{
  packageName    = 'glazewm'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  Url64bit       = 'https://github.com/glzr-io/glazewm/releases/download/v3.4.0/standalone-glazewm-v3.4.0-x64.msi'
  checksum64     = 'f50faaf4f496edb9c98ff40114ffff8157a02d8b8774d244edb5260eadb3d8e7' 
  checksumType64 = 'sha256'
}
Install-ChocolateyPackage @params

$ErrorActionPreference = 'Stop';
Install-ChocolateyPackage -packageName 'glazewm' -FileType exe -SilentArgs '/silent' -Url 'https://github.com/glzr-io/glazewm/releases/download/v3.1.1/glazewm-.exe' -checksum '' -checksumType 'sha256'

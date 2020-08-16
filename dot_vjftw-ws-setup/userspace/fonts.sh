#!/bin/bash
set -euxo pipefail

fontsPath="${HOME}/.local/share/fonts"

function installNerdFont {
  local baseUrl="https://github.com/ryanoasis/nerd-fonts/releases/download"
  local version="v2.0.0"
  local font=$1
  local fontsPath="${fontsPath}/NerdFonts"
  unzipDest="${fontsPath}/${font}"
  if [ -d "$unzipDest" ]; then
    echo "-> already installed NerdFont:${font}"
  else
    mkdir -p ${unzipDest}
    echo "-> installing NerdFont:${font}"
    zipDest="${fontsPath}/${font}.zip"
    curl -L "${baseUrl}/${version}/${font}.zip" -o $zipDest
    mkdir -p "${unzipDest}"
    unzip $zipDest -d ${unzipDest}
  fi
}

nerdFonts="
AnonymousPro
FantasqueSansMono
Hack
Monofur
SourceCodePro
DroidSansMono
"

for font in $nerdFonts; do
    installNerdFont $font
done

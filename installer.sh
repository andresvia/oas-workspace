#!/bin/bash

set -eu

oasproj_pkg="https://github.com/andresvia/oasproj/releases/download/v1.0.5/oasproj-1.0.5_travis.37-1.x86_64.rpm"

# instalar el paquete oasproj
yum install -y "${oasproj_pkg}" || true
if ! rpm -q oasproj
then
  echo no se pudo instalar el paquete oasproj, sigue bajo tu propio riesgo
  exit 1
fi

# una ubicación sensata para GOPATH
VAGRANT_HOME=/home/vagrant
VAGRANT_PROFILE="${VAGRANT_HOME}/.bash_profile"
if ! grep GOPATH "${VAGRANT_PROFILE}"
then
  echo "GOPATH=${VAGRANT_HOME}" >> "${VAGRANT_PROFILE}"
  echo "export GOPATH" >> "${VAGRANT_PROFILE}"
fi

# copia los secretos y configuraciones escenciales del host del usuario al ambiente de desarrollo
sudo -u vagrant bash << EOF
mv -fv /tmp/host_ssh_id_rsa .ssh/id_rsa
chmod -v 600 .ssh/id_rsa
rm -rfv .gnupg
mv -fv /tmp/host_gnupg .gnupg
chmod -v 700 .gnupg
mv -fv /tmp/host_rpmmacros .rpmmacros
EOF

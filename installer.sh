#!/bin/bash

set -eu

yum install -y ruby ruby-devel gcc make golang git vim

VAGRANT_HOME=/home/vagrant
VAGRANT_PROFILE="${VAGRANT_HOME}/.bash_profile"

if ! grep GOPATH "${VAGRANT_PROFILE}"
then
  echo "GOPATH=${VAGRANT_HOME}" >> "${VAGRANT_PROFILE}"
  echo "export GOPATH"          >> "${VAGRANT_PROFILE}"
fi

sudo -u vagrant bash << EOF
source .bash_profile
go get gopkg.in/andresvia/oasproj.v1
go install gopkg.in/andresvia/oasproj.v1
ln -sfv bin/oasproj.v1 bin/oasproj
mv -fv /tmp/host_ssh_id_rsa .ssh/id_rsa
chmod -v 600 .ssh/id_rsa
rm -rfv .gnupg
mv -fv /tmp/host_gnupg .gnupg
chmod -v 700 .gnupg
mv -fv /tmp/host_rpmmacros .rpmmacros
EOF

#!/bin/bash

export RELEASE_VERSION=0.9.7

echo "Download https://github.com/aardlabs/homebrew-cli/releases/download/v$RELEASE_VERSION/aard-darwin-amd64-v$RELEASE_VERSION.zip"
wget https://github.com/aardlabs/homebrew-cli/releases/download/v$RELEASE_VERSION/aard-darwin-amd64-v$RELEASE_VERSION.zip -P /tmp/

stat /tmp/aard-darwin-amd64-v$RELEASE_VERSION.zip

export SHA256_CHECKSUM=$(sha256sum /tmp/aard-darwin-amd64-v$RELEASE_VERSION.zip | cut -d ' ' -f 1)

envsubst < tmpl/aard_rb.tmpl > formula/aard.rb

unset RELEASE_VERSION
unset SHA256_CHECKSUM

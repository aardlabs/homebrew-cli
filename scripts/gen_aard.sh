#!/bin/bash

if [ -z "$RELEASE_VERSION" ]
then
      echo "\$RELEASE_VERSION is not set"
      exit 1
fi

echo "Download https://github.com/aardlabs/cli-release/releases/download/$RELEASE_VERSION/aard-darwin-amd64-$RELEASE_VERSION.zip"
wget https://github.com/aardlabs/cli-release/releases/download/$RELEASE_VERSION/aard-darwin-amd64-$RELEASE_VERSION.zip -P /tmp/

stat /tmp/aard-darwin-amd64-$RELEASE_VERSION.zip

export SHA256_CHECKSUM=$(sha256sum /tmp/aard-darwin-amd64-$RELEASE_VERSION.zip | cut -d ' ' -f 1)

envsubst < tmpl/aard_rb.tmpl > formula/aard.rb

unset RELEASE_VERSION
unset SHA256_CHECKSUM

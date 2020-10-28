#!/usr/bin/env bash

PLATFORM=$(uname -s | awk '{print tolower($0)}')
BINARY_NAME=snippr-$PLATFORM

MACHINE=$(uname -m)
[[ "$MACHINE" == "x86_64" ]] && BINARY_NAME="$BINARY_NAME-amd64" || BINARY_NAME="$BINARY_NAME-386"

TARGET_PATH_FILE="$HOME/.bashrc"
[[ "$PLATFORM" == "darwin" ]] && TARGET_PATH_FILE="$HOME/.bash_profile"

bail() {
    rm -rf /tmp/snippr
    echo "$1"
    exit $2
}

echo Installing...
curl -sLo /tmp/snippr "https://github.com/snippr-io/cli/releases/latest/download/$BINARY_NAME" || bail "Failed to download binary for $PLATFORM-$MACHINE" 1
chmod +x /tmp/snippr
SNIPPR_VERSION=$(/tmp/snippr --version | cut -d' ' -f 3)

: ${TARGET_DIR:=/opt/snippr}
TARGET_LINK="$TARGET_DIR/snippr"
TARGET_VER_DIR="$TARGET_DIR/$version"
TARGET_VER_BINARY="$TARGET_VER_DIR/snippr"

[[ ! -d "$TARGET_DIR" ]] && (mkdir -p "$TARGET_DIR" || bail "Could not create '$TARGET_DIR'" 2)
cp -f /tmp/snippr "$TARGET_VER_BINARY" || bail "Could not copy snippr to $TARGET_VER_BINARY" 4

[[ -n "$SKIP_LINK" ]] && SKIP_PATH=${SKIP_PATH:=linked} && (ln -sf "$TARGET_VER_BINARY" "$TARGET_LINK" || bail "Could not create link to current version" 3)
[[ -z "$SKIP_PATH" && -z "$(echo "$PATH" | grep snippr)" ]] && echo "export PATH=\"\$PATH:$TARGET_DIR\"" >> "$TARGET_PATH_FILE"

bail "Snippr ready!" 0
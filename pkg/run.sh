#!/bin/bash
set -e

OS=$(uname -s)

case "$OS" in
    Linux*)     PLATFORM=linux;;
    Darwin*)    PLATFORM=mac;;
    CYGWIN*|MINGW*|MSYS*) PLATFORM=windows;;
    *)          PLATFORM=unknown;;
esac

echo "Detected OS: $PLATFORM"

if [ "$PLATFORM" = "linux" ]; then
    echo "🐧 Running Linux-specific packaging..."
    JAVA_OPTS="--module-path lib/linux --add-modules javafx.controls,javafx.fxml"
elif [ "$PLATFORM" = "mac" ]; then
    echo "🍎 Running macOS-specific packaging..."
    ARCH=$(uname -m)
    if [[ "$ARCH" == "arm64" ]]; then
        echo "🍏 Apple Silicon (ARM64) detected!"
        JAVA_OPTS="--module-path lib/mac-aarch --add-modules javafx.controls,javafx.fxml"
    elif [[ "$ARCH" == "x86_64" ]]; then
        echo "🍏 Intel (x86_64) detected!"
        JAVA_OPTS="--module-path lib/mac --add-modules javafx.controls,javafx.fxml"
    else
        echo "🤔 Unknown Mac architecture: $ARCH"
        exit 1
    fi
elif [ "$PLATFORM" = "windows" ]; then
    echo "🪟 Windows detected. Please run run.bat instead!"
    exit 0
else
    echo "😵 Unknown platform, exiting..."
    exit 1
fi

# Common run command for Linux and Mac
echo "🚀 Launching app..."
java $JAVA_OPTS -jar app-all.jar
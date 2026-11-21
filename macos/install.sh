#!/usr/bin/env bash
# ==============================================================================
# Gujarati Spelling Dictionary Installer for macOS (Ventura, Sonoma, Sequoia)
# System-wide spellcheck in Safari, Pages, Mail, Notes, TextEdit & native apps
# Repository: https://github.com/ruchirguitar/libreoffice-gujarati-dictionary
# ==============================================================================

set -e

TARGET_DIR="$HOME/Library/Spelling"
mkdir -p "$TARGET_DIR"

echo "=========================================================="
echo "  Installing Gujarati Spelling Dictionary for macOS"
echo "=========================================================="

# Check if script is running from an extracted local package
SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/gu_IN.aff" ] && [ -f "$SCRIPT_DIR/gu_IN.dic" ]; then
  echo "--> Using local dictionary files from $SCRIPT_DIR..."
  cp "$SCRIPT_DIR/gu_IN.aff" "$TARGET_DIR/gu_IN.aff"
  cp "$SCRIPT_DIR/gu_IN.dic" "$TARGET_DIR/gu_IN.dic"
else
  echo "--> Downloading latest dictionary package from GitHub Releases..."
  TEMP_ZIP="/tmp/gujarati-macos-spelling.zip"
  TEMP_EXTRACT="/tmp/gujarati-macos-spelling-pkg"
  rm -rf "$TEMP_ZIP" "$TEMP_EXTRACT"
  mkdir -p "$TEMP_EXTRACT"

  RELEASE_URL="https://github.com/ruchirguitar/libreoffice-gujarati-dictionary/releases/latest/download/gujarati-macos-spelling.zip"
  if curl -fSL --progress-bar "$RELEASE_URL" -o "$TEMP_ZIP" 2>/dev/null; then
    unzip -q -o "$TEMP_ZIP" -d "$TEMP_EXTRACT"
    cp "$TEMP_EXTRACT/gu_IN.aff" "$TARGET_DIR/gu_IN.aff"
    cp "$TEMP_EXTRACT/gu_IN.dic" "$TARGET_DIR/gu_IN.dic"
    rm -rf "$TEMP_ZIP" "$TEMP_EXTRACT"
  else
    echo "--> Fallback: Fetching raw dictionary files directly..."
    RAW_BASE="https://raw.githubusercontent.com/ruchirguitar/libreoffice-gujarati-dictionary/master"
    curl -fSL "$RAW_BASE/gu_IN.aff" -o "$TARGET_DIR/gu_IN.aff"
    curl -fSL "$RAW_BASE/gu_IN.dic" -o "$TARGET_DIR/gu_IN.dic"
  fi
fi

# Duplicate as generic 'gu' locale for maximum macOS application compatibility
cp "$TARGET_DIR/gu_IN.aff" "$TARGET_DIR/gu.aff"
cp "$TARGET_DIR/gu_IN.dic" "$TARGET_DIR/gu.dic"

echo ""
echo "✅ Installation complete! Installed files to: $TARGET_DIR"
echo ""
echo "Next steps:"
echo "1. Restart open applications (Safari, Pages, Mail, Notes, TextEdit)."
echo "2. In macOS Ventura / Sonoma / Sequoia:"
echo "   Go to: System Settings -> Keyboard -> Text Input (or Input Sources) -> Edit..."
echo "   In the 'Spelling' dropdown, choose 'Set up...', and check 'ગુજરાતી (Library)'."
echo "3. You're all set! Native Gujarati spellcheck is now active system-wide."

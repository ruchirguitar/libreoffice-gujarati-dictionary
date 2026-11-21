#!/usr/bin/env bash
# ==============================================================================
# Gujarati Spelling Dictionary Uninstaller for macOS
# Repository: https://github.com/ruchirguitar/libreoffice-gujarati-dictionary
# ==============================================================================

set -e

TARGET_DIR="$HOME/Library/Spelling"

echo "Removing Gujarati Spelling Dictionary from macOS ($TARGET_DIR)..."
rm -f "$TARGET_DIR/gu_IN.aff" "$TARGET_DIR/gu_IN.dic" "$TARGET_DIR/gu.aff" "$TARGET_DIR/gu.dic"

echo "✅ Successfully removed Gujarati spelling dictionary."
echo "Restart open applications to apply changes."

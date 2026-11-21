# Native macOS Gujarati Spelling Dictionary

This package installs the official Gujarati (`gu_IN`) Hunspell dictionary directly into the native macOS spelling system (`~/Library/Spelling/`).

Once installed, all native macOS applications automatically gain full Gujarati spellchecking:
- **Safari**
- **Apple Pages, Numbers, Keynote**
- **Apple Mail & Notes**
- **TextEdit**
- System-wide text inputs

Compatible with macOS Ventura (13), macOS Sonoma (14), macOS Sequoia (15), and earlier versions.

---

## Installation

### Option 1: One-Click Terminal Install (No Download Needed)
Open Terminal (`Applications` → `Utilities` → `Terminal`) and run:

```bash
curl -sSL https://raw.githubusercontent.com/ruchirguitar/libreoffice-gujarati-dictionary/master/macos/install.sh | bash
```

### Option 2: Run From Downloaded Package
1. Download `gujarati-macos-spelling.zip` from GitHub Releases.
2. Unzip the package.
3. Open Terminal in the extracted folder and run:
   ```bash
   bash install.sh
   ```

### Option 3: Manual Installation (Finder)
1. Open Finder, press `Cmd + Shift + G`, and paste:
   ```
   ~/Library/Spelling/
   ```
2. Copy `gu_IN.aff`, `gu_IN.dic`, `gu.aff`, and `gu.dic` into that folder.

---

## Enabling in System Settings

After installation:
1. Restart any open applications (Safari, Pages, Mail, Notes, TextEdit).
2. Open **System Settings** (or **System Preferences**):
   - Go to **Keyboard** → **Text Input** (or **Input Sources**) → click **Edit...**.
   - Under **Spelling**, open the dropdown and select **Set Up...**.
   - Check **ગુજરાતી (Library)** / **Gujarati (Library)** and click **Done**.
3. In any text area or document, Gujarati words will now be verified with zero false positives for standard vocabulary!

---

## Uninstallation

To remove the dictionary, open Terminal and run:
```bash
curl -sSL https://raw.githubusercontent.com/ruchirguitar/libreoffice-gujarati-dictionary/master/macos/uninstall.sh | bash
```
Or delete `gu_IN.aff`, `gu_IN.dic`, `gu.aff`, and `gu.dic` from `~/Library/Spelling/`.

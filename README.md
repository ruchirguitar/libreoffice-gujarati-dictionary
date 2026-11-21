# Repaired Gujarati (`gu_IN`) Dictionary & Official LibreOffice Extension

[![LibreOffice Extension](https://img.shields.io/badge/LibreOffice-Official_Extension-blue?logo=libreoffice)](https://extensions.libreoffice.org/en/extensions/show/27711)
[![macOS Spellcheck](https://img.shields.io/badge/macOS-Native_Spelling-black?logo=apple)](macos/README.md)
[![Upstream Aspell](https://img.shields.io/badge/Upstream-kartikm%2Fgu--wordlist-green)](https://github.com/kartikm/gu-wordlist)
[![License: GPL-2.0-or-later](https://img.shields.io/badge/License-GPL_2.0+-blue.svg)](LICENSE)

**Official, fixed Gujarati (gu_IN) Hunspell dictionary and extension for LibreOffice, Apache OpenOffice, Mozilla Firefox/Thunderbird, Apple macOS native spellchecker, Linux distributions (`hunspell-gu`), and open-source applications.**

---

## 🌟 Official Release on LibreOffice Extensions

The repaired dictionary has been officially released on the **LibreOffice Extensions Website**:

👉 **[Download from LibreOffice Extensions (Version 2026.11.19)](https://extensions.libreoffice.org/en/extensions/show/27711)**

---

## 🍎 macOS One-Click Installation (Native System Spellcheck)

Enable system-wide Gujarati spellchecking across **Safari, Apple Pages, Numbers, Keynote, Apple Mail, Notes, TextEdit, and all native macOS apps** without requiring administrator/root privileges:

### Instant One-Click Terminal Install
Open **Terminal** (`Cmd + Space` → type `Terminal`) and paste:

```bash
curl -sSL https://raw.githubusercontent.com/ruchirguitar/libreoffice-gujarati-dictionary/master/macos/install.sh | bash
```

### Manual / Package Download
1. Download **[`gujarati-macos-spelling.zip`](https://github.com/ruchirguitar/libreoffice-gujarati-dictionary/releases/latest/download/gujarati-macos-spelling.zip)** from GitHub Releases.
2. Unzip the package, open Terminal in that directory, and run `bash install.sh`.

### Activating in macOS Settings (Ventura, Sonoma, Sequoia)
1. Restart open applications (Safari, Pages, Mail).
2. Open **System Settings** → **Keyboard** → **Text Input** (or **Input Sources**) → click **Edit...**.
3. Under **Spelling**, choose **Set Up...**, check **ગુજરાતી (Library)**, and click **Done**.

> **To Uninstall**: Run `curl -sSL https://raw.githubusercontent.com/ruchirguitar/libreoffice-gujarati-dictionary/master/macos/uninstall.sh | bash`

---

## 🛑 The 15-Year Bug

For over 15 years, the official LibreOffice Gujarati dictionary (`gu_IN.dic`), which Linux distributions (Debian, Ubuntu, Fedora) and downstream applications depend on, suffered from severe truncation:

1. **Zero words starting with the letter પ (U+0AAA)**:  
   The dictionary literally contained **0** words starting with `પ`. Everyday essential words like **પાણી** (water), **પુસ્તક** (book), **પરીક્ષણ** (test), **પર્યાવરણ** (environment), **પૃથ્વી** (earth), **પ્રકાશ** (light), and **પ્રેમ** (love) were marked as misspelled.
2. **Missing large sections of words starting with the letter ન (U+0AA8)**:  
   Due to an ancient file-splitting error dating back to 2008, words starting with:
   - `નિ...`: **955 words missing** (e.g. નિયમ, નિર્ણય, નિબંધ, નિર્દેશ, નિવાસ, નિષ્ક્રિય)
   - `ની...`: **170 words missing** (e.g. નીતિ, નીર)
   - `નો...`: **77 words missing** (e.g. નોકરી, નોંધ, નોટિસ)
   - `નૌ...`: **31 words missing** (e.g. નૌકા, નૌસેના)
   - `નાર...` to `નાળો`: **149 words missing** (e.g. નાશ, નાસતો)
3. **Broken suggestion algorithm (`TRY` in `gu_IN.aff`)**:  
   The `TRY` rule skipped from `ણ` to `બ`, completely omitting `ત, થ, દ, ધ, ન, પ, ફ, ળ`, which broke spellchecking suggestions for those consonants.
4. **Missing morphological affix rules**:  
   Unlike Hindi or Marathi, Gujarati had no Hunspell affix rules for attached case markers (*અનુગો*: નો, ની, નું, ના, ને, થી, માં) or verb conjugations.

---

## ✅ The Fix & Architecture

This repository contains the complete restored dictionary and modern Hunspell morphology engine:

| Component | Status & Details |
|---|---|
| **Base Vocabulary** | Synchronized with Kartik Mistry's GNU Aspell upstream repository ([kartikm/gu-wordlist](https://github.com/kartikm/gu-wordlist)) releases `v2026.11` and `v2026.11.16`. |
| **Missing પ & ન** | **100% restored** (5,400+ words under પ and 1,600+ words under ન). |
| **Word Count** | **205,747 root entries** dynamically expanding via Hunspell affix rules to over **350,000+ inflected words**. |
| **Affix Rules (`gu_IN.aff`)** | Full Hunspell morphology engineered with: <br>• `/N` & `/K`: Direct noun case suffixes and locative/ergative forms (`-ે`/`-એ`). <br>• `/O`: Masculine `-ો` $\to$ `-ા` oblique and `-ાઓ` plural forms. <br>• `/U`: Neuter `-ું` $\to$ `-ા`/`-ાં` oblique forms. <br>• `/V` & `/W`: Full verb root conjugation (`-વું`, `-શે`, `-તો`, `-્યું`, `-ેલા`, `-નાર`, `-ાય`). <br>• Complete `TRY` ordering and phonetic `REP` pairs for accurate typo suggestions. |

---

## 📦 How to Install in LibreOffice

1. Download the extension:
   * **[LibreOffice Official Extension Store](https://extensions.libreoffice.org/en/extensions/show/27711)**, or
   * Direct download from GitHub Releases: **[`dict-gu-fixed.oxt`](https://github.com/ruchirguitar/libreoffice-gujarati-dictionary/releases/latest/download/dict-gu-fixed.oxt)**
2. In LibreOffice, open **Tools** → **Extension Manager...** (or `Ctrl + Alt + E`).
3. Click **Add...**, select `dict-gu-fixed.oxt`, and confirm installation.
4. Restart LibreOffice.
5. In Writer, set language to **Gujarati (India)**. Words like **પાણી**, **પુસ્તક**, **પરીક્ષણ**, **રસ્તામાં**, **ચર્ચાઓમાં** are now recognized with zero red lines!

---

## 💻 Using in Dependent Software Projects

For web, Node.js, Electron, Python, or C++ applications using Hunspell (such as ArtCraft, Chromium, Firefox, or Linux packaging):

* Copy [`gu_IN.dic`](gu_IN.dic) and [`gu_IN.aff`](gu_IN.aff) directly into your application's dictionary path.
* For Linux systems, copy both files to `/usr/share/hunspell/` or `~/.config/enchant/hunspell/`.

---

## 👥 Credits & Attribution

* **Updated & Contributed by**: Ruchir Purohit (`ruchirguitar@gmail.com`)
* **LibreOffice Morphology & Packaging**: Shantanu Oak (`shantanuo@libreoffice.org`)
* **Upstream Aspell Maintainer**: Kartik Mistry (`kartik@debian.org`)
* **Original Word List**: Utkarsh Project volunteers
* **License**: GNU General Public License (GPL-2.0 or later)

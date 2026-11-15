# Repaired Gujarati (`gu_IN`) Dictionary & LibreOffice Extension

**Fixed Gujarati (gu_IN) Hunspell dictionary for LibreOffice, Apache OpenOffice, Mozilla Firefox/Thunderbird, Linux distributions (`hunspell-gu`), and open-source applications.**

---

## 🛑 The Problem

For years, the official LibreOffice Gujarati dictionary (`gu_IN.dic`), which Linux distros (Debian, Ubuntu, Fedora) and spell-checking engines rely on, suffered from critical truncation bugs:

1. **Missing ALL words starting with પ (U+0AAA)**:
   The official dictionary contained **0** words starting with `પ`. Very common words like **પાણી**, **પુસ્તક**, **પરીક્ષણ**, **પર્યાવરણ**, **પૃથ્વી**, **પ્રકાશ**, and **પ્રેમ** were marked as misspelled.
2. **Missing large sections of words starting with ન (U+0AA8)**:
   Due to an old file-splitting/truncation error, words starting with:
   - `નિ...`: **955 words missing** (e.g. નિયમ, નિર્ણય, નિબંધ, નિર્દેશ, નિવાસ, નિષ્ક્રિય)
   - `ની...`: **170 words missing** (e.g. નીતિ, નીર)
   - `નો...`: **77 words missing** (e.g. નોકરી, નોંધ, નોટિસ)
   - `નૌ...`: **31 words missing** (e.g. નૌકા, નૌસેના)
   - `નાર...` to `નાળો`: **149 words missing** (e.g. નાશ, નાસતો)
3. **Broken suggestion algorithm (`TRY` in `gu_IN.aff`)**:
   The affix rule jumped from `ણ` to `બ`, skipping `ત, થ, દ, ધ, ન, પ, ફ, ળ`, which prevented Hunspell from properly generating spelling suggestions for those consonants.

---

## ✅ The Fix

This repository repairs the dictionary by merging the clean, GPL-2+ licensed wordlist from `gu-wordlist.txt` (GNU Aspell / Utkarsh Project) into `gu_IN`:

| Metric | Original `gu_IN.dic` | Repaired `gu_IN.dic` | Difference |
|---|---:|---:|---:|
| **Total Valid Entries** | 168,911 | **191,027** | **+22,116 words** |
| **Words starting with પ** | **0** | **5,463** | **+5,463 words** |
| **Words starting with ન** | 4,385 | **6,044** | **+1,659 words** |
| **Suggestion Candidates (`TRY`)** | Incomplete (skipped 8 consonants) | Complete (all vowels, consonants & matras ordered by frequency) | Fixed |

---

## 📦 How to Install in LibreOffice

1. Download the extension: **[`dict-gu-fixed.oxt`](https://github.com/ruchirguitar/libreoffice-gujarati-dictionary/releases/latest/download/dict-gu-fixed.oxt)**
2. In LibreOffice, open **Tools** → **Extension Manager...** (or `Ctrl + Alt + E`).
3. Click **Add...**, select `dict-gu-fixed.oxt`, and confirm installation.
4. Restart LibreOffice.

---

## 💻 Using in Dependent Software Projects

For web, Node.js, Electron, Python, or C++ applications using Hunspell:
* Copy `gu_IN.dic` and `gu_IN.aff` directly into your project's dictionary directory.
* Or install/vendor this repository.

---

## 📄 License & Attribution

* Original wordlist by Utkarsh Project volunteers.
* Maintained historically by Kartik Mistry.
* License: GNU General Public License (GPL-2.0 or later).

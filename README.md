# Windows Deep Clean Script 🧹

A lightweight, automated Batch script to reclaim disk space on Windows C: drive using native Command Prompt tools.

## 🚀 Features

This script automates several built-in Windows cleanup utilities into a single click:

* **Temp Files:** Cleans User `%TEMP%` and System `C:\Windows\Temp` folders.
* **Windows Updates:** Cleans the `SoftwareDistribution` cache (fixes common update errors).
* **Component Store:** Runs `DISM` to clean up the WinSxS folder (removing obsolete update packages).
* **Recycle Bin:** Force empties the bin.
* **Optional:** Includes commented-out commands for disabling Hibernation and enabling CompactOS.

## ⚠️ Disclaimer

**Run at your own risk.** While this script uses standard Windows commands, it involves deleting system files.
1.  **Always create a System Restore Point** before running deep cleaning scripts.
2.  The author is not responsible for any data loss or system instability.

## 📥 Installation

1.  Download or clone this repository.
    ```bash
    git clone [https://github.com/YOUR_USERNAME/windows-deep-cleaner.git](https://github.com/YOUR_USERNAME/windows-deep-cleaner.git)
    ```
2.  Locate `clean_disk.bat`.

## 🛠 Usage

1.  Right-click `clean_disk.bat`.
2.  Select **Run as Administrator** (Required).
3.  Follow the on-screen prompts.

## ⚙️ Advanced Configuration

Open `clean_disk.bat` in a text editor (Notepad) to enable aggressive options:

**To Disable Hibernation (Saves 3GB - 16GB):**
Remove `::` from the line:
```batch
:: powercfg /h off# windows-deep-cleaner
A lightweight, automated Batch script to reclaim disk space on Windows C: drive using native Command Prompt tools.
```

**To Enable CompactOS (Saves 2GB - 4GB): Remove :: from the line:**
```batch
:: compact.exe /CompactOS:always
```

## License
This project is licensed under the MIT License - see the LICENSE file for details.


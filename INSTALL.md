# Detailed Installation Guide

This document provides step-by-step instructions for installing Cursor AI Editor on various Linux distributions.

## General Installation (All Distributions)

1. **Download the Cursor AppImage**
   - Visit [cursor.sh](https://cursor.sh)
   - Click on the download button for Linux
   - Save the AppImage file

2. **Download the Installation Script**
   - Download `setup-cursor.sh` from this repository

3. **Prepare for Installation**
   - Open a terminal
   - Navigate to the directory containing both files:
     ```bash
     cd /path/to/files
     ```
   - Make the script executable:
     ```bash
     chmod +x setup-cursor.sh
     ```

4. **Run the Installation Script**
   - Execute with sudo privileges:
     ```bash
     sudo ./setup-cursor.sh
     ```
   - Enter your password when prompted
   - Wait for the installation to complete

5. **Verify Installation**
   - Check if Cursor is in your application menu
   - Try running from terminal:
     ```bash
     cursor
     ```

## Distribution-Specific Notes

### Ubuntu/Linux Mint

No additional steps required. The script should work out of the box.

### Fedora

Fedora users might need to ensure dnf-plugins-core is installed:

```bash
sudo dnf install dnf-plugins-core
```

### Arch Linux/Manjaro

The script should work properly on Arch-based distributions. If you encounter issues with the desktop integration, you might need to install:

```bash
sudo pacman -S xdg-utils
```

## Troubleshooting

### Icon Not Appearing

If the Cursor icon doesn't appear in your application menu:

```bash
# Update icon cache manually
sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor
```

### Application Not Found in Menu

Try logging out and logging back in, or manually refresh the desktop database:

```bash
sudo update-desktop-database
```

### Permission Issues

If you encounter permission issues during installation:

```bash
# Check if you're running with sudo
sudo ./setup-cursor.sh

# If issues persist, try with explicit path
sudo bash /full/path/to/setup-cursor.sh
```

## Uninstallation

To remove Cursor from your system:

```bash
sudo rm -f /usr/local/bin/cursor
sudo rm -f /usr/share/applications/cursor.desktop
sudo rm -f /usr/share/icons/hicolor/256x256/apps/cursor.png
sudo rm -rf /opt/cursor
sudo update-desktop-database
sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor
``` 
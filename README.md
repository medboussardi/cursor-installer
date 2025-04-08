# Cursor AI Editor - Linux Installer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)](https://www.linux.org/)
[![Bash Script](https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

A robust installation script for the AI-powered [Cursor Editor](https://cursor.sh) on Linux systems. This script automates the process of installing Cursor from the AppImage format to a fully integrated system application.

![Cursor Editor Screenshot](https://raw.githubusercontent.com/getcursor/cursor/main/images/cursor_banner.png)

## 🚀 Features

- **System-wide installation**: Properly installs Cursor for all users
- **Desktop integration**: Adds application menu entry and enables taskbar pinning
- **Terminal access**: Run Cursor from any terminal with the simple `cursor` command
- **Proper icon setup**: Extracts and installs the Cursor icon system-wide
- **Mime type association**: Associate text files with Cursor
- **Clean installation**: Follows Linux standards for application installation

## 📋 Prerequisites

- A Linux distribution (tested on Ubuntu, Mint, Fedora, and Arch-based systems)
- `sudo` privileges
- The Cursor AppImage file (download from [cursor.sh](https://cursor.sh))

## 💻 Installation

### Option 1: Quick Install

1. Download the Cursor AppImage from [cursor.sh](https://cursor.sh)
2. Download the installation script
3. Make the script executable and run it with sudo:

```bash
chmod +x setup-cursor.sh
sudo ./setup-cursor.sh
```

### Option 2: Clone This Repository

```bash
git clone https://github.com/yourusername/cursor-installer.git
cd cursor-installer
# Place the Cursor AppImage in this directory
chmod +x setup-cursor.sh
sudo ./setup-cursor.sh
```

## 🛠️ What the Script Does

This script performs the following actions:

1. Verifies the Cursor AppImage exists and makes it executable
2. Creates necessary directories in system locations
3. Copies the AppImage to `/opt/cursor/`
4. Extracts the application icon
5. Creates a wrapper script for terminal usage
6. Adds a proper desktop entry file for application menus
7. Updates system caches for immediate availability

## 📝 Common Issues and Solutions

### Cannot Find Cursor in Application Menu

If Cursor doesn't immediately appear in your application menu after installation:

```bash
# Refresh the desktop database manually
sudo update-desktop-database
```

Or log out and log back in to refresh your desktop environment.

### Cannot Pin to Taskbar

This is usually due to incorrect `StartupWMClass` in the desktop entry. Our script sets this correctly, but if you're still having issues:

```bash
# Verify the desktop entry
cat /usr/share/applications/cursor.desktop
```

The `StartupWMClass` should be set to `Cursor`.

## ⚙️ Customization

You can modify the script to change installation paths or other parameters. The main configurable sections are:

- Installation directory (default: `/opt/cursor/`)
- Icon locations
- Desktop entry properties

## 📚 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgements

- [Cursor Editor Team](https://cursor.sh) for creating this amazing AI-powered code editor
- The open-source community for inspiration and support 
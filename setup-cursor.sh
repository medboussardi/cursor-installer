#!/bin/bash

# Script to set up Cursor editor globally on Linux
# This will make it available in search and allow pinning to panel

set -e  # Exit on error

echo "Setting up Cursor editor globally..."

# Ensure we have sudo permissions
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

# Get the directory where our AppImage is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_IMAGE_PATH="$SCRIPT_DIR/Cursor-0.48.8-x86_64.AppImage"

# Verify AppImage exists
if [ ! -f "$APP_IMAGE_PATH" ]; then
  echo "Error: Cursor AppImage not found at $APP_IMAGE_PATH"
  exit 1
fi

echo "Found Cursor AppImage at $APP_IMAGE_PATH"

# Make AppImage executable
chmod +x "$APP_IMAGE_PATH"

# Create directories if they don't exist
mkdir -p /opt/cursor
mkdir -p /usr/local/bin
mkdir -p /usr/share/applications
mkdir -p /usr/share/icons/hicolor/256x256/apps

# Copy AppImage to /opt
cp "$APP_IMAGE_PATH" /opt/cursor/cursor.AppImage
chmod +x /opt/cursor/cursor.AppImage

# Extract icon from the AppImage
echo "Extracting Cursor icon..."
cd /tmp
/opt/cursor/cursor.AppImage --appimage-extract usr/share/icons/hicolor/256x256/apps/cursor.png 2>/dev/null || true
cp squashfs-root/usr/share/icons/hicolor/256x256/apps/cursor.png /usr/share/icons/hicolor/256x256/apps/
rm -rf squashfs-root

# Create a wrapper script
cat > /usr/local/bin/cursor << 'WRAPPER'
#!/bin/bash
/opt/cursor/cursor.AppImage "$@"
WRAPPER

chmod +x /usr/local/bin/cursor

# Create desktop entry
cat > /usr/share/applications/cursor.desktop << 'DESKTOP_ENTRY'
[Desktop Entry]
Name=Cursor
Comment=AI-first code editor
GenericName=Text Editor
Exec=/opt/cursor/cursor.AppImage %F
Icon=cursor
Type=Application
StartupNotify=true
StartupWMClass=Cursor
Categories=TextEditor;Development;IDE;
MimeType=text/plain;inode/directory;
Keywords=cursor;code;editor;ide;
Terminal=false
Actions=new-empty-window;
X-GNOME-UsesNotifications=true

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=/opt/cursor/cursor.AppImage
DESKTOP_ENTRY

# Update desktop database and icon cache
echo "Updating system caches..."
update-desktop-database /usr/share/applications
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

echo "Installation complete!"
echo "You can now find Cursor in your application menu, pin it to your panel,"
echo "and run it from the terminal with the 'cursor' command."

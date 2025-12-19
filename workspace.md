# Omarchy Project Overview

**Omarchy** is a modern, opinionated Linux distribution toolkit built on top of **Arch Linux**. It is designed to automate the installation and configuration of a highly polished, keyboard-centric desktop environment.

## Key Technologies
- **Base System**: Arch Linux (using `pacman` and AUR helpers).
- **Window Manager**: [Hyprland](https://hyprland.org/) (Wayland compositor).
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar).
- **Terminal**: Configurations for Ghostty, Kitty, and Alacritty.
- **Shell**: Bash with [Starship](https://starship.rs/) prompt.
- **Tools**: Includes `lazygit`, `btop`, `gum`, `fzf`, and various other productivity CLI tools.

## Philosophy
Omarchy follows an "Omakase" (Chef's Choice) philosophy. It provides a curated, "batteries-included" experience where aesthetic and functional decisions are pre-configured to offer a cohesive environment immediately after installation, reducing the need for initial "dotfiles" tinkering.

---

# Changelog

## [2025-12-19]

### Added
- **Custom Package Management**:
    - Introduced `install/marxpelo-custom.packages` for user-specific packages.
    - Added `install/packaging/custom.sh` to handle installation of custom packages.
    - **New Packages**: `pacseek`, `pyprland`, `zen-browser-bin`, `proton-pass-bin`, `proton-vpn-gtk-app`, `networkmanager-openvpn`, `kdeconnect`, `antigravity`.
- **Virtualization Support**:
    - Added `bin/omarchy-install-virt` to install KVM/QEMU, Libvirt, and Virt-Manager.
    - Added "Virtualization (KVM)" to `omarchy-menu` under `Install > Services`.
- **Pacseek Configuration**:
    - Added configuration at `config/pacseek/config.json` with transparency and custom styling.
    - Added floating window rule for `org.omarchy.pacseek`.

### Changed
- **Hyprland Bindings (`config/hypr/bindings.conf`)**:
    - **Application Launcher**: Changed binding from `SUPER+SPACE` to `SUPER+A` (executes `omarchy-launch-walker`).
- **Window Rules (`default/hypr/apps/system.conf`)**:
    - Increased floating window size from `875x600` to `975x700`.
    - Added `org.omarchy.tsui` and `org.omarchy.pacseek` to floating classes.
- **Package Organization**:
    - Moved `pyprland` from base packages to custom packages list.

## [2025-12-17]

### Added
- **Monitor Selection Script (`install/post-install/monitors.sh`)**:
    - **Interactive Detection**: Automatically detects connected monitors via `hyprctl` or `sysfs`.
    - **Configuration Wizard**: Uses `gum` to guide the user through setting up:
        - Enabled Monitors (Multi-select)
        - Resolution (Auto, Standard, or Custom)
        - Scale (1, 1.33, 1.5, 2, or Custom)
        - Position (Auto-layout or Custom Coordinates)
        - Orientation (Normal, 90°, 180°, 270°)
        - Primary Monitor designation
    - **Output Generation**:
        - `~/.config/hypr/monitors.conf`: Main Hyprland monitor rules.
        - `~/.config/hypr/monitors-vars.conf`: Hyprland variables (e.g., `$primary_monitor`) for use in other configs.
        - `~/.config/environment.d/monitors.conf`: Environment variables (e.g., `OMARCHY_PRIMARY_MONITOR`).

- **Waybar Configuration Script (`install/post-install/waybar-monitor.sh`)**:
    - Automatically updates `~/.config/waybar/config.jsonc` to bind the status bar specifically to the selected primary monitor.

### Changed
- **Installation Flow (`install/post-install/all.sh`)**:
    - Integrated `monitors.sh` and `waybar-monitor.sh` into the post-installation pipeline.
- **Hyprland Autostart (`config/hypr/autostart.conf`)**:
    - Modified initialization to use the `OMARCHY_PRIMARY_MONITOR` environment variable for `xrandr` primary display setting.
- **Hyprland Workspaces (`config/hypr/workspaces.conf`)**:
    - Refactored to source `~/.config/hypr/monitors-vars.conf` instead of attempting invalid environment variable syntax. This ensures the primary workspace is correctly assigned to the primary monitor.

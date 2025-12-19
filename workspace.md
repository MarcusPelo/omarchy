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

## [Current Session Changes] - 2025-12-17

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

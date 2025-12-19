# Custom packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/marxpelo-custom.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"

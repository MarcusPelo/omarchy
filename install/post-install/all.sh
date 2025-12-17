run_logged $OMARCHY_INSTALL/post-install/pacman.sh
run_logged $OMARCHY_INSTALL/post-install/monitors.sh
run_logged $OMARCHY_INSTALL/post-install/waybar-monitor.sh
source $OMARCHY_INSTALL/post-install/allow-reboot.sh
source $OMARCHY_INSTALL/post-install/finished.sh

#!/bin/bash

WAYBAR_CONFIG="$HOME/.config/waybar/config.jsonc"
ENV_FILE="$HOME/.config/environment.d/monitors.conf"

if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
fi

if [ -z "$OMARCHY_PRIMARY_MONITOR" ]; then
    echo "No primary monitor variable found. Skipping Waybar update."
    exit 0
fi

if [ ! -f "$WAYBAR_CONFIG" ]; then
    echo "Waybar config not found at $WAYBAR_CONFIG. Skipping."
    exit 0
fi

echo "Updating Waybar config to use primary monitor: $OMARCHY_PRIMARY_MONITOR"

# Use perl for multi-line replacement to safely replace the output block
# Matches "output": [ "*" ] with any amount of whitespace
perl -i -0777 -pe "s/\"output\": \[\s*\"\*\"\s*\]/\"output\": [\n      \"$OMARCHY_PRIMARY_MONITOR\"\n    ]/g" "$WAYBAR_CONFIG"

echo "Waybar config updated."

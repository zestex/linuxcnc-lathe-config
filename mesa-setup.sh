#!/bin/bash

# Mesa 7i96S Network Setup Script
# Sets static IP for direct connection to 7i96S (192.168.1.121)

INTERFACE="enp1s0"          # ←←← CHANGE THIS to your actual interface name!
IP_ADDRESS="192.168.1.100"
MESA_IP="192.168.1.121"

echo "=== Mesa 7i96S Network Setup ==="

# Check if interface exists
if ! ip link show "$INTERFACE" > /dev/null 2>&1; then
    echo "Error: Interface $INTERFACE not found!"
    echo "Run 'ip addr' to see your interface names."
    exit 1
fi

echo "Setting up interface: $INTERFACE"

# Bring interface up
sudo ip link set "$INTERFACE" up

# Add IP address
sudo ip addr add "$IP_ADDRESS/24" dev "$INTERFACE" 2>/dev/null || \
sudo ip addr replace "$IP_ADDRESS/24" dev "$INTERFACE"

echo "IP $IP_ADDRESS set on $INTERFACE"

# Test connection
echo "Testing connection to Mesa 7i96S..."
ping -c 3 "$MESA_IP"

echo ""
echo "Setup complete!"
echo "You can now run LinuxCNC."

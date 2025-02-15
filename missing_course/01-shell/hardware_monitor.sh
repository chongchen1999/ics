#!/bin/bash

# Function to check if running in WSL
check_wsl() {
    if ! grep -q microsoft /proc/version; then
        echo "This script is designed to run in WSL only"
        exit 1
    fi
}

# Function to get battery info using powershell
get_battery_info() {
    powershell.exe -Command "Get-WmiObject Win32_Battery | Select-Object EstimatedChargeRemaining" 2>/dev/null | 
    grep -o '[0-9]\+' || echo "No battery found or unable to read battery information"
}

# Function to get CPU temperature using powershell
get_cpu_temp() {
    # This uses OpenHardwareMonitor - needs to be installed on Windows
    powershell.exe -Command "Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace root/wmi | Select-Object CurrentTemperature" 2>/dev/null |
    grep -o '[0-9]\+' | awk '{printf "%.1f°C\n", ($1/10-273.15)}' || 
    echo "Unable to read CPU temperature. Make sure OpenHardwareMonitor is installed."

}

# Main script
check_wsl

echo "Hardware Information from WSL:"
echo "----------------------------------------"
echo -n "Battery Level: "
get_battery_info
echo -n "CPU Temperature: "
get_cpu_temp

#!/bin/bash

echo "   _____ _____ _    _ "
echo "  / ____/ ____| |  | |"
echo " | (___| (___ | |__| |"
echo "  \___ \\___ \|  __  |"
echo "  ____) |___) | |  | |"
echo " |_____/_____/|_|  |_|"
echo 
sleep 2s

# Enter user details
read -p "Enter IP address: " ip
read -p "Enter username: " username
read -p "Enter passwd: " passwd

# Connect
sshpass -p "$passwd" ssh -o StrictHostKeyChecking=no $username@$ip

#!/bin/bash

# 1. Create a file and edit it
echo "Creating a file 'myfile.txt' and editing it with text 'Hello World'"
touch /home/$(whoami)/myfile.txt
echo "Hello World" > /home/$(whoami)/myfile.txt

# 2. Create a new user
NEW_USER="newuser"
echo "Creating a new user: $NEW_USER"
sudo useradd $NEW_USER
echo "$NEW_USER has been created."

# 3. Create files in both root and the new user’s home directory
echo "Creating a file in root and new user's home directory."
sudo touch /root/rootfile.txt
sudo echo "Root file content" > /root/rootfile.txt

sudo touch /home/$NEW_USER/userfile.txt
sudo echo "User file content" > /home/$NEW_USER/userfile.txt

# 4. Justify file permissions
echo "Setting permissions for the files."
sudo chmod 700 /root/rootfile.txt
sudo chmod 644 /home/$NEW_USER/userfile.txt

echo "Permissions set: "
echo "Root file (only accessible by root):"
ls -l /root/rootfile.txt
echo "User file (readable by everyone, writable by owner):"
ls -l /home/$NEW_USER/userfile.txt

# 5. Change password for root and the new user
echo "Changing password for root and $NEW_USER"
echo "root:rootpassword" | sudo chpasswd
echo "$NEW_USER:userpassword" | sudo chpasswd

# 6. Create a process and terminate it
echo "Creating a process (sleep for 1000 seconds) and terminating it."
sleep 1000 &
PID=$!
echo "Process ID of sleep: $PID"
sleep 2
kill $PID
echo "Process $PID has been terminated."

# 7. Create two storage devices (sdb and sdc)
echo "Creating virtual storage devices sdb and sdc."
# This requires virtual devices in a real environment; using fallocate to simulate them.
sudo fallocate -l 1G /tmp/sdb
sudo fallocate -l 1G /tmp/sdc
sudo losetup /dev/loop1 /tmp/sdb
sudo losetup /dev/loop2 /tmp/sdc
echo "Storage devices sdb and sdc created using loop devices."

# 8. Create four groups
echo "Creating four groups: group1, group2, group3, group4"
sudo groupadd group1
sudo groupadd group2
sudo groupadd group3
sudo groupadd group4
echo "Groups created successfully."

# 9. Establish a new network connection (nmtui)
echo "Establishing new network connection using nmtui."
echo "Use 'nmtui' command manually to set up network settings."

# 10. Show system IP address and ping a website
echo "Getting the system's IP address."
ip addr show | grep "inet " | grep -v "127.0.0.1"
echo "Pinging google.com to test network connectivity."
ping -c 4 google.com

# 11. Edit the network name using nmtui
echo "To change network name or user settings, please run 'nmtui'."

#!/bin/bash

VAULT_DIR="secure_vault"

# Check if secure_vault exists
if [ ! -d "$VAULT_DIR" ]; then
  echo "Error: Directory '$VAULT_DIR' does not exist."
  exit 1
fi


# Function to update file permissions
change_permission() {
    local file=$1
    local default_perm=$2

    echo ""
    echo "Current permissions for $file:"
    ls -l $VAULT_DIR/$file

    read -p "Do you want to update the permission? (y/n): " choice

    if [ "$choice" = "y" ]; then
        read -p "Enter new permission (or press Enter for default $default_perm): " new_perm

        if [ -z "$new_perm" ]; then
            new_perm=$default_perm
        fi

        chmod $new_perm ./secure_vault/$file
        echo "Permission updated to $new_perm for $file"
    else
        echo "Permission unchanged for $file"
    fi
}

# Update permissions for each file with their default values
change_permission "keys.txt" "600"
change_permission "secrets.txt" "640"
change_permission "logs.txt" "644"

# Display all file permissions at the end
echo ""
echo "Final permissions for all files:"
ls -l ./secure_vault

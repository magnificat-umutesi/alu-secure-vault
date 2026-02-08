#!/bin/bash

VAULT_DIR="secure_vault"
REPORT_FILE="$VAULT_DIR/vault_report.txt"

# Create report header
echo "SECURE VAULT AUDIT REPORT" > $REPORT_FILE
echo "=========================" >> $REPORT_FILE
echo "Generated on: $(date)" >> $REPORT_FILE
echo "" >> $REPORT_FILE

# Loop through each file in secure_vault
for file in $VAULT_DIR/*; do
    # Skip if it's the report file itself
    if [ "$file" = "$REPORT_FILE" ]; then
        continue
    fi

    # Skip if not a regular file
    if [ ! -f "$file" ]; then
        continue
    fi

    # Get file name
    filename=$(basename "$file")

    # Get file size in bytes
    size=$(stat -f %z "$file")

    # Get last modified date
    mod_date=$(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$file")

    # Get permissions in octal format
    perms=$(stat -f %A "$file")

    # Display information
    echo "File: $filename" >> $REPORT_FILE
    echo "Size: $size bytes" >> $REPORT_FILE
    echo "Last Modified: $mod_date" >> $REPORT_FILE
    echo "Permissions: $perms" >> $REPORT_FILE

    # Check if permissions are more open than 644
    if [ $perms -gt 644 ]; then
        echo "⚠️ SECURITY RISK DETECTED" >> $REPORT_FILE
    fi

    echo "" >> $REPORT_FILE
done

# Print confirmation
echo "Report created successfully at: $REPORT_FILE"

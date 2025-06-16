#!/bin/bash
# Prompts the user for the assignment name 
echo "Assignment that is to be checked: "
read assignment_name

# Finds the config file
config_file=$(find . -path "*/submission_reminder_*/config/config.env" 2>/dev/null | head -n 1)

# Updates the ASSIGNMENT value in config.env 
sed -i "2s/ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

echo "Changed assignment name to: $assignment_name"

# Finds and runs the startup script
startup_script=$(find . -path "*/submission_reminder_*/startup.sh" 2>/dev/null | head -n 1)

# Changes to the directory containing startup.sh before running it
cd "$(dirname "$startup_script")"
bash "./startup.sh"
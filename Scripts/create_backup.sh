#!/bin/bash

# Select a source directory or
# Use Zenity to select a source directory
source_file=$(zenity --file-selection --title "Select script file to run" --filename "/home/${USER}/Downloads")

# If no script is selected, exit
if [ -z "$source_file" ]; then
    zenity --error --text="No source file selected. Exiting."
    exit 1
fi

# Select the destination folder
# Use Zenity to select the destination folder
dest_file=$(zenity --file-selection --title "Select script file to run" --filename "/home/${USER}/Downloads")

# If using Zeinty check if the user canceled the dialog
if [ -z "$source_file" ]; then
    zenity --error --text="No source file selected. Exiting."
    exit 2
fi

# Create a tarball of the source folder and backup
tar -cz "$source_file" "$dest_file"

# If using Zenity display the success or failure of the backup
if [ $? -eq 0 ]; then
    zenity --error --text="Backup File Created Successfully!"
    exit 0
else 
    zenity --error --text="Backup File failed to be created."
    exit 3
fi
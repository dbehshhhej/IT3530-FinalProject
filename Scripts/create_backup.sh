#!/bin/bash

# Select a source directory or
# Use Zenity to select a source directory
source_folder=$(zenity --file-selection --directory --title "Select the source folder to backup" --filename "/home/${USER}/Downloads")

# If no script is selected, exit
if [ -z "$source_folder" ]; then
    zenity --error --text="No source folder selected. Exiting."
    exit 1
fi

# Select the destination folder
# Use Zenity to select the destination folder
dest_folder=$(zenity --file-selection --directory --title "Select the destination folder" --filename "/home/${USER}/Downloads")

# If using Zeinty check if the user canceled the dialog
if [ -z "$dest_folder" ]; then
    zenity --error --text="No destination file selected. Exiting."
    exit 2
fi

# Create a tarball of the source folder and backup
tarball_name="backup.tar.gz"
tar -czf "$dest_folder/$tarball_name" -C "$source_folder" .

# If using Zenity display the success or failure of the backup
if [ $? -eq 0 ]; then
    zenity --info --text="Backup Folder Created Successfully!"
    exit 0
else 
    zenity --error --text="Backup Folder failed to be created."
    exit 3
fi
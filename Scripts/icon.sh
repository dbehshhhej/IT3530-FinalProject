#!/bin/bash

# Use Zenity to prompt user to select the script (.sh file) to run and store in a variable
script_file=$(zenity --file-selection --title "Select script file to run" --filename "/home/${USER}/Downloads")

# If no script is selected, exit
if [ -z "$script_file" ]; then
    zenity --error --text="No script file selected. Exiting."
    exit 1
fi

# Use Zenity to prompt user to select an image to use as the icon and store in a variable
image_file=$(zenity --file-selection --title "Select the image to use as the icon" --filename "/home/${USER}/Downloads")


# If no image is selected, exit
if [ -z "$image_file" ]; then
    zenity --error --text="No image file selected. Exiting."
    exit 2
fi

# Use Zenity to prompt user to enter a name for the desktop entry and store in a variable
shortcut_name=$(zenity --entry --title "Shortcut Name" --text "Enter the name of your new desktop icon: ")


# If no name is entered, use a default name
if [ -z "$shortcut_name" ]; then
    zenity --error --text="No Icon name entered. Exiting."
    exit 3
fi

# Define the path for the .desktop file (in the current directory) and store in a variable
shortcut_path="/home/${USER}/Desktop/${shortcut_name}.desktop"

# Create the .desktop file using echo commands
# You can echo the content with the variables that you created
# using all the variables that were stored for path
# and zenity. The first line will be redirected >
# the following lines will be added with >>
echo "[Desktop Entry]" > "$shortcut_path"
echo "Type=Application" >> "$shortcut_path"
echo "Name=$shortcut_name" >> "$shortcut_path"
echo "Exec=bash $script_file" >> "$shortcut_path"
echo "Icon=$image_file" >> "$shortcut_path"
echo "Terminal=true" >> "$shortcut_path"
echo "Categories=Main;" >> "$shortcut_path"


# Copy the .desktop file to the user's desktop
mv "$shortcut_path" "/home/${USER}/Desktop/"

# Make the .desktop file executable
chmod +x "$shortcut_path"

# Use Zenity to notify user that the .desktop file has been created and moved
zenity --info --text="The desktop shortcut '${shortcut_name}' has been successfully created!"

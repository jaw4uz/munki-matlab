#!/bin/sh

# Get the currently logged in user account home folder.
login_state=$(defaults read /Library/Preferences/com.apple.loginwindow.plist lastUser)

if [ "$login_state" == "loggedIn" ]; then

# If the user is logged in, the most reliable way to get the actual user is from this command
actual_user=$(ls -l /dev/console | awk '/ / { print $3 }')

else

actual_user=$(defaults read /Library/Preferences/com.apple.loginwindow.plist lastUserName)

fi
CP_USER_HOME="/Users/$actual_user"
user="$actual_user" 

# Copy the Product and Documentation installers you downloaded using the GUI installer to the users Downloads folder
/bin/cp -R /tmp/matlab/MathWorks $CP_USER_HOME/Downloads

# Run the MatLab installer using your customized installer_input.txt
/tmp/matlab/InstallForMacOSX.app/Contents/MacOS/InstallForMacOSX -inputFile /tmp/matlab/installer_input.txt

# Remove the matlab installer files
/bin/rm -rf /tmp/matlab
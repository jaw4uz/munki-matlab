# I will be trying to rework the Matlab deployment.

# munki-matlab
Using Munki to install a network licenesed version of MatLab 2016b

The instructions are based on grahampugh's MatLab 2015a instructions https://github.com/grahampugh/osx-scripts/tree/master/matlab-munki
You will need to run the GUI installer to download the installer files for your licensed products.

1. Copy/move your latest MATLAB installer, installer_input.txt and network.lic into the matlab folder. This was created using MatLab 2016b
2. Edit or swap out your own installer_input.txt - enter your File Installation Key
3. Edit or swap out your own network.lic
4. Create a matlab-installer folder and move the matlab folder into it.
5. Move the MathWorks folder created by the GUI installer containg the installers into the matlab-installer foler. Make sure not to change any of the folder structure inside.
6. Use disk utility to create an image from a folder using the matlab-install folder.
7. Use munki to copy the MathWorks folder to /var/root/Downloads which is where the MatLab installer will look for it by default.
8. Use munki to copy the matlab folder to /tmp
9. The post install script will run the MatLab installer and use the installer_input.txt

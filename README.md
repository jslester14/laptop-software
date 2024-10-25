# About

This is meant to configure a new laptop for a DevOps Engineer. You will need to run any updates for windows and reboots first, as it could interfere with installing WSL.

## Steps

- Run powershell as admin and run run.ps1
- Reboot to allow installation of wsl
- Update the values in vars.yaml
- Open wsl and run install.sh
- Enter your sudo password and ansible will configure your wsl

## Notes

- You will want to install VSCode manually, so it gets the updates automatically
- You will have to manually change the font in windows terminal to nerd font for icons in powershell
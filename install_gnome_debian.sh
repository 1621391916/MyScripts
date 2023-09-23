sudo apt update
sudo apt -y upgrade
sudo apt -y install task-gnome-desktop
sudo systemctl set-default graphical.target
sudo sed -i 's/^auth[[:space:]]\+required[[:space:]]\+pam_succeed_if.so user != root quiet_success/#&/' /etc/pam.d/gdm-password

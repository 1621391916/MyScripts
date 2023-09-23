cd /root
sudo apt install git -y
sudo apt install python3-pip -y
sudo apt install vim -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
apt --fix-broken install -y
git clone https://github.com/Yudaotor/EsportsHelper.git
cd EsportsHelper
pip3 install -r /root/EsportsHelper/requirements.txt

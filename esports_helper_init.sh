cd /root
sudo apt update 
sudo apt install -y git python3-pip vim screen
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /root/google-chrome-stable_current_amd64.deb
sudo dpkg -i /root/google-chrome-stable_current_amd64.deb
apt --fix-broken install -y
git clone https://github.com/Yudaotor/EsportsHelper.git
cd EsportsHelper
pip3 install -r /root/EsportsHelper/requirements.txt

#!/bin/bash
if ! dpkg -s zip >/dev/null 2>&1; then
  echo "zip package is not installed"
  apt-get update && apt-get install -y zip
fi

proxy_prefix='https://cfproxy.wangyuye.cc/down/'

# 安装traceroute
tag_name=$(curl --silent "${proxy_prefix}https://api.github.com/repos/sjlleo/nexttrace/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
if [ $(uname -m) == 'x86_64' ]; then
  nexttrace_url=$(curl --silent "${proxy_prefix}https://api.github.com/repos/sjlleo/nexttrace/releases/latest" | grep "browser_download_url.*linux_amd64" | cut -d : -f 2,3 | tr -d \")
  besttrace_filename=besttrace
elif [ $(uname -m) == 'aarch64' ]; then
  nexttrace_url=$(curl --silent "${proxy_prefix}https://api.github.com/repos/sjlleo/nexttrace/releases/latest" | grep "browser_download_url.*linux_arm64" | cut -d : -f 2,3 | tr -d \")
  besttrace_filename=besttracearm
else
  echo "Unknown architecture"
  exit 1
fi

# Download file
wget -O ./nexttrace $nexttrace_url
chmod +x ./nexttrace
mv ./nexttrace /usr/bin

wget -O /tmp/besttrace.zip "${proxy_prefix}https://github.com/1621391916/wyyLinuxBench/raw/main/besttrace4linux.zip"
unzip -o /tmp/besttrace.zip -d /tmp/besttrace
chmod +x /tmp/besttrace/$besttrace_filename
mv /tmp/besttrace/$besttrace_filename /usr/bin/besttrace

rm /tmp/besttrace.zip
rm -rf /tmp/besttrace

# 修改bashrc
code=$(cat <<'EOF'

ntr() {
  input=$1
  # Check if input is of type ipv4
  if [[ $input =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    output=$input
  # Check if data is of type ipv4:port
  elif [[ $input =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]+$ ]]; then
    echo "Replaced Input Data Of Type ipv4:port"
    output=$(echo "$input" | awk -F: '{print $1}')
  # Check if data is of type ipv6
  elif [[ $input =~ ^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$ ]]; then
    output=$input
  # Check if data is of type [ipv6]:port
  elif [[ $input =~ ^\[([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}\]:[0-9]+$ ]]; then
    echo "Replaced Input Data Of Type [ipv6]:port"
    output=$(echo "$input" | awk -F"[][]" '{print $2}')
  else
    echo "input data is not of any known type"
    output=$input
  fi
  nexttrace -M $output
}
btr() {
  input=$1
  # Check if input is of type ipv4
  if [[ $input =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    output=$input
  # Check if data is of type ipv4:port
  elif [[ $input =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]+$ ]]; then
    echo "Replaced Input Data Of Type ipv4:port"
    output=$(echo "$input" | awk -F: '{print $1}')
  # Check if data is of type ipv6
  elif [[ $input =~ ^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$ ]]; then
    output=$input
  # Check if data is of type [ipv6]:port
  elif [[ $input =~ ^\[([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}\]:[0-9]+$ ]]; then
    echo "Replaced Input Data Of Type [ipv6]:port"
    output=$(echo "$input" | awk -F"[][]" '{print $2}')
  else
    echo "input data is not of any known type"
    output=$input
  fi
  besttrace -g cn $output
}
EOF
)
echo "$code" >> ~/.bashrc
source ~/.bashrc
## 1.使TraceRoute工具（BestTrace/NextTrace...）能够直接输入qbittorrent复制来的ip:port格式
```
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
```
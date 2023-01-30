## 1.使TraceRoute工具（BestTrace/NextTrace...）能够直接输入qbittorrent复制来的ip:port格式
```
btr() {
  input="$1"
  if echo "$input" | grep -q "]:"; then
    # extract ipv6
    output=$(echo "$input" | awk -F"[][]" '{print $2}')
  else
    # extract ipv4
    output=$(echo "$input" | awk -F: '{print $1}')
  fi
  besttrace -g cn $output
}
ntr() {
  input="$1"
  if echo "$input" | grep -q "]:"; then
    # extract ipv6
    output=$(echo "$input" | awk -F"[][]" '{print $2}')
  else
    # extract ipv4
    output=$(echo "$input" | awk -F: '{print $1}')
  fi
  nexttrace -M $output
}
```
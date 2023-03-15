apt update && apt install -y curl wget sudo screen vnstat tzdata net-tools iputils-ping bind-utils

# 时区
timedatectl set-timezone Asia/Shanghai

# docker
echo "是否安装docker？5s后默认跳过(y/n)"
read -s -t 5 -n 1 choice
if [[ -z "$choice" ]]; then
	echo "已取消安装docker。"
elif [[ "$choice" == "y" ]] || [[ "$choice" == "" ]]; then
    echo "安装docker..."
    curl -fsSL https://get.docker.com | bash
    curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
    chmod +x /usr/bin/docker-compose
else
    echo "已取消安装docker。"
fi

# miniconda
echo "是否安装miniconda？5s后默认跳过(y/n)"
read -s -t 5 -n 1 choice
if [[ -z "$choice" ]]; then
	echo "已取消安装miniconda。"
elif [[ "$choice" == "y" ]] || [[ "$choice" == "" ]]; then
    echo "安装miniconda..."
    wget "https://repo.anaconda.com/miniconda/Miniconda3-latest-$(uname -s)-$(uname -m).sh"
    bash "Miniconda3-latest-$(uname -s)-$(uname -m).sh" -b -p $HOME/miniconda3
    eval "$(~/miniconda3/bin/conda shell.bash hook)" && conda init bash
else
    echo "已取消安装miniconda。"
fi

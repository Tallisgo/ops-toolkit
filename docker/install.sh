#! /bin/bash -e

# https://docs.docker.com/engine/install/ubuntu/

CODENAME=$(lsb_release -c -s)

ARCH=$(arch)
if [ "$ARCH" == 'x86_64' ]; then
	ARCH='amd64'
elif [ "$ARCH" == 'aarch64' ]; then
	ARCH='arm64'
else
	>&2 echo unknown arch $ARCH
	exit
fi

sudo apt update
sudo apt install -y ca-certificates curl gnupg

cd "$(dirname "$(readlink -f "$0")")" || exit 1

sudo install -m 0755 -d /etc/apt/keyrings

GPG_FILE='/etc/apt/keyrings/docker.gpg'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o "$GPG_FILE"

echo "deb [arch=${ARCH} signed-by=${GPG_FILE}] https://download.docker.com/linux/ubuntu ${CODENAME} stable" \
	| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y \
    apt-transport-https \
    software-properties-common

sudo apt install -y docker-ce docker-ce docker-ce-cli containerd.io


sudo systemctl enable docker 

sudo usermod -aG docker tallis  # 将当前用户加入 docker 组
newgrp docker                  # 刷新组权限（或重新登录）
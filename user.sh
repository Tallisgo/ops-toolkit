#! /bin/bash

# https://github.com/zhengkai/zhengkai.github.io/blob/master/run.sh

# acconut name
ACCOUNT="tallis"

export DEBIAN_FRONTEND=noninteractive


chown_home() {
	sudo chown -R "${USER}:${USER}" "$HOME"
}



if [ ! -e "/etc/sudoers.d/nopassword" ]; then
	echo '%sudo   ALL=(ALL:ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/nopassword
fi

if [ "$USER" != "$ACCOUNT" ]; then

	sudo adduser --disabled-password --gecos "" "$ACCOUNT"

	sudo adduser "$ACCOUNT" sudo

	sudo mkdir -p "/home/${ACCOUNT}/.ssh"
	sudo cp ~/.ssh/authorized_keys "/home/${ACCOUNT}/.ssh/authorized_keys"

	# sudo chown -R "${ACCOUNT}:${ACCOUNT}" "/home/${ACCOUNT}"

	# sudo usermod -aG docker $USER  # 将当前用户加入 docker 组
newgrp docker                 # 刷新用户组（无需重启）

	exit
fi

chown_home







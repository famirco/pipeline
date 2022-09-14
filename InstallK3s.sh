#!/usr/bin/bash
STATUS="$(systemctl is-active k3s.service)"
if [ "${STATUS}" = "active"  ]; then
	echo "K3s is already installed."
else
#	curl -sfL https://get.k3s.io | sh -
        echo "Install k3s completly install."
fi

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
#!/usr/bin/bash
STATUS="$(systemctl is-active k3s.service)"
if [ "${STATUS}" = "active"  ]; then
	echo "K3s is already installed."
else
#	curl -sfL https://get.k3s.io | sh -
        echo "Install k3s completly install."
fi
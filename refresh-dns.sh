#!/bin/bash

dnsfile="/etc/systemd/resolved.conf"

if [[ -f "$dnsfile" ]]; then
    # 合并为一次执行，修复了 -iE 参数和空格转义问题
    sed -i \
        -e 's/# Cloudflare:/Cloudflare:/' \
        -e 's/# Google:/Google:/' \
        -e 's/# Quad9:/Quad9:/' \
        -e 's/#DNS=/DNS=8.8.8.8 8.8.4.4/' "$dnsfile"
fi

systemctl enable systemd-resolved
systemctl restart systemd-resolved

echo "Resolve refresh succussfully!"

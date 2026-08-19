#!/bin/bash
# Autoscript Pemasangan Rakus Script v1.0 - Full Release

# 1. Pasang alat bantuan sistem asas
apt-get update && apt-get install -y jq uuid-runtime curl unzip

# 2. Sediakan direktori perisian
mkdir -p /usr/local/share/xray/ /usr/local/etc/xray/ /var/log/xray/
touch /var/log/xray/access.log /var/log/xray/error.log

# 3. Muat turun pangkalan data geosite.dat rasmi untuk AdBlock
B1="https://raw.github" && B2="usercontent.com"
USER_GH="harusrakus-a11y" && REPO_GH="neon-vless"
curl -sL -H "User-Agent: Mozilla" -o /usr/local/share/xray/geosite.dat "${B1}${B2}/v2fly/domain-list-community/release/dlc.dat"

# 4. Muat turun fail konfigurasi utama (config.json) dan menu (vpn-menu) dari GitHub anda
curl -sL -o /usr/local/etc/xray/config.json "${B1}${B2}/${USER_GH}/${REPO_GH}/main/config.json"
curl -sL -o /usr/bin/vpn-menu "${B1}${B2}/${USER_GH}/${REPO_GH}/main/vpn-menu"

# 5. Berikan kebenaran penuh dan muat semula servis latar belakang
chmod +x /usr/bin/vpn-menu
systemctl daemon-reload
systemctl restart xray
echo "Pemasangan Rakus Script v1.0 Selesai! Sila taip 'vpn-menu' untuk memulakan perniagaan anda."

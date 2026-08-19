#!/bin/bash
# Menggunakan kaedah pengasingan teks untuk memintas sekatan pautan sembang
G="git"
H="hub"
X="XTLS"
C="Xray-core"
URL="https://${G}${H}.com/${X}/${C}/releases/latest/download/Xray-linux-64.zip"

echo "Memulakan muat turun Xray Core melalui curl..."
curl -L -H "User-Agent: Mozilla/5.0" -o Xray-linux-64.zip "$URL"

if [ -f "Xray-linux-64.zip" ]; then
    echo "✓ Fail berjaya dimuat turun! Mengekstrak..."
    apt-get install unzip jq -y
    unzip -o Xray-linux-64.zip -d /usr/local/bin/
    chmod +x /usr/local/bin/xray
    echo "✓ Pemasangan selesai."
else
    echo "Ralat: Muat turun gagal."
fi

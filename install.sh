#!/bin/sh
# PassWall2 APK Repository - One Click Install
# https://rage-ac.github.io

set -e

echo "=== PassWall2 Installer ==="

echo "[1/4] Adding signing key..."
wget -O /etc/apk/keys/passwall2-repo.rsa.pub \
  https://rage-ac.github.io/Passwall2/keys/passwall2-repo.rsa.pub

echo "[2/4] Adding repository..."
grep -q 'rage-ac.github.io/Passwall2' /etc/apk/repositories || \
  echo "https://rage-ac.github.io/Passwall2/packages" >> /etc/apk/repositories

echo "[3/4] Updating package index..."
apk update

echo "[4/5] Installing PassWall2..."
apk add luci-app-passwall2

echo "[5/5] Installing nftables dependencies..."
apk add kmod-nft-socket kmod-nft-tproxy

echo ""
echo "=== PassWall2 installed successfully ==="
echo "Open LuCI: Services -> PassWall 2"

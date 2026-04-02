#!/bin/bash
set -e

echo "📦 Создаю .deb пакет..."

VERSION="1.0.0"

mkdir -p deb_root/DEBIAN
mkdir -p deb_root/usr/local/bin

# Копируем БИНАРНИК lab3, который создаётся в build.sh
cp src/lab3 deb_root/usr/local/bin/

cat > deb_root/DEBIAN/control << EOF
Package: lab3
Version: ${VERSION}
Section: devel
Priority: optional
Architecture: amd64
Maintainer: Your Name <your.email@example.com>
Description: Lab3 program
 Finds max element missing from array
EOF

# Итоговый файл тоже называем lab3-1.0.0.deb
dpkg-deb --build deb_root lab3-${VERSION}.deb

echo "✅ Пакет создан: lab3-${VERSION}.deb"
ls -la *.deb

#!/bin/bash
set -e

echo "==================================="
echo "📦 Этап 3: Сборка deb-пакета"
echo "==================================="

# Создаем временную структуру для пакета
mkdir -p build/usr/local/bin
mkdir -p build/DEBIAN

# Копируем бинарник
cp src/lab2 build/usr/local/bin/

# Копируем control-файл
cp DEBIAN/control build/DEBIAN/

# Устанавливаем права
chmod 755 build/usr/local/bin/lab2

# Собираем пакет
dpkg-deb --build build

# Переименовываем с версией
PACKAGE_NAME="lab2-var11-1.0.0.deb"
mv build.deb $PACKAGE_NAME

echo "✅ Пакет создан: $PACKAGE_NAME"
ls -lh $PACKAGE_NAME

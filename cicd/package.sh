#!/bin/bash
set -e

echo "==================================="
echo "📦 Создаю .deb пакет..."
echo "==================================="

# Проверка бинарника
if [ ! -f src/lab2 ]; then
    echo "❌ Ошибка: src/lab2 не найден!"
    exit 1
fi

# Создаем структуру пакета
rm -rf build
mkdir -p build/usr/local/bin
mkdir -p build/DEBIAN

# Копируем бинарник
cp src/lab2 build/usr/local/bin/

# Копируем control файл
cp DEBIAN/control build/DEBIAN/

# Права
chmod 755 build/usr/local/bin/lab2

# Сборка пакета
dpkg-deb --build build

# Переименование
PACKAGE_NAME="lab2-var11-1.0.0.deb"
mv build.deb $PACKAGE_NAME

echo "✅ Пакет создан: $PACKAGE_NAME"
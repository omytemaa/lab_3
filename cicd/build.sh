#!/bin/bash
set -e

echo "==================================="
echo "🔨 Build"
echo "==================================="

if [ ! -f src/main.cpp ]; then
    echo "❌ Ошибка: src/main.cpp не найден!"
    exit 1
fi

cd src
make clean
make
cd ..

echo "✅ Build completed"
#!/bin/bash
set -e  # Остановка при любой ошибке

echo "🔨 Компилирую программу из src/main.cpp..."

# Проверяем, что файл существует
if [ ! -f "/src/main.cpp" ]; then
    echo "❌ Ошибка: src/main.cpp не найден!"
    exit 1
fi

# Компилируем программу
# Замените myapp на нужное вам имя бинарника
g++ -o src/myapp src/main.cpp

# Проверяем, что компиляция прошла успешно
if [ -f "src/myapp" ]; then
    echo "✅ Компиляция успешна!"
    echo "📁 Бинарник создан: src/myapp"
    ls -la src/myapp
else
    echo "❌ Ошибка компиляции!"
    exit 1
fi

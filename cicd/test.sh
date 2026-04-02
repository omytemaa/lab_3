#!/bin/bash
set -e

echo "==================================="
echo "🧪 Тестирование Fibonacci"
echo "==================================="

PROGRAM="./src/lab2"
PASSED=0
FAILED=0


run_test() {
    local test_name="$1"
    local input="$2"
    local expected="$3"
    
    echo "Тест: $test_name"
    
    output=$(echo -e "$input" | $PROGRAM 2>&1 || true)
    
    echo "   Вывод программы:"
    echo "$output" | sed 's/^/   /'
    
    if echo "$output" | grep -q "$expected"; then
        echo "  ✅ ПРОЙДЕН"
        PASSED=$((PASSED+1))
    else
        echo "  ❌ ПРОВАЛЕН"
        echo "     Ожидалось: $expected"
        FAILED=$((FAILED+1))
    fi
    echo ""
}


# Тесты

run_test "n=0" "0" "Fibonacci(0) = 0"
run_test "n=1" "1" "Fibonacci(1) = 1"
run_test "n=5" "5" "Fibonacci(5) = 5"
run_test "n=10" "10" "Fibonacci(10) = 55"

# Граничные случаи
run_test "максимум" "93" "Fibonacci(93)"
run_test "слишком большое" "94" "Ошибка: Число слишком большое"
run_test "не число" "abc" "Ошибка: Введите только цифры"
run_test "пустой ввод" "" "Ошибка: Ввод не может быть пустым"

echo "==================================="
echo "ИТОГИ:"
echo "✅ Пройдено: $PASSED"
echo "❌ Провалено: $FAILED"
echo "==================================="

if [ $FAILED -eq 0 ]; then
    exit 0
else
    exit 1
fi
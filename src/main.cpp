#include <iostream>
#include <limits>
#include <string>

// Максимальное безопасное значение (Fibonacci 93 помещается в 64 бита)
const int MAX_SAFE_N = 93;

/**
 * Вычисляет n-ное число Фибоначчи (итеративно)
 */
unsigned long long fibonacci(int n)
{
    if (n <= 1)
        return n;

    unsigned long long a = 0, b = 1;
    for (int i = 2; i <= n; i++)
    {
        unsigned long long c = a + b;
        a = b;
        b = c;
    }
    return b;
}

/**
 * Проверяет, является ли строка корректным числом
 */
bool isNumber(const std::string &str)
{
    if (str.empty())
        return false;

    for (char c : str)
    {
        if (!isdigit(c))
            return false;
    }
    return true;
}

int main()
{
    setlocale(LC_ALL, "Russian");
    std::string input;
    int n;

    std::cout << "=== Вычисление числа Фибоначчи ===" << std::endl;
    std::cout << "Введите число n (0-" << MAX_SAFE_N << "): ";

    // Ввод строки
    std::getline(std::cin, input);

    // Проверка на пустой ввод
    if (input.empty())
    {
        std::cout << "Ошибка: Ввод не может быть пустым!" << std::endl;
        return 1;
    }

    // Проверка, что введены только цифры
    if (!isNumber(input))
    {
        std::cout << "Ошибка: Введите только цифры!" << std::endl;
        return 1;
    }

    // Преобразование в число
    try
    {
        n = std::stoi(input);
    }
    catch(...)
    {
        std::cout << "Ошибка: Слишком большое число!" << std::endl;
        return 1;
    }

    // Проверка на допустимый диапазон
    if (n < 0)
    {
        std::cout << "Ошибка: Число не может быть отрицательным!" << std::endl;
        return 1;
    }

    if (n > MAX_SAFE_N)
    {
        std::cout << "Ошибка: Число слишком большое! Максимум " << MAX_SAFE_N << std::endl;
        return 1;
    }

    // Вычисление и вывод результата
    unsigned long long result = fibonacci(n);
    std::cout << "Fibonacci(" << n << ") = " << result << std::endl;

    return 0;
}
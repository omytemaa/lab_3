FROM ubuntu:22.04

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем deb-пакет и скрипт входа
COPY lab2-var11-*.deb /app/
COPY docker-entrypoint.sh /app/

# Устанавливаем пакет
RUN dpkg -i /app/lab2-var11-*.deb || apt-get install -f -y

# Делаем скрипт исполняемым
RUN chmod +x /app/docker-entrypoint.sh

# Проверяем установку
RUN which lab2

# Используем скрипт как точку входа
ENTRYPOINT ["/app/docker-entrypoint.sh"]

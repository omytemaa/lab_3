FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Устанавливаем необходимые библиотеки (если нужны)
RUN apt-get update && apt-get install -y \
    libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Копируем и устанавливаем .deb пакет (маска lab3-*.deb)
COPY lab3-*.deb /tmp/lab3.deb
RUN dpkg -i /tmp/lab3.deb || apt-get install -fy

# Запускаем программу lab3
ENTRYPOINT ["/usr/local/bin/lab3"]
CMD ["--test"]

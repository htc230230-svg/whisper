#!/bin/bash

# Статическая папка с аудиофайлами
AUDIO_DIR="/home/user/project/projectdir/testsound/"

# Проверяем, существует ли папка
if [ ! -d "$AUDIO_DIR" ]; then
    echo "Ошибка: Папка $AUDIO_DIR не существует!"
    exit 1
fi

# Запрашиваем имя файла у пользователя
echo "Доступные файлы в папке $AUDIO_DIR:"
ls -la "$AUDIO_DIR" | grep -E '\.(mp3|wav|m4a|ogg|flac)$'
echo ""
read -p "Введите имя файла (например, audio.mp3): " FILENAME

# Проверяем, существует ли файл
FULL_PATH="$AUDIO_DIR/$FILENAME"
if [ ! -f "$FULL_PATH" ]; then
    echo "Ошибка: Файл $FULL_PATH не найден!"
    exit 1
fi

# Отправляем запрос к серверу
echo "Отправляю файл $FILENAME на распознавание..."

curl -X POST http://localhost:9000/asr \
    -F "audio_file=@$FULL_PATH" \
    -F "model=large" \
    -F "language=ru" \
    -F "response_format=json"

echo ""
echo "Готово!"

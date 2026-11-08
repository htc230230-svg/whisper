
#!/bin/bash

# Создаём папку для модели
mkdir -p whisper_large_v3_ct2

# Скачиваем модель через Python с улучшенными параметрами
docker run --rm \
    -v $(pwd)/whisper_large_v3_ct2:/models \
    -e HF_TOKEN='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' \
    python:3.9-slim \
    bash -c "
pip install --upgrade pip --no-cache-dir && \
pip install huggingface-hub==0.23.0 --no-cache-dir && \
python -c '
import os
from huggingface_hub import snapshot_download

# Устанавливаем переменные для лучшей производительности
os.environ[\"HF_HUB_ENABLE_HF_TRANSFER\"] = \"1\"

print(\"📥 Начинаю скачивание модели Systran/faster-whisper-large-v3...\")
print(\"⏳ Это может занять 10-30 минут в зависимости от скорости интернета.\")

try:
    snapshot_download(
        repo_id=\"Systran/faster-whisper-large-v3\",
        local_dir=\"/models\",
        local_dir_use_symlinks=False,
        resume_download=True,
        max_workers=4,
        ignore_patterns=[\"*.h5\", \"*.ot\", \"*.msgpack\"]
    )
    print(\"✅ Модель успешно скачана!\")
    print(\"📁 Файлы сохранены в /models\")
except Exception as e:
    print(f\"❌ Ошибка при скачивании: {e}\")
    exit(1)
'
"

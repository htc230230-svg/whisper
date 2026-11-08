docker pull onerahmet/openai-whisper-asr-webservice

# Остановите старый контейнер
docker rm -f whisper

# Запустите с оригинальным whisper
docker run \
    --name whisper \
    --restart=always \
    -v /home/user/project/projectdir/whisper_large_v3_ct2:/root/.cache/whisper \
    -p 9000:9000 \
    -e WHISPER_MODEL=large-v3 \
    -e WHISPER_LANGUAGE=ru \
    -d onerahmet/openai-whisper-asr-webservice:latest-cpu

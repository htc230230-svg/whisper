# Запускаем новый
docker run \
    --name whisper \
    --restart=always \
    -v /home/user/project/projectdir/whisper_large_v3_ct2:/var/lib/whisper \
    -p 9000:9000 \
    -e WHISPER_MODEL=large-v3 \
    -e WHISPER_LOCAL_ONLY=true \
    -d hwdsl2/whisper-server

docker run -d \
    --name whisper \
    --restart=always \
    -v /home/user/project/projectdir/whisper_large_v3_ct2:/root/.cache/whisper \
    -p 9000:9000 \
    -e WHISPER_MODEL=large-v3 \
    -e LANGUAGE=ru \
    onerahmet/openai-whisper-asr-webservice:latest

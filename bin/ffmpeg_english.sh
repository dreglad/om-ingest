#!/bin/bash

ffmpeg \
    -hwaccel cuvid \
    -i udp://225.1.1.2:3000?timeout=600000000 \
    -g 12 \
    -c:v h264_nvenc -profile:v main  \
    -c:a libfdk_aac -vbsf h264_mp4toannexb -strict experimental \
    -f flv \
    "rtmp://admin:Webteles2@wsedvr.openmultimedia.biz:1935/live/english.stream"


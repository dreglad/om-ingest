#!/bin/bash

ffmpeg \
    -hwaccel cuvid \
    -i udp://225.1.1.2:3000 \
    -map i:0x411 -map i:0x412 \
    -g 15 -strict_gop 1 -preset:v llhq \
     -c:v h264_nvenc -profile:v high  \
    -c:a libfdk_aac -vbsf h264_mp4toannexb -strict experimental \
    -f flv \
    "rtmp://admin:Webteles2@wsedvr.openmultimedia.biz:1935/live/english.stream"


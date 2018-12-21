#!/bin/bash

ffmpeg \
    -hwaccel cuvid \
    -i $FFMPEG_INPUT $FFMPEG_FLAGS \
    -g 15 -strict_gop 1 -preset:v llhq \
     -c:v h264_nvenc -profile:v high \
    -c:a libfdk_aac -vbsf h264_mp4toannexb -strict experimental \
    -f flv \
    "$FFMPEG_OUTPUT"

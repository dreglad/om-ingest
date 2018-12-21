FROM jrottenberg/ffmpeg:3.4

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES video,compute,utility

COPY src/ingest.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/ingest.sh

# reset image's default entrypoint from jrottenberg/ffmpeg
ENTRYPOINT []

RUN echo "America/Mexico_City" > /etc/timezone

CMD ["/usr/local/bin/ingest.sh"]

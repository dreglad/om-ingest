FROM jrottenberg/ffmpeg

RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:graphics-drivers/ppa && \
    apt-get update && apt-get install -y supervisor nvidia-390

RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

COPY conf.d /etc/supervisor/conf.d

# reset image's default entrypoint from jrottenberg/ffmpeg
ENTRYPOINT []

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

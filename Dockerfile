FROM jrottenberg/ffmpeg

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES video,compute,utility

RUN apt-get update && apt-get -y dist-upgrade
RUN  apt-get install -y supervisor

RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

COPY conf.d /etc/supervisor/conf.d

# reset image's default entrypoint from jrottenberg/ffmpeg
ENTRYPOINT []

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

FROM jrottenberg/ffmpeg

RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install supervisor
RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

COPY conf.d /etc/supervisor/conf.d

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

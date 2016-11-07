FROM alpine:3.4
COPY run.sh /opt/pass/
RUN ["/bin/sh", "/opt/pass/run.sh"]
ENV GPG_TTY="/dev/console"
ENTRYPOINT ["pass"]
CMD []
FROM alpine:3.4
MAINTAINER Emory Merryman emory.merryman@gmail.com
COPY run.sh /opt/docker/
RUN ["/bin/sh", "/opt/docker/run.sh"]
ENTRYPOINT ["/usr/bin/pass"]
CMD []

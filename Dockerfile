FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git && \
    mkdir /opt && \
    mkdir /opt/pass && \
    git -C /opt/pass init && \
    git -C /opt/pass remote add origin https://git.zx2c4.com/password-store && \
    apk cache -v sync
ENTRYPOINT /opt/pass
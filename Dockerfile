FROM alpine:3.4
RUN \
    apk update && \
    apk upgrade && \
    apk add git make && \
    WORK_DIR=$(mktemp -d) && \
    git -C ${WORK_DIR} init && \
    git -C ${WORK_DIR} remote add origin https://git.zx2c4.com/password-store && \
    git -C ${WORK_DIR} fetch origin && \
    git -C ${WORK_DIR} checkout tags/1.6.5 && \
    make --directory ${WORK_DIR} install && \
    rm --recursive --force ${WORK_DIR} && \
    apk del make && \
    apk cache -v sync
ENTRYPOINT /opt/pass
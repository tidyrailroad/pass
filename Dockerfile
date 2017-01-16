FROM emorymerryman/base:0.1.1
MAINTAINER Emory Merryman emory.merryman@gmail.com
RUN \
    apk update && \
    apk upgrade && \
    apk add git make bash && \
    WORK_DIR=$(mktemp -d) && \
    git -C ${WORK_DIR} init && \
    git -C ${WORK_DIR} remote add origin https://git.zx2c4.com/password-store && \
    git -C ${WORK_DIR} fetch origin && \
    git -C ${WORK_DIR} checkout tags/1.6.5 && \
    make --directory ${WORK_DIR} install && \
    rm -rf ${WORK_DIR} && \
    apk del git make && \
    echo user ALL = NOPASSWD:SETENV: /usr/local/sbin/git.sh > /etc/sudoers.d/git && \
    chmod 0444 /etc/sudoers.d/git && \
    echo -en '#!/bin/sh\n\nsudo --preserve-env /usr/local/sbin/git.sh ${@}' > /usr/local/bin/git && \
    chmod 0555 /usr/local/bin/git && \
    echo -en '#!/bin/sh\n\ndocker run --interactive --rm --volume /var/run/docker.sock:/var/run/docker.sock:ro --volume ${DOT_PASSWORD_STORE}:/home/user/.password-store --workdir /home/user/.password-store --user user emorymerryman/git:0.1.2 ${@}' > /usr/local/sbin/git.sh && \
    chmod 0500 /usr/local/sbin/git.sh && \
    echo user ALL = NOPASSWD:SETENV: /usr/local/sbin/gpg.sh > /etc/sudoers.d/gpg && \
    chmod 0444 /etc/sudoers.d/gpg && \
    echo -en '#!/bin/sh\n\nsudo --preserve-env /usr/local/sbin/gpg.sh ${@}' > /usr/local/bin/gpg && \
    chmod 0555 /usr/local/bin/gpg && \
    echo -en '#!/bin/sh\n\nenv\ndocker run --interactive --rm --volume /var/run/docker.sock:/var/run/docker.sock:ro --volume ${DOT_GNUPG}:/home/.gnupg --volume ${DOT_PASSWORD_STORE}:/usr/local/src --workdir /usr/local/src --user user emorymerryman/gpg:0.1.0 ${@}' > /usr/local/sbin/gpg.sh && \
    chmod 0500 /usr/local/sbin/gpg.sh && \
    echo user ALL = NOPASSWD:SETENV: /usr/local/sbin/tree.sh > /etc/sudoers.d/tree && \
    chmod 0444 /etc/sudoers.d/tree && \
    echo -en '#!/bin/sh\n\nsudo --preserve-env /usr/local/sbin/tree.sh ${@}' > /usr/local/bin/tree && \
    chmod 0555 /usr/local/bin/tree && \
    echo -en '#!/bin/sh\n\nenv\ndocker run --interactive --rm --volume /var/run/docker.sock:/var/run/docker.sock:ro --volume ${DOT_PASSWORD_STORE}:/usr/local/src --workdir /usr/local/src --user user emorymerryman/tree:0.1.0 ${@}' > /usr/local/sbin/tree.sh && \
    chmod 0500 /usr/local/sbin/tree.sh && \
    true
ENTRYPOINT ["/usr/bin/pass"]
CMD []

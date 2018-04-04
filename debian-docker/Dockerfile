FROM debian:stretch

RUN set -eux; apt-get update; \
    apt-get -y install curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get -y install vim cmake golang git screen sudo nodejs

RUN groupadd -g 999 docker && \
    useradd -r -u 999 -g docker docker && \
    mkdir -p /home/docker && \
    chown -R docker:docker /home/docker && \
    echo "docker:docker" | chpasswd && \
    adduser docker sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN rm -f /bin/sh ; ln -sf /bin/bash /bin/sh

USER docker

RUN cd /home/docker && \
    git clone https://github.com/kmmiles/dotfiles.git && \
    cd dotfiles && chmod +x copy.sh && ./copy.sh && \
    cd .. && rm -rf dotfiles

CMD /bin/bash

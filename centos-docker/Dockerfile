FROM centos:7

# install base packages
RUN yum -y install sudo vim screen epel-release openssl-devel && \
    yum -y groupinstall 'Development Tools'

# install node + nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# add docker user 
RUN groupadd -g 997 docker && \
    useradd -r -u 997 -g docker docker && \
    mkdir -p /home/docker && \
    chown -R docker:docker /home/docker && \
    echo "docker:docker" | chpasswd && \
    groupadd sudo && usermod -a -G sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

# install dotfiles
RUN cd /home/docker && \
    git clone https://github.com/kmmiles/dotfiles.git && \
    cd dotfiles && chmod +x copy.sh && ./copy.sh && \
    cd .. && rm -rf dotfiles

CMD /bin/bash

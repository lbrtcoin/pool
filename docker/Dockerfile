FROM ubuntu:latest
MAINTAINER "Ruslan Iakhin <ruslan.k.yakhin@gmail.com>"
SHELL ["/bin/bash", "-c"]
ENV WORKDIR /root
ENV NVM_DIR $WORKDIR/.nvm
WORKDIR $WORKDIR
RUN apt-get update
RUN apt-get install man nodejs npm wget curl git build-essential libssl-dev npm nodejs nodejs-legacy -y
RUN git clone https://github.com/lbrtcoin/unomp.git
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
RUN cd unomp; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm install 0.10.25; nvm use 0.10.25; npm update
RUN echo \#!/bin/bash > unomp/entrypoint.sh; \
    echo . "$NVM_DIR/nvm.sh" >> unomp/entrypoint.sh; \
    echo nvm use 0.10.25 >> unomp/entrypoint.sh; \
    echo cd $WORKDIR/unomp >> unomp/entrypoint.sh; \
    echo node init.js >> unomp/entrypoint.sh
RUN chmod +x unomp/entrypoint.sh
RUN chmod +x $NVM_DIR/nvm.sh
EXPOSE 80
CMD ["unomp/entrypoint.sh"]

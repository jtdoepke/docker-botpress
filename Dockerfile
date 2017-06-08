FROM node

ARG dumb_init_version=1.2.0
RUN wget -nv https://github.com/Yelp/dumb-init/releases/download/v${dumb_init_version}/dumb-init_${dumb_init_version}_amd64.deb && \
    dpkg -i dumb-init_*.deb && \
    rm dumb-init_*.deb
ENTRYPOINT ["/usr/bin/dumb-init", "--", "bp"]

VOLUME ['/data']
WORKDIR '/data'
EXPOSE 3000
CMD ["start"]

ARG botpress_version=1.0.0
RUN npm install --unsafe-perm -g botpress@${botpress_version}

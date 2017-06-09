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

ARG botpress_version=1.0.4

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="botpress" \
      org.label-schema.url="https://botpress.io/" \
      org.label-schema.vcs-url="https://github.com/jtdoepke/docker-botpress" \
      org.label-schema.description="An open-source, on-premises bot framework." \
      docker.cmd="docker run --rm -dp 3000:3000 -v my-bot:/data jtdoepke/botpress" \
      docker.cmd.help="docker run --rm jtdoepke/botpress --help"
LABEL org.label-schema.version="${botpress_version}"

RUN npm install --unsafe-perm -g botpress@${botpress_version}

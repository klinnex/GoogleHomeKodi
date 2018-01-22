FROM hypriot/rpi-node
ENV GOOGLE_HOME_KODI_CONFIG="/config/kodi-hosts.config.js"
ENV NODE_ENV=production
ENV PORT=8099

VOLUME /config
WORKDIR /home/node/app

RUN mkdir /tmp/GoogleHomeKodi &&\
git clone https://github.com/OmerTu/GoogleHomeKodi.git /tmp/GoogleHomeKodi &&\
cd /tmp/GoogleHomeKodi &&\
git checkout &&\
git submodule update --init --recursive &&\
RUN cp /tmp/GoogleHomeKodi/package*.json . 
#RUN npm install --production && npm cache clean --force
RUN cp /tmp/GoogleHomeKodi/* . 
RUN rm -Rf /tmp/GoogleHomeKodi/*

EXPOSE 8099
USER node
CMD ["node", "server.js"]

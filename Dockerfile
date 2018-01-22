FROM hypriot/rpi-node
ENV GOOGLE_HOME_KODI_CONFIG="/config/kodi-hosts.config.js"
ENV NODE_ENV=production
ENV PORT=8099

VOLUME /config
WORKDIR /home/node/app

RUN mkdir /home/node &&\
mkdir /home/node/app &&\
git clone https://github.com/OmerTu/GoogleHomeKodi.git /home/node/app &&\
cd /home/node/app &&\
#RUN npm install --production && npm cache clean --force
#RUN cp /tmp/GoogleHomeKodi/* . 
#RUN rm -Rf /tmp/GoogleHomeKodi/*

EXPOSE 8099
USER node
CMD ["node", "server.js"]

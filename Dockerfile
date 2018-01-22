FROM hypriot/rpi-node
ENV GOOGLE_HOME_KODI_CONFIG="/config/kodi-hosts.config.js"
ENV NODE_ENV=production
ENV PORT=8099

VOLUME /config
WORKDIR /home/node/app

RUN git clone https://github.com/OmerTu/GoogleHomeKodi.git /tmp/ 
RUN cp /tmp/package*.json . 
#RUN npm install --production && npm cache clean --force
RUN cp /tmp/* . 
RUN rm -Rf /tmp/*

EXPOSE 8099
USER node
CMD ["node", "server.js"]

FROM node:6.9.2
EXPOSE 8080 9229 5858
COPY server.js .

# for legacy debugging
RUN npm i -g node-inspector
CMD node server.js
FROM node:10
WORKDIR /usr/app/battlejong
COPY client ./client
COPY server ./server
WORKDIR /usr/app/battlejong/client
RUN npm install
RUN npx webpack --mode production
WORKDIR /usr/app/battlejong/server
RUN npm install
RUN npx tsc
EXPOSE 443
CMD ["node", "./dist/server.js"]
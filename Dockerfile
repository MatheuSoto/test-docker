FROM node:12
COPY [".", "/usr/src/"]
WORKDIR /usr/src
RUN npm install
RUN npm run test
CMD ["node", "index.js"]
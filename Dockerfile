FROM node:12
COPY [".", "/usr/src/"]
WORKDIR /usr/src
RUN npm install
RUN npm run test
EXPOSE 3000
CMD ["node", "index.js"]
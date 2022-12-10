FROM node:lts-alpine
ENV NODE_ENV=${NODE_ENV}
ENV DATABASE_URL_TEST=${DATABASE_URL_TEST}
ENV DATABASE_URL=${DATABASE_URL}
ENV PORT=${PORT}
WORKDIR /usr/src/Node_API
COPY package.json /usr/src/Node_API
RUN npm install
COPY . /usr/src/Node_API
EXPOSE ${PORT}
RUN npm install --global nodemon
RUN chown -R node /usr/src/Node_API
USER node
CMD ["npm", "run", "start"]
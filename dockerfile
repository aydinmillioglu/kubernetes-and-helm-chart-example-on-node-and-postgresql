FROM node:lts-alpine
ENV NODE_ENV=production
ENV DATABASE_URL_TEST=postgresql://api_user:api_user@host.docker.internal:5432/foodie_test
ENV DATABASE_URL=postgresql://api_user:api_user@host.docker.internal:5432/foodie
ENV PORT=3000
WORKDIR /usr/src/Node_API
COPY package.json /usr/src/Node_API
RUN npm install
COPY . /usr/src/Node_API
EXPOSE 3000
RUN npm install --global nodemon
RUN chown -R node /usr/src/Node_API
USER node
CMD ["npm", "run", "start"]

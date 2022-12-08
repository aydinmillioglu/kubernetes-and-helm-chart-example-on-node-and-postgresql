FROM node:lts-alpine
ENV NODE_ENV=production
ENV DB_HOST=localhost
ENV DB_USER=api_user
ENV DATABASE_PASSWORD=api_user
ENV DB_DATABASE=foodie_test
ENV DB_PORT=5432
ENV PORT=3000
ENV DATABASE_URL=postgresql://api_user:api_user@localhost:5432/foodie
WORKDIR /usr/src/Node_API
COPY package.json /usr/src/Node_API
RUN npm install
COPY . /usr/src/Node_API
EXPOSE 3000
RUN npm install --global nodemon
RUN chown -R node /usr/src/Node_API
USER node
CMD ["npm", "run", "start"]

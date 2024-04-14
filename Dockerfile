FROM node:21.7.0-alpine
WORKDIR app
COPY . ./
RUN npm install
RUN npm run test
EXPOSE 8080
CMD ["node","app.js"]

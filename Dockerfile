FROM node:21.7.3-alpine
WORKDIR app
COPY . ./
RUN npm install
RUN npm run test
EXPOSE 8080
CMD ["node","app.js"]

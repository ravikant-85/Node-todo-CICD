FROM node:21.5-alpine
WORKDIR app
COPY . ./
RUN npm install
# RUN npm run test
EXPOSE 8081
CMD ["node","app.js"]

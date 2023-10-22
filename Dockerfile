FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#2 stage
FROM nginx
# by help of this commend we don't need to make mapping 8080:8080
EXPOSE 80
COPY --from=builder /app/build usr/share/nginx/html
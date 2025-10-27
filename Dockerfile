FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*

COPY . /usr/share/nginx/html

EXPOSE 8081

CMD ["nginx", "-g", "daemon off;"]

FROM nginx:1.13

LABEL maintainer "hyyyyde <hyyyyde@gmail.com>"

# 時刻はJST
RUN apt-get update \
    && ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# user追加
RUN usermod -u 1000 www-data

RUN mkdir -p /var/www/html/web

# confファイルをコピー
COPY 10-ltsv_format.conf /etc/nginx/conf.d/
COPY 20-host.conf /etc/nginx/conf.d/
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/

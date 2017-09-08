Docker nginx
===

nginxのDockerコンテナイメージ作成



## 前提

docker-composeが動作すること



## ビルド

```
sh docker-compose.sh
```



## php-fpmとの通信

unixソケットを使用しているので、php-fpm側もunixソケットを作成しておく必要があります。


### php-fpmのunixソケット設定

```www.conf
;listen = 127.0.0.1:9000
listen = /var/run/php-fpm/php-fpm.sock
listen.owner = www-data
listen.group = www-data
listen.mode = 0777
```



## 本コンテナのnginx設定を変更する場合

```docker-compose.yml
version: '2'
services:
  web:
    image: hyyyyde/nginx:1.0.0
    volumes:
      - nginx/20-hosts.conf:/etc/nginx/conf.d/20-hosts.conf
```

※上記の例では、ローカルに配置してある20-hosts.confをコンテナ内の20-hosts.confを上書きしています。

FROM nginxinc/nginx-unprivileged:1.27.2-alpine3.20

ADD default.conf /etc/nginx/conf.d/default.conf
COPY --from=postfixadmin:3.3.13-fpm-alpine --chown=nginx:nginx /usr/src/postfixadmin/public /usr/share/nginx/html/public

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

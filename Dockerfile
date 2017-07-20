FROM abiosoft/caddy

COPY Caddyfile /etc/Caddyfile
ADD _site /var/www/public

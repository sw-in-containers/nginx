FROM nginx:1.23.1-alpine

# create non-root user
RUN adduser -D -h /var/www/html shopware shopware

# fix user permissions
RUN chown -R shopware.shopware /var/log/nginx
RUN touch /run/nginx.pid && chown shopware.shopware /run/nginx.pid

# configure nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html
USER shopware

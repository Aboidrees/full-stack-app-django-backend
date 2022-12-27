FROM nginx:latest AS proxy

# RUN rm /etc/nginx/sites-enabled/default

COPY conf.d/ /etc/nginx/conf.d
FROM nginx:alpine 

# deploy specific nginx configuration file
COPY environments/nginx.conf /etc/nginx/nginx.conf
#COPY certs/server.crt /etc/nginx/certs/server.crt
#COPY certs/server.key /etc/nginx/certs/server.key
#COPY certs/zero-to-cloud-native_intermediate.pem /etc/nginx/certs/full-server.crt
#COPY site/index.html /etc/nginx/html/index.html
# support running as arbitrary user which belogs to the root group
# RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx
# output port set WORKDIR to appRUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
RUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
     && chgrp -R 0 /etc/nginx \
     && chmod -R g+rwX /etc/nginx \
     && rm /etc/nginx/conf.d/default.conf
COPY site /usr/share/nginx/html
EXPOSE 8080

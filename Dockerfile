FROM nginx

# INSTALL CERTBOT
RUN apt-get update && \
  apt-get -y install certbot && \
  apt-get -y install python3-certbot-nginx
  

# RUN SET UP SCRIPT
COPY conf_sample.txt /
COPY ./create_certs.sh /
RUN chmod u+x /create_certs.sh

# EXPOSE PORTS
EXPOSE 80 443


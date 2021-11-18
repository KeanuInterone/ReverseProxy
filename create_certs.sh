#!/bin/bash

conf_file=/etc/nginx/conf.d/${DOMAIN_NAME}.conf
cert_file=/etc/letsencrypt/live/${DOMAIN_NAME}/fullchain.pem

if [ -f "$cert_file" ]; then

    echo "Certs exist, no configuration needed"

else 

    sed "s/domain_name/${DOMAIN_NAME}/g" conf_sample.txt > $conf_file
    nginx -t && nginx -s reload
    certbot --noninteractive --nginx -d ${DOMAIN_NAME} --agree-tos --register-unsafely-without-email

fi




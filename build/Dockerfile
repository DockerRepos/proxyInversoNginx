FROM nginx:1.19.10
LABEL maintainer="cleon.form@gmail.com"

# SE COPIA LA CONFIGURACIÓN BÁSICA Y LA PÁGINA DE INICIO DE NGINX
COPY src/index.html /usr/share/nginx/html/index.html
COPY src/nginx.conf /etc/nginx/nginx.conf
COPY src/default.conf /etc/nginx/conf.d/default.conf

# SE COPIAN LOS SITES A LAS APLICACIONES
COPY src/available /app/sites/available/

#SE COPIAN CERTIFICADOS SSL AUTOGENERADOS
COPY src/certs/ /app/certs/

# SE GENERAN LOS ENLACES EN SITES-ENABLED
RUN mkdir /app/sites/enabled
RUN ln -sf /app/sites/available/covid.conf /app/sites/enabled/covid.conf && \
    ln -sf /app/sites/available/jenkins.conf /app/sites/enabled/jenkins.conf && \
    ln -sf /app/sites/available/phpmyadmin.conf /app/sites/enabled/phpmyadmin.conf

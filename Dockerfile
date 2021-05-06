FROM nginx:1.19.10
LABEL maintainer="cleon.form@gmail.com"

# SE COPIA LA CONFIGURACIÓN BÁSICA Y LA PÁGINA DE INICIO DE NGINX
COPY src/index.html /usr/share/nginx/html/index.html
COPY src/nginx.conf /etc/nginx/nginx.conf

# SE COPIAN LOS SITES A LAS APLICACIONES
COPY src/available /app/sites/available/

# SE GENERAN LOS ENLACES EN SITES-ENABLED
RUN mkdir /app/sites/enabled
RUN ln -s /app/sites/available/covid.conf /app/sites/enabled/covid.conf
RUN ln -s /app/sites/available/jenkins.conf /app/sites/enabled/jenkins.conf


Contenedor de nginx personalizado, para utilizar como proxy inverso
para el acceso a otros contenedores.

### CONSTRUIR LA IMAGEN DEL PROXY
Una vez clonado el proyecto, desde el path build/ ejecutar el siguiente comando:

`docker build -t <nombredelaimagen:tag> .`

Para construir la imagen deberemos incluir los certificados ssl nginx.key y nginx.pem en el path /build/src/certs. Si se modifica el nombre de los certificados hay que modificar el fichero default.conf

### LANZAR UN CONTENEDOR MANUALMENTE
Para lanzar el contenedor manualmente, ejecutar el siguiente comando:
`docker run --name proxy-inverso-nginx -p 80:80 --network="proxy" -d -v proxy-inverso:/app/sites/enabled nginx-proxy-inverso:4`

### USO DE DOCKER COMPOSE
Para lanzar el proxy con docker compose:
`docker-compose up -d`

### CREAR CERTIFICADOS AUTOFIRMADOS
Generar los certificados autofirmados con el comando

`# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.pem`

donde:
- req.: indica que se debe utilizar la gestión de solicitud de firma de certificado (CSR) X.509.
- -x509: informa a la utilidad que estamos creando un certificado autofirmado en lugar de generar una CSR.
- nodes: le dice a OpenSSL que no proteja el certificado con una frase de contraseña para que Nginx pueda leer el archivo.
- days 365: define la duración de la validez del certificado.
- newkey rsa: 2048: indica que vamos a generar una nueva clave y un nuevo certificado al mismo tiempo. Rsa: 2048 Indica al servicio que genere una clave RSA de 2048 bits.
- keyout: le dice a OpenSSL que guarde la clave privada que creada.
- out: le dice a OpenSSL dónde guardar el certificado creado.

Una vez generados los certificados, debemos incluir una copia de los mismos en el path build/src/certs antes de generar la imagen del proxy.

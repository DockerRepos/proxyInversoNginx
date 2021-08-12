Contenedor de nginx personalizado, para utilizar como proxy inverso
para el acceso a otros contenedores.


Para lanzar el contenedor manualmente, ejecutar el siguiente comando:
docker run --name proxy-inverso-nginx -p 80:80 --network="proxy" -d -v proxy-inverso:/app/sites/enabled nginx-proxy-inverso:4

## USO DE DOCKER COMPOSE
Para lanzar el proxy con docker compose:
- docker-compose up -d

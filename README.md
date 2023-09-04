# Guia de uso

## Requisitos

- Docker
- Docker Compose

## Uso

1. Clona este repositorio en tu máquina local:

   ```bash
   git clone https://github.com/loliconario69/docker-laravel_mysql.git

2. Accede al directorio del repositorio
   ```bash
   cd docker-laravel_mysql
3. Levantar los contenedores
   ```bash
   sudo docker compose up -d

4. Entrar en el contenedor de laravel
   ```bash
   sudo docker exec -it laravel bash

5. Crear un proyecto de laravel
   ```bash
   composer create-project laravel/laravel .

6. Asignar al usuario www-data(apache) a la carpeta storage
   ```bash
   chown -R www-data:www-data storage

7. listo, ahora salte del contenedor(ejecuta "exit") y accede por el navegador
   ```html
   localhost:8080/

---
Si ya tienes un proyecto de laravel solo realiza el paso 3

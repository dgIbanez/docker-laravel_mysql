# Guia de uso

## Requisitos

- Docker
- Docker Compose

## Esta imagen de docker automatiza:
```bash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
```

## Uso

### Si ya tienes un proyecto existente sige estos pasos
Es decir que ya ejecutaste:
```bash
composer install
cp .env.example .env
php artisan key:generate
```

1. Clona este repositorio en tu máquina local:

   ```bash
   git clone https://github.com/loliconario69/docker-laravel_mysql.git

2. Accede al directorio del repositorio
   ```bash
   cd docker-laravel_mysql

3. Mapear directorio del proyecto a /app en el docker compose
   ```yml
   ports:
      - '8080:80'
    volumes:
      - ./laravel-app:/app  <-- aquí
    depends_on:
      - mysql
   ```
4. Configurar credenciales de la base de datos en .env
   ```yml
   DB_CONNECTION=mysql
   DB_HOST=mysql
   DB_PORT=3306
   DB_DATABASE=laravel-db
   DB_USERNAME=root
   DB_PASSWORD=1234

5. Levantar los contenedores
   ```bash
   sudo docker compose up -d
   ```

6. Revisar si se realizaron las migraciones
   ```bash
   sudo docker log laravel
   ```
   Si tiene el error SQLSTATE[HY000] [2002] Connection refused ejecutar:
   ```bash
   sudo docker compose restart laravel
   sudo docker log laravel
   ```

7. Si te da problemas los permisos sobre los logs de laravel: Asignar al usuario apache a la carpeta storage
   ```bash
   chown -R apache:apache storage
   ```

---
### Si no tienes un proyecto existente sige estos pasos

1. Clonar repo (paso 1)

2. Acceder al directorio (paso 2)

3. Mapear carpeta donde quieres que se cree el proyecto (paso 3)

4. Levantar los contenedores
   ```bash
   sudo docker compose up -d
   ```

5. Acceder al contenedor laravel
   ```bash
   sudo docker exec -it laravel bash
   ```

6. Crear proyecto
   ```bash
   composer create-project laravel/laravel .
   ```
7. Asignar al usuario apache a la carpeta storage (dentro del contenedor)
   ```bash
   chown -R apache:apache storage
   ```
8. Ahora que ta tienes un proyecto sigue los pasos de "Si ya tienes un proyecto existente sige estos pasos"

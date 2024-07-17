1. Последовательно выполнить следующие команды:  
   `git clone git@github.com:Lexa64/laravel.git`  
   `cd laravel`  
   `git checkout 1-Docker`  
   `cp .env.example .env`  

2. На всякий случай проверить содержимое `.env` файла:  
   Параметр `DB_HOST` должен быть `mysql`, а не `127.0.0.1`  

3. Проверить ID пользователя хоста:  
   `id`  
   Пример результата: `uid=1000(alexey) gid=1000(alexey) группы=1000(alexey)...`.  
   Имя не имеет значения. Но если отличаются цифры, то изменить `USER_UID` в `Dockerfile`.  

4. Последовательно выполнить следующие команды:  
   `docker compose up -d --build`  
   `docker exec -it php /bin/sh`  
   `composer install`  
   `npm install`  
   `php artisan key:generate`  
   `php artisan migrate`  

5. Перейти на `http://localhost:8001/`  

В случае возникновения ошибки, связанной с правами, попробовать следующую команду:  
`chmod -R 777 storage`  

Также насчёт доступов можно попробовать такую:  
`find /var/www -type d -exec chmod 0775 '{}' \;`  

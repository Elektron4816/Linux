## Part 1. Готовый докер

##### Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`

- Устанавливаю сам docker `sudo apt install docker.io`
- Выкачиваю образ nginx `sudo docker pull nginx`<br>
![1](screenshots/1.png)

##### Проверить наличие докер образа через `docker images`

- Проверяю наличие образа `sudo docker images`<br>
![2](screenshots/2.png)

##### Запустить докер образ через `docker run -d [image_id|repository]`
##### Проверить, что образ запустился через `docker ps`

- Запускаю докер образ `sudo docker run -d nginx` и проверяю что он запущен
![3](screenshots/3.png)

##### Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`

- Просматриваю информацию о контейнере `sudo docker inspect b43c6641e465`
![4](screenshots/4.png)

##### По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера
- Размер контейнера<br>
![5](screenshots/5.png)

- Список замапленых портов<br>
![6](screenshots/7.png)

- ip контейнера<br>
![7](screenshots/8.png)

##### Остановить докер образ через `docker stop [container_id|container_name]`
##### Проверить, что образ остановился через `docker ps`

- Останавливаю докер образ `sudo docker stop b43c6641e465` и проверяю что он остановился
![9](screenshots/9.png)

##### Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*

- Запускаю докер с портами 80 и 443 `sudo docker run -d -p 80:80 -p 443:443 nginx`
![10](screenshots/10.png)

##### Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**

- Проверяю что стартовая страница nginx доступна.
![11](screenshots/11.png)
![12](screenshots/12.png)

##### Перезапустить докер контейнер через `docker restart [container_id|container_name]`
##### Проверить любым способом, что контейнер запустился

- Перезапускаю контейнер и проверяю что перезапустился
![13](screenshots/13.png)

## Part 2. Операции с контейнером


##### Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*

- Командой `sudo docker exec 12f5426f0b53 cat /etc/nginx/nginx.conf` просматриваю файл конфигурации.
![14](screenshots/14.png)

##### Создать на локальной машине файл *nginx.conf*
##### Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**

- Создаю файл nginx.conf, за основу взят имеющийся файл и добавляю отдачу статуса сервера nginx
![15](screenshots/15.png)

##### Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
##### Перезапустить **nginx** внутри докер образа через команду *exec*

- Копирую файл nginx.conf внутрь докера `sudo docker cp nginx.conf 12f5426f0b53:etc/nginx/` и перезапускаю nginx `sudo docker exec 12f5426f0b53 nginx -s reload`<br>
![16](screenshots/16.png)


##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**

![17](screenshots/17.png)
![18](screenshots/18.png)

##### Экспортировать контейнер в файл *container.tar* через команду *export*
##### Остановить контейнер
##### Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры

- Экспортирую контейнер `sudo docker export 12f5426f0b53 > container.tar`, останавливаю контейнер `sudo docker stop 12f5426f0b53` и удаляю образ nginx `sudo docker rmi nginx -f`<br>
![19](screenshots/19.png)

##### Удалить остановленный контейнер

- Удаляю остановленный контейнер `sudo docker `
![20](screenshots/20.png)

##### Импортировать контейнер обратно через команду *import*

- Импортирую мой контейнер
![21](screenshots/21.png)

##### Запустить импортированный контейнер

- Запукаю мой контейнер<br>
![22](screenshots/22.png)


##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**

- Проверяю что есть страничка со статусом сервера
![23](screenshots/23.png)
![24](screenshots/24.png)


## Part 3. Мини веб-сервер

##### Написать мини сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`

- Создаю файл server.c который будет возвращать надпись `Hello World!`<br>
![part3_12](03/screenshots/12.png)

##### Написать свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080*

- Задаю конфигурацию файла nginx.conf<br>
![part3_13](03/screenshots/13.png)

##### Запустить написанный мини сервер через *spawn-fcgi* на порту 8080

- Для запуска моего сервера делаю следующие шаги:<br>
- - Запускаю контейнер **nginx** c 81 портом
![part3_1](03/screenshots/1.png)

- - копирую в контейнер **server.c** и **nginix.conf**<br>
![part3_2](03/screenshots/2.png)

- - Захожу в контейнер и проверяю что файлы перенесены<br>
![part3_3](03/screenshots/3.png)
![part3_4](03/screenshots/4.png)

- - Обновляю и устанавливаю **gcc**, **spawn-fcgi** и **libfcgi-dev**<br>
![part3_5](03/screenshots/5.png)
![part3_6](03/screenshots/6.png)
![part3_7](03/screenshots/7.png)

- - Компилирую `gcc server.c -lfcgi` и запускаю сервер `spawn-fcgi -p 8080 ./a.out`, перезагружаю контейнер <br>
![part3_9](03/screenshots/9.png)

##### Проверить, что в браузере по *localhost:81* отдается написанная вами страничка

- - Проверяю что всё работает
![part3_10](03/screenshots/10.png)
![part3_11](03/screenshots/11.png)


## Part 4. Свой докер

#### Написать свой докер образ, который:
##### 1) собирает исходники мини сервера на FastCgi из [Части 3](#part-3-мини-веб-сервер)
##### 2) запускает его на 8080 порту
##### 3) копирует внутрь образа написанный *./nginx/nginx.conf*
##### 4) запускает **nginx**.

- Создаю свой Dockerfile<br>
![part4_1](04/screenshots/10.png)

##### Собрать написанный докер образ через `docker build` при этом указав имя и тег

- Собираю свой докер<br>
![part4_2](04/screenshots/1.png)

##### Проверить через `docker images`, что все собралось корректно

- Проверяю что сборка успешна<br>
![part4_2](04/screenshots/2.png)

##### Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки *./nginx* внутрь контейнера по адресу, где лежат конфигурационные файлы **nginx**'а (см. [Часть 2](#part-2-операции-с-контейнером))

- Запускаю<br>
![part4_2](04/screenshots/3.png)


##### Проверить, что по localhost:80 доступна страничка написанного мини сервера

- Смотрю что по localhost доступна страничка с сервером<br>
![part4_2](04/screenshots/5.png)

##### Дописать в *./nginx/nginx.conf* проксирование странички */status*, по которой надо отдавать статус сервера **nginx**

- Дописываю конфиг по которому будет отображаться статус<br>
![part4_2](04/screenshots/6.png)

##### Перезапустить докер образ

- Захожу в контейнер и перезапускаю его<br>
![part4_2](04/screenshots/7.png)

##### Проверить, что теперь по *localhost:80/status* отдается страничка со статусом **nginx**

-  Проверяю что по localhost:80/status отображается страничка со статусом<br>
![part4_2](04/screenshots/8.png)


## Part 5. **Dockle**

-  Скачиваю и устанавливаю Dockle<br>
![part4_2](05/screenshots/1.png)

##### Просканировать образ из предыдущего задания через `dockle [image_id|repository]`

- Запускаю утилиту dockle<br>
![part4_2](05/screenshots/2.png)

##### Исправить образ так, чтобы при проверке через **dockle** не было ошибок и предупреждений

- Доаполняю свой docker исправляя ошибки Fatal и Warning<br>
![part4_2](05/screenshots/4.png)

- Снова запускаю dockle и остались только Info<br>
![part4_2](05/screenshots/3.png)

## Part 6. Базовый **Docker Compose**

##### Написать файл *docker-compose.yml*, с помощью которого:
##### 1) Поднять докер контейнер из [Части 5](#part-5-инструмент-dockle) _(он должен работать в локальной сети, т.е. не нужно использовать инструкцию **EXPOSE** и мапить порты на локальную машину)_
##### 2) Поднять докер контейнер с **nginx**, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

- Создаю файл **docker-composee.yml**<br>
![part4_2](06/screenshots/2.png)

##### Замапить 8080 порт второго контейнера на 80 порт локальной машины

- Меняю файл конфигурации<br>
![part4_2](06/screenshots/1.png)

##### Остановить все запущенные контейнеры

- Смотрю что запущенных контейнеров нет<br>
![part4_2](06/screenshots/5.png)

##### Собрать и запустить проект с помощью команд `docker-compose build` и `docker-compose up`

- Командой `docker-compose build` собираются образы и командой `docker-compose up` запускаются контейнеры<br>
![part4_2](06/screenshots/4.png)

##### Проверить, что в браузере по *localhost:80* отдается написанная вами страничка, как и ранее

- Всё работает<br>
![part4_2](06/screenshots/3.png)
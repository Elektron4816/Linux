## Установка и настройка Prometheus

- Для установки последней версии Prometheus скачиваем архив вручную.<br>
`wget https://github.com/prometheus/prometheus/releases/download/v2.48.0-rc.0/prometheus-2.48.0-rc.0.linux-amd64.tar.gz`

- Распаковываю<br>
`tar -xvzf prometheus-2.48.0-rc.0.linux-amd64.tar.gz prometheus-2.48.0-rc.0.linux-amd64/`

- Копирую исполняемые файлы и копируюю файлы конфигурации.<br>
`cd prometheus-2.20.1.linux-amd64/`<br>
`cp prometheus /usr/local/bin/`<br>
`cp promtool /usr/local/bin/`<br>
`cp -r consoles/ /etc/prometheus/consoles/`<br>
`cp -r console_libraries/ /etc/prometheus/console_libraries/`<br>
`cp prometheus.yml /etc/prometheus/`

- Создайю папку для хранения данных:<br>
`mkdir /var/lib/prometheus`

- Создайте пользователя и назначьте владельца файлов и папок:<br>
`useradd -M -r -s /bin/nologin prometheus`<br>
`chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus`

- Меняю файл конфига prometheus.
![prometheus](screenshots/3.png)

- Запускаю prometheus

`systemctl daemon-reload`<br>
`systemctl start prometheus.service`<br>
`systemctl enable prometheus.service`<br>

![prometheus](screenshots/2.png)

- Теперь можно получить доступ к веб-интерйесу использовав localhost:9090.
![prometheus](screenshots/4.png)

- Для того чтобы Prometheus мог собирать данные с целевых объектов, надо установить **node_exporter**.

- Скачиваю архив<br> 
`wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz`

- Распаковываю <br>
`tar -xvzf node_exporter-1.6.1.linux-amd64.tar.gz node_exporter-1.6.1.linux-amd64/`

- Копирую содержимое распакованного архива в папку /usr/local/bin:<br>
`cp node_exporter-1.6.1.linux-amd64/node_exporter /usr/local/bin`
- Изменяю владельца созданных файлов:<br>
`chown -R prometheus:prometheus /usr/local/bin/node_exporter`

- Создайтю сценарий запуска systemd сервиса node_exporter
![node](screenshots/5.png)

- Запускаю node_exporter:<br>
`systemctl daemon-reload`<br>
`systemctl start node_exporter.service`<br>
`systemctl enable node_exporter.service`<br>
`systemctl status node_exporter.service`
![node](screenshots/6.png)

- Для получения данных node_exporter добавляем конфигурацию в prometheus.yml
![node](screenshots/13.png)

- Перезапускаю prometheus и прверяю<br>
`systemctl reload prometheus.service`
![node](screenshots/14.png)
- node_exporter доступен по localhost:9100
![node](screenshots/15.png)

## Установка и настройка Grafana

- Скачиваю `grafana-enterprise_10.2.0_amd64.deb`
- Устанавливаю `dpkg -i grafana-enterprise_10.2.0_amd64.deb`
- Запускаю garfana<br>
`systemctl start grafana-server.service`<br>
`systemctl enable grafana-server.service`<br>
`systemctl status grafana-server.service`
![grafana](screenshots/7.png)

- Grafana доступен по `localhost:3000`
![grafana](screenshots/8.png)

- Добавляю на дашборд необходимую информацию
![grafana](screenshots/10.png)

- Запускаю скрипт из 2 задания
![grafana](screenshots/11.png)

- Устанавливаю утилиту stress<br>
`sudo apt install stress`
и запускаю команду `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`
- результат в grafana
![grafana](screenshots/12.png)

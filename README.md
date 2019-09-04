# docker-zabbix-server-arm64
zabbix-server(mysql) docker-compose file for arm64  
tested with jetson nano / Raspberry Pi 3B (Ubuntu 18.04LTS(arm64))

## before start 

```sh
docker-compose exec db bash

$ mysql -uroot -ppassword

// use password defined in env_db
mysql> create user 'root'@'%' IDENTIFIED BY 'password'; 
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
mysql> quit
```

## load DB

Load zabbix initial database schemas/tables/data or restore existing zabbix db.

## and then

docker-compose up

## notes

zabbix-agent in docker-host needs to set docker IP address.
`Server=` `ServerActive=` in /etc/zabbix/zabbix-agent.conf

### example

host ip = 192.168.0.100 , docker-container ip = 172.16.0.1

```zabbix-agent.conf at docker-host
Server=172.16.0.1,192.168.0.100
ServerActive=172.16.0.1,192.168.0.100
```

```zabbix-agent.conf at other-host
Server=192.168.0.100
ServerActive=192.168.0.100
```

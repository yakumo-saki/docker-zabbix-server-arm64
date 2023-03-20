# deprecated

zabbix official docker images are released.
this repository is end of its role

# docker-zabbix-server-arm64

zabbix-server(mysql) docker-compose file for arm64  
tested with jetson nano / Raspberry Pi 3B (Ubuntu 18.04LTS(arm64))

attention. zabbix says zabbix on docker is  
"under development, not ready for production"    
https://github.com/zabbix/zabbix-docker

## getting started 

### load DB

Load zabbix initial database schemas/tables/data or restore existing zabbix db.

### and then

`docker-compose up`

## notes

### mysql initial db creation
mysql container creates db when first container start.  
wait for a while.

### how to connect mysql db

```sh
docker-compose exec db bash

$ mysql -uroot -ppassword
```

### config example

zabbix-agent in docker-host needs to set docker IP address.
`Server=` `ServerActive=` in /etc/zabbix/zabbix-agent.conf  

host ip = 192.168.0.100 , docker-container ip = 172.16.0.1

```zabbix-agent.conf at docker-host
Server=172.16.0.1,192.168.0.100
ServerActive=172.16.0.1,192.168.0.100
```

```zabbix-agent.conf at other-host
Server=192.168.0.100
ServerActive=192.168.0.100
```

### env_server is empty

Yes, thats ok. and you can set zabbix-server specified environment values.   
usable env values see: https://github.com/zabbix/zabbix-docker/blob/4.2/.env_srv

### performance tuning

Change `my.cnf` to tune mysql parameters.

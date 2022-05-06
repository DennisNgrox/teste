
#!/bin/bash

ZABBIX_USER="Admin"
ZABBIX_PASS="zabbix"
ZABBIX_API="http://192.168.126.139/api_jsonrpc.php"

ZABBIX_AUTH_TOKEN=$(curl -s -H  'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"user.login\",\"params\":{\"user\":\""${ZABBIX_USER}"\",\"password\":\""${ZABBIX_PASS}"\"},\"auth\": null,\"id\":0}" $ZABBIX_API |  jq -r .result)

curl -s -H  'Content-Type: application/json-rpc' -d "

{
    \"jsonrpc\": \"2.0\",
    \"method\": \"trigger.get\",
    \"params\": {
        \"triggerids\": \"20100\",
        \"output\": \"extend\",
        \"selectFunctions\": \"extend\"
    },
    \"auth\": \"${ZABBIX_AUTH_TOKEN}\",
    \"id\": 1
}" ${ZABBIX_API}

in/bash

ZABBIX_USER="Admin"
ZABBIX_PASS="zabbix"
ZABBIX_API="http://192.168.126.139/api_jsonrpc.php"

ZABBIX_AUTH_TOKEN=$(curl -s -H  'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"user.login\",\"params\":{\"user\":\""${ZABBIX_USER}"\",\"password\":\""${ZABBIX_PASS}"\"},\"auth\": null,\"id\":0}" $ZABBIX_API |  jq -r .result)

curl -s -H  'Content-Type: application/json-rpc' -d "

{
    \"jsonrpc\": \"2.0\",
    \"method\": \"trigger.update\",
    \"params\": {
        \"triggerid\": \"20122\",
       \"type\": \"0\"

    },
    \"auth\": \"${ZABBIX_AUTH_TOKEN}\",
    \"id\": 1
}" ${ZABBIX_API}



-------------------------------------------------------------

#!/bin/bash

ZABBIX_USER="Admin"
ZABBIX_PASS="zabbix"
ZABBIX_API="http://192.168.126.139/api_jsonrpc.php"

ZABBIX_AUTH_TOKEN=$(curl -s -H  'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"user.login\",\"params\":{\"user\":\""${ZABBIX_USER}"\",\"password\":\""${ZABBIX_PASS}"\"},\"auth\": null,\"id\":0}" $ZABBIX_API |  jq -r .result)

curl -s -H  'Content-Type: application/json-rpc' -d "

{
    \"jsonrpc\": \"2.0\",
    \"method\": \"template.get\",
    \"params\": {
        \"groupids\": \"10\",
        
    },
    \"auth\": \"${ZABBIX_AUTH_TOKEN}\",
    \"id\": 1
}" ${ZABBIX_API}

---------------------------------

for i in $(cat lista.txt) ; do  SERVICE=$(echo $i | cut -d\; -f1); ./item.sh $SERVICE; done

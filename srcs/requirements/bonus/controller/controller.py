import os
import sys
from time import sleep as wait
import requests
import keys as keys


## ping every container to check if they are alive and sends a telegram message if not
CONTAINERS = ['redis', 'wordpress', 'mariadb', 'nginx']

while True :
	for container in CONTAINERS :
		if os.system('ping -c 1 ' + container + ' > /dev/null') != 0 :
			requests.get('https://api.telegram.org/bot' + keys.api_token + '/sendMessage?chat_id=' + keys.chat_id + '&text=' + container + ' is down')
			print(container + ' is down')
			sys.exit(0)
	wait(5)



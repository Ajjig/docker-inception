ls '/etc/ssl/certs/nginx.crt' &> /dev/null

if [ $? == '0' ]

then
	echo "Certificate already existed"
	exit 0	
fi

echo "Generating key..."

openssl req -newkey rsa:2048 -keyout '/etc/ssl/private/nginx.key' -nodes -x509 -days 365 -out '/etc/ssl/certs/nginx.crt' -subj "/C=MA/ST=BeniMellal-Khenifra/L=Khouribga/O=1337/OU=1337/CN=majjig.42.fr"

echo "Key generated successfully"

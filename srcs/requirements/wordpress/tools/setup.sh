sed "s/\/run\/php\/php7.3-fpm.sock/9000" --in-place "/etc/php/7.3/fpm/pool.d/www.conf"

ls /var/www/html/wp-config.php &> /dev/null

if [ $? ] ; then
	wp core download --path=/var/www/html --allow-root
	wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb --path=/var/www/html --allow-root --skip-check
	wp core install --url=$DOMAIN_NAME --title=wordpress --admin_user=$DB_ADMINISTRATOR --admin_password=$DB_ADMINISTRATOR_PASSWORD --admin_email=$DB_ADMINISTRATOR_EMAIL --allow-root --path=/var/www/html
	wp user create $WP_USER_NAME $WP_EMAIL --user_pass=$WP_USER_PASS --allow-root --path=/var/www/html
fi

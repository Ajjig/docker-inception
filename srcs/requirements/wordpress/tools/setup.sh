sed "s/\/run\/php\/php7.3-fpm.sock/9000/" --in-place "/etc/php/7.3/fpm/pool.d/www.conf"

chown -R www-data:www-data ${WP_INSTALLATION_PATH}/* &> /dev/null

if [ ! -f ${WP_INSTALLATION_PATH}/wp-config.php ] ; then
	wp core download --path=${WP_INSTALLATION_PATH} --allow-root
	wp config create --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USER} \
		--dbpass=${MARIADB_PASSWORD} --dbhost=mariadb \
		--path=${WP_INSTALLATION_PATH} --allow-root --skip-check
	wp core install --url=${DOMAIN_NAME} --title=wordpress --admin_user=${DB_ADMINISTRATOR} \
		--admin_password=${DB_ADMINISTRATOR_PASSWORD} --admin_email=${DB_ADMINISTRATOR_EMAIL} \
		--allow-root --path=${WP_INSTALLATION_PATH}
	wp user create ${WP_USER_NAME} ${WP_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root --path=${WP_INSTALLATION_PATH}
fi

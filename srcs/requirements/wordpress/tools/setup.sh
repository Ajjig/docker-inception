# sed "s/\/run\/php\/php7.3-fpm.sock/9000/" --in-place /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p ${WP_INSTALLATION_PATH}

mkdir -p /run/php/;

chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*

touch /run/php/php7.3-fpm.pid;


if [ ! -f ${WP_INSTALLATION_PATH}/wp-config.php ] ; then

	mkdir -p ${WP_INSTALLATION_PATH}

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp && chmod 755 /usr/local/bin/wp

	wp core download --path=${WP_INSTALLATION_PATH} --allow-root

	wp config create --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USER} \
		--dbpass=${MARIADB_PASSWORD} --dbhost=mariadb \
		--path=${WP_INSTALLATION_PATH} --allow-root --skip-check

	wp core install --url=${DOMAIN_NAME} --title=wordpress --admin_user=${WP_ADMINISTRATOR} \
		--admin_password=${WP_ADMINISTRATOR_PASSWORD} --admin_email=${WP_ADMINISTRATOR_EMAIL} \
		--allow-root --path=${WP_INSTALLATION_PATH}

	wp user create ${WP_USER_NAME} ${WP_EMAIL} --user_pass=${WP_USER_PASSWORD} --allow-root --path=${WP_INSTALLATION_PATH}

	# redis config, host port...
	wp config set WP_CACHE true --allow-root --path=${WP_INSTALLATION_PATH}
	wp config set WP_REDIS_HOST redis --allow-root --path=${WP_INSTALLATION_PATH}
	wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=${WP_INSTALLATION_PATH}
	wp config set WP_CACHE_KEY_SALT ${DOMAIN_NAME} --allow-root --path=${WP_INSTALLATION_PATH}

	# installing redis
	wp plugin install redis-cache --activate --allow-root --path=${WP_INSTALLATION_PATH}

	# update plugins
	wp plugin update --all --allow-root --path=${WP_INSTALLATION_PATH}
	wp plugin activate redis-cache --allow-root --path=${WP_INSTALLATION_PATH}

	# enabling redis
	wp redis enable --force --allow-root --path=${WP_INSTALLATION_PATH}
fi

exec "$@"

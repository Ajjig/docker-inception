CREATE DATABASE IF NOT EXISTS wpdb ;
CREATE USER IF NOT EXISTS 'majjig'@'localhost' IDENTIFIED BY 'majjig' ;
GRANT ALL PRIVILEGES ON wpdb.* TO 'majjig'@'localhost' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'the-su-majjig' ;
FLUSH PRIVILEGES ;

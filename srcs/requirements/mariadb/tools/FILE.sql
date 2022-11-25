CREATE DATABASE IF NOT EXISTS wpdb ;
CREATE USER IF NOT EXISTS 'majjig'@'localhost' IDENTIFIED BY 'majjig@@A1' ;
GRANT ALL PRIVILEGES ON wpdb.* TO 'majjig'@'localhost' ;
FLUSH PRIVILEGES ;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'the-su-majjig@@A1' ;

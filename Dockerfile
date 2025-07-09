FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

#---Installing the Packages--#
RUN apt-get update && apt-get install -y \
    apache2 mysql-server libapache2-mod-php php php-mysql php-gd php-xml \
    php-mbstring php-curl php-zip php-intl php-bcmath php-gmp php-imagick php-cli \
    unzip curl php-apcu php-redis redis-server ufw

#--Creating Nextcloud DB--#
RUN service mysql start \
    && mysql -e "CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;" \
    && mysql -e "CREATE USER IF NOT EXISTS 'nextclouduser'@'localhost' IDENTIFIED BY 'strong_password_here';" \
    && mysql -e "GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextclouduser'@'localhost';" \
    && mysql -e "FLUSH PRIVILEGES;"

#--Download and Setup Nextcloud--#
WORKDIR /var/www
RUN curl -LO https://download.nextcloud.com/server/releases/latest.zip \
    && unzip latest.zip \
    && chown -R www-data:www-data nextcloud \
    && chmod -R 755 nextcloud \
    && rm latest.zip

#--Configure Apache--#
COPY nextcloud.conf /etc/apache2/sites-available/nextcloud.conf
RUN a2dissite 000-default.conf && a2ensite nextcloud.conf && a2enmod rewrite headers env dir mime 
    

COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 80

CMD ["/start.sh"]
   

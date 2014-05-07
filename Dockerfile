FROM ubuntu

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server

ENV MYSQL_USER admin
ENV MYSQL_PASS password

# Add image configuration and scripts
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD create_admin.sh /create_admin.sh
RUN /create_admin.sh
RUN chmod 755 /*.sh

EXPOSE 3306

ENTRYPOINT mysqld_safe

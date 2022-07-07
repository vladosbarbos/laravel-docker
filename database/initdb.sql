create user 'demo'@'%' identified by '4757';
grant all privileges on *.* to 'demo'@'%' with grant option;
create database demo character set utf8 collate utf8_general_ci;
INSTALL SONAME 'ha_spider';

CREATE DATABASE IF NOT EXISTS `sample`;

USE `sample`;

CREATE TABLE `customers` (
    `id` INT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `email` VARCHAR(50),
    `gender` VARCHAR(50),
    `ip_address` VARCHAR(20)
) ENGINE=SPIDER COMMENT 'host "xpd1", user "spider", password "fak3Pa$$", port "3306"';

CREATE TABLE `customers_archive` (
    `id` INT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `email` VARCHAR(50),
    `gender` VARCHAR(50),
    `ip_address` VARCHAR(20)
) ENGINE=COLUMNSTORE;

INSERT INTO `customers_archive` SELECT * FROM `customers`;

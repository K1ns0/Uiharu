DROP DATABASE IF EXISTS `uiharu`;

CREATE DATABASE `uiharu` DEFAULT CHARACTER SET utf8 collate utf8_general_ci;

use `uiharu`;

CREATE TABLE `project` (
  `uid` VARCHAR(32) NOT NULL,
  `name` VARCHAR(200) NULL,
  `target` VARCHAR(200) NULL,
  `desc` VARCHAR(4096) NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vuln` (
  `uid` VARCHAR(32) NOT NULL,
  -- project id
  `pid` VARCHAR(32) NOT NULL,
  `name` VARCHAR(100) NULL,
  -- xss / weak pwd / xxx
  `vtype` VARCHAR(50) NOT NULL,
  `desc` VARCHAR(1024) NULL,
  `created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `domain` (
  `uid` VARCHAR(32) NOT NULL,
  -- project id
  `pid` VARCHAR(32) NOT NULL,
  `domain` VARCHAR(200) NULL,
  `ips` VARCHAR(200) NULL,
  `desc` VARCHAR(1024) NULL,
  `created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
);

CREATE TABLE `ip` (
  `uid` VARCHAR(32) NOT NULL,
  -- project id
  `pid` VARCHAR(32) NOT NULL,
  `ip` VARCHAR(200) NULL,
  `desc` VARCHAR(1024) NULL,
  `created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
);

-- web site / mysql / xxx
CREATE TABLE `application` (
  `uid` VARCHAR(32) NOT NULL,
  -- project id
  `pid` VARCHAR(32) NOT NULL,
  -- 8.8.8.8:80 http
  `data` VARCHAR(100) NULL,
  `desc` VARCHAR(1024) NULL,
  `created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
);

CREATE USER IF NOT EXISTS 'uiharu'@'localhost' IDENTIFIED BY 'random_password';
GRANT all privileges ON uiharu.* TO 'uiharu'@'localhost';

CREATE USER IF NOT EXISTS 'backup'@'localhost' IDENTIFIED BY 'another_random_password';
GRANT SELECT ON uiharu.* TO 'backup'@'localhost';

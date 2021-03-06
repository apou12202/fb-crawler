-- MySQL Script generated by MySQL Workbench
-- Mon Apr 15 22:58:26 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema fb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fb` DEFAULT CHARACTER SET utf8 ;
USE `fb` ;

-- -----------------------------------------------------
-- Table `fb`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`class` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `type` SMALLINT(6) NULL DEFAULT NULL,
  `cname` VARCHAR(255) NULL DEFAULT '',
  `edes` VARCHAR(255) NULL DEFAULT '',
  `cdes` VARCHAR(255) NULL DEFAULT '',
  `nlevel` SMALLINT(6) NULL DEFAULT NULL,
  `ename` VARCHAR(255) NULL DEFAULT '',
  `idpath` VARCHAR(255) NULL DEFAULT NULL,
  `namepath` TEXT NULL DEFAULT NULL,
  `since` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modifydt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `keywords` VARCHAR(255) NULL DEFAULT '',
  PRIMARY KEY USING BTREE (`id`),
  INDEX `cid` USING BTREE (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`location` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `update_time` DATETIME NOT NULL COMMENT '最後更新',
  `name` VARCHAR(45) NOT NULL COMMENT '名稱',
  `zip_code` INT(11) NULL DEFAULT NULL COMMENT '郵區編號',
  `location_id` INT(11) NULL DEFAULT NULL COMMENT '父層',
  `type` VARCHAR(20) NOT NULL COMMENT '類型(town or city)',
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_location_location1_idx` USING BTREE (`location_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1030
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbpage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbpage` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fbid` VARCHAR(50) NULL DEFAULT NULL,
  `cname` VARCHAR(100) NULL DEFAULT NULL,
  `ename` VARCHAR(100) NULL DEFAULT NULL,
  `lat` VARCHAR(255) NULL DEFAULT NULL,
  `lng` VARCHAR(255) NULL DEFAULT NULL,
  `likes` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `keyword` VARCHAR(45) NULL DEFAULT NULL,
  `rank` VARCHAR(45) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `since` TIMESTAMP NULL DEFAULT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `is_office` TINYINT(1) NULL DEFAULT NULL,
  `location_id` INT(11) NULL DEFAULT NULL,
  `url` VARCHAR(500) NULL,
  `offical_url` VARCHAR(500) NULL,
  `Is_blue_verification_badge` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fbpage_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_fbpage_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `fb`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbgroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbgroup` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fbid` VARCHAR(50) NULL DEFAULT NULL,
  `cname` VARCHAR(100) NULL DEFAULT NULL,
  `ename` VARCHAR(45) NULL DEFAULT NULL,
  `keyword` VARCHAR(200) NULL DEFAULT NULL COMMENT '\'關鍵字\'',
  `number` VARCHAR(45) NULL DEFAULT NULL COMMENT '有多少名成員',
  `since` DATETIME NULL DEFAULT NULL COMMENT '群組創立日期',
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`co`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`co` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `class_id` INT(11) NOT NULL,
  `fbpage_id` INT(11) NULL,
  `fbgroup_id` INT(11) NULL,
  `rank` SMALLINT(6) NULL DEFAULT NULL,
  `mg` SMALLINT(6) NULL DEFAULT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL COMMENT '0: 讚好',
  INDEX `cid` USING BTREE (`class_id`),
  INDEX `fk_co_fbpage1_idx` USING BTREE (`fbpage_id`),
  PRIMARY KEY (`id`),
  INDEX `fk_co_fbgroup1_idx` (`fbgroup_id` ASC),
  CONSTRAINT `cid`
    FOREIGN KEY (`class_id`)
    REFERENCES `fb`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_co_fbpage1`
    FOREIGN KEY (`fbpage_id`)
    REFERENCES `fb`.`fbpage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_co_fbgroup1`
    FOREIGN KEY (`fbgroup_id`)
    REFERENCES `fb`.`fbgroup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbuser` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `fbid` VARCHAR(50) NULL DEFAULT NULL,
  `valid` TINYINT(4) NULL DEFAULT '0',
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `status` SMALLINT(6) NULL DEFAULT NULL,
  `mobile` VARCHAR(25) NULL DEFAULT NULL,
  `gender` TINYINT(4) NULL DEFAULT NULL,
  `hometown` VARCHAR(200) NULL DEFAULT NULL,
  `relationship` VARCHAR(100) NULL DEFAULT NULL,
  `birthday` VARCHAR(20) NULL DEFAULT NULL,
  `description` VARCHAR(400) NULL DEFAULT NULL,
  `picurl` VARCHAR(200) NULL DEFAULT NULL,
  `ename` VARCHAR(100) NULL DEFAULT NULL,
  `cname` VARCHAR(100) NULL DEFAULT NULL,
  `bloodtype` VARCHAR(45) NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `current_city` VARCHAR(45) NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `fbid_UNIQUE` (`fbid` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 530
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbuser_ext`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbuser_ext` (
  `id` INT(30) NOT NULL AUTO_INCREMENT,
  `fbuser_id` INT(30) NOT NULL,
  `fbid` VARCHAR(45) NULL DEFAULT NULL,
  `permission` TINYINT(4) NULL DEFAULT '0',
  `homephone` VARCHAR(25) NULL DEFAULT NULL,
  `language` VARCHAR(100) NULL DEFAULT NULL,
  `religious` VARCHAR(100) NULL DEFAULT NULL,
  `website` VARCHAR(100) NULL DEFAULT NULL,
  `other_account` VARCHAR(100) NULL DEFAULT NULL,
  `political_view` VARCHAR(100) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `other` VARCHAR(255) NULL DEFAULT NULL,
  `family` VARCHAR(255) NULL DEFAULT NULL,
  `quotes` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `fbid_UNIQUE` (`fbid` ASC),
  INDEX `fk_fbuser_ext_fbuser1_idx` (`fbuser_id` ASC),
  UNIQUE INDEX `fbuser_id_UNIQUE` (`fbuser_id` ASC),
  CONSTRAINT `fk_fbuser_ext_fbuser1`
    FOREIGN KEY (`fbuser_id`)
    REFERENCES `fb`.`fbuser` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 530
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbuser_has_fbgroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbuser_has_fbgroup` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fbgroup_id` INT(11) NOT NULL,
  `fbuser_id` INT(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fbuser_has_fbgroup_fbgroup1_idx` USING BTREE (`fbgroup_id`),
  INDEX `fk_fbuser_has_fbgroup_fbuser1_idx` (`fbuser_id` ASC),
  CONSTRAINT `fk_fbuser_has_fbgroup_fbgroup1`
    FOREIGN KEY (`fbgroup_id`)
    REFERENCES `fb`.`fbgroup` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_fbuser_has_fbgroup_fbuser1`
    FOREIGN KEY (`fbuser_id`)
    REFERENCES `fb`.`fbuser` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`fbuser_has_fbpage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`fbuser_has_fbpage` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fbuser_id` INT(30) NOT NULL,
  `fbpage_id` INT(11) NOT NULL,
  `type` VARCHAR(45) NULL DEFAULT NULL,
  `ctype` VARCHAR(45) NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `begin` DATE NULL,
  `end` DATE NULL,
  `postion` VARCHAR(150) NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_fbuser_has_fbpage_fbpage1_idx` USING BTREE (`fbpage_id`),
  INDEX `fk_fbuser_has_fbpage_fbuser1_idx` (`fbuser_id` ASC),
  CONSTRAINT `fk_fbuser_has_fbpage_fbpage1`
    FOREIGN KEY (`fbpage_id`)
    REFERENCES `fb`.`fbpage` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fbuser_has_fbpage_fbuser1`
    FOREIGN KEY (`fbuser_id`)
    REFERENCES `fb`.`fbuser` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;


-- -----------------------------------------------------
-- Table `fb`.`inheritance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`inheritance` (
  `ccid` INT(11) NOT NULL,
  `pcid` INT(11) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `rank` INT NULL,
  `mg` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_class_has_class_class2_idx` (`pcid` ASC),
  INDEX `fk_class_has_class_class1_idx` (`ccid` ASC),
  CONSTRAINT `fk_class_has_class_class1`
    FOREIGN KEY (`ccid`)
    REFERENCES `fb`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_class_has_class_class2`
    FOREIGN KEY (`pcid`)
    REFERENCES `fb`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `fb`.`work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fb`.`work` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `desc` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `fbpage_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fbuser_fbpage` USING BTREE (`fbpage_id`),
  CONSTRAINT `fk_work_fbpage_1`
    FOREIGN KEY (`fbpage_id`)
    REFERENCES `fb`.`fbpage` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
ROW_FORMAT = DYNAMIC;

USE `fb` ;

-- -----------------------------------------------------
-- procedure _add_fbpage
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `_add_fbpage`(
in _fbid varchar(100),
in _name varchar(100),
out _fbpage_pk int
)
main:BEGIN
 	if EXISTS (select 1 from fbpage where fbid = _fbid limit 1) then 
		  select  id into _fbpage_pk from fbpage where fbid = _fbid limit 1 ;
 			LEAVE main;
	else
		INSERT into fbpage(fbid,cname) VALUES (_fbid,_name);
		set _fbpage_pk =  LAST_INSERT_ID();
	end if;

END main$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_fbpage
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `add_fbpage`(_fbid varchar(100),_name varchar(100))
main:BEGIN
	#Routine body goes here.../
	declare _fbgourp_id int;
	declare _fbuser_id int;
	

 	if EXISTS (select 1 from fbpage where fbid = _fbid limit 1) then 
		  select id from fbpage where fbid = _fbid limit 1 ;
 			LEAVE main;
 		end if;

	INSERT into fbpage(fbid,cname) VALUES (_fbid,_name);
	SELECT LAST_INSERT_ID();
	

END main$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_fbuser
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `add_fbuser`(
	IN `_name` varchar(100),
	IN `_fbid` varchar(100)
# 	out valido INT(11)
)
main:BEGIN
	#Routine body goes here.../
	declare _fbgourp_id int;
	declare _fbuser_id int;


 	if EXISTS (select 1 from fbuser where fbid = _fbid limit 1) then 
 			LEAVE main;
 		end if;

	INSERT into fbuser(fbid,cname) VALUES (_fbid,_name);
	INSERT into fbuser_ext(fbid) VALUES (_fbid);


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_fbuser_has_fbgroup
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `add_fbuser_has_fbgroup`(_groupname varchar(100),_groupid varchar(100),_fbuser_cname varchar(100),_fbuser_fbid varchar(100))
main:BEGIN
	#Routine body goes here.../
	#未做好同group name 的準情況/也未做好有多個同名group的情怳
	declare _fbgourp_id int;
	declare _fbuser_id int;

	# 選取_fbgourp_id
 	if EXISTS (select 1 from fbgroup where fbid = _groupid  limit 1) then 
 		SELECT id into _fbgourp_id FROM fbgroup where fbid = _groupid  limit 1;
	 ELSE
		INSERT into fbgroup (cname,fbid,create_time,last_update) VALUES (_groupname , _groupid,NOW(),NOW());
		set _fbgourp_id =  LAST_INSERT_ID();
	end if;

	call add_fbuser(_fbuser_cname ,_fbuser_fbid);
	SELECT id into _fbuser_id FROM fbuser where fbid = _fbuser_fbid   limit 1;
	
 	if EXISTS (select 1 from fbuser_has_fbgroup where fbuser_id = _fbuser_id and fbgroup_id = _fbgourp_id  limit 1) then 
 			LEAVE main;
	ELSE
		INSERT into fbuser_has_fbgroup (fbuser_id,fbgroup_id) VALUES (_fbuser_id,_fbgourp_id);
	end if;

END main$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_info
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `add_info`(
in _fbid varchar(100),
in _name varchar(100),
in _type VARCHAR(100),
in _desc VARCHAR(100)
)
main:BEGIN
	#Routine body goes here.../

	declare _fbpage_pk int;

-- 没有_fbid ,為非官方粉專
 	if (_fbid is null or _fbid ='') then 
-- 		info entity 己存在
		if EXISTS (SELECT 1 FROM information WHERE name = _name and type = _type) then
			SELECT id FROM information WHERE name = _name and type = _type;
			LEAVE main;
		else
		  INSERT into information(name,type,`desc`) VALUES(_name,_type,_desc);
			SELECT LAST_INSERT_ID();
		end if;
	else
			call _add_fbpage(_fbid,_name,_fbpage_pk);
-- 		info entity 己存在
			if EXISTS (SELECT 1 FROM information WHERE fbpage_id = _fbpage_pk) then
 				SELECT id FROM information WHERE fbpage_id = _fbpage_pk;

			leave main;
			else

				INSERT into information(`name`,type,fbpage_id,`desc`) VALUES (_name,_type,_fbpage_pk,_desc);

 				SELECT LAST_INSERT_ID();
			end if ;
			

  end if;


END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure add_info_copy1
-- -----------------------------------------------------

DELIMITER $$
USE `fb`$$
CREATE DEFINER=`arden`@`%` PROCEDURE `add_info_copy1`(
in _fbid varchar(100),
in _name varchar(100),
in _type VARCHAR(100)
)
main:BEGIN
	#Routine body goes here.../

	declare _fbpage_pk int;

-- 没有_fbid ,為非官方粉專
 	if (_fbid is null or _fbid ='') then 
-- 		info entity 己存在
		if EXISTS (SELECT 1 FROM information WHERE name = _name and type = _type) then
			SELECT id FROM information WHERE name = _name and type = _type;
			LEAVE main;
		else
		  INSERT into information(name,type) VALUES(_name,_type);
			SELECT LAST_INSERT_ID();
		end if;
	else
			call _add_fbpage(_fbid,_name,_fbpage_pk);
-- 		info entity 己存在
			if EXISTS (SELECT 1 FROM information WHERE fbpage_id = _fbpage_pk) then
 				SELECT id FROM information WHERE fbpage_id = _fbpage_pk;

			leave main;
			else

				INSERT into information(`name`,type,fbpage_id) VALUES (_name,_type,_fbpage_pk);

 				SELECT LAST_INSERT_ID();
			end if ;
			

  end if;


END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

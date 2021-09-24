-- MySQL Script generated by MySQL Workbench
-- Tue Sep 14 17:27:31 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mongkolthorn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mongkolthorn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mongkolthorn` DEFAULT CHARACTER SET utf8 ;
USE `Mongkolthorn` ;

-- -----------------------------------------------------
-- Table `Mongkolthorn`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`account` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`account` (
  `account_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`kind`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`kind` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`kind` (
  `kind_id` INT NOT NULL,
  `kind_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`kind_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`type` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`type` (
  `type_id` INT NOT NULL,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`gender` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`gender` (
  `gender_id` INT NOT NULL,
  `gender_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`product` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`product` (
  `product_id` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `kind_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `gender_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_product_kind1_idx` (`kind_id` ASC) VISIBLE,
  INDEX `fk_product_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_product_gender1_idx` (`gender_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_kind1`
    FOREIGN KEY (`kind_id`)
    REFERENCES `Mongkolthorn`.`kind` (`kind_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `Mongkolthorn`.`type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_gender1`
    FOREIGN KEY (`gender_id`)
    REFERENCES `Mongkolthorn`.`gender` (`gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`set_size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`set_size` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`set_size` (
  `size_id` INT NOT NULL,
  `size_name` VARCHAR(45) NOT NULL,
  `proportion` DECIMAL(6,2) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`size_id`),
  INDEX `fk_set_size_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_set_size_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Mongkolthorn`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`closet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`closet` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`closet` (
  `closet_id` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `style` CHAR(1) NOT NULL,
  `kind` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `pick_up_date` DATE NOT NULL,
  PRIMARY KEY (`closet_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`save_size`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`save_size` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`save_size` (
  `save_size_id` INT NOT NULL,
  `proportion` DECIMAL(6,2) NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`save_size_id`),
  INDEX `fk_save_size_account1_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `fk_save_size_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `Mongkolthorn`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`colors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`colors` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`colors` (
  `color_id` INT NOT NULL,
  `color_name` VARCHAR(45) NOT NULL,
  `color_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`ad_access`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`ad_access` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`ad_access` (
  `aa_id` INT NOT NULL,
  `user_fname` VARCHAR(45) NULL,
  `user_lname` VARCHAR(45) NULL,
  `user_phone` VARCHAR(10) NULL,
  `closet_id` INT NOT NULL,
  PRIMARY KEY (`aa_id`),
  INDEX `fk_ad_access_closet1_idx` (`closet_id` ASC) VISIBLE,
  CONSTRAINT `fk_ad_access_closet1`
    FOREIGN KEY (`closet_id`)
    REFERENCES `Mongkolthorn`.`closet` (`closet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`admin` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`admin` (
  `adminId` INT NOT NULL,
  `ad_fname` VARCHAR(45) NOT NULL,
  `ad_lname` VARCHAR(45) NOT NULL,
  `ad_email` VARCHAR(45) NOT NULL,
  `ad_password` VARCHAR(45) NOT NULL,
  `access_aa_id` INT NOT NULL,
  PRIMARY KEY (`adminId`),
  INDEX `fk_admin_ad_access1_idx` (`access_aa_id` ASC) VISIBLE,
  CONSTRAINT `fk_admin_ad_access1`
    FOREIGN KEY (`access_aa_id`)
    REFERENCES `Mongkolthorn`.`ad_access` (`aa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`product_has_colors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`product_has_colors` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`product_has_colors` (
  `has_colors_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  INDEX `fk_product_has_colors_colors1_idx` (`color_id` ASC) VISIBLE,
  INDEX `fk_product_has_colors_product1_idx` (`product_id` ASC) VISIBLE,
  PRIMARY KEY (`has_colors_id`),
  CONSTRAINT `fk_product_has_colors_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Mongkolthorn`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_colors_colors1`
    FOREIGN KEY (`color_id`)
    REFERENCES `Mongkolthorn`.`colors` (`color_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`account_has_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mongkolthorn`.`account_has_product` ;

CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`account_has_product` (
  `has_product_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `closet_id` INT NOT NULL,
  INDEX `fk_account_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_account_has_product_account1_idx` (`account_id` ASC) VISIBLE,
  PRIMARY KEY (`has_product_id`),
  INDEX `fk_account_has_product_closet1_idx` (`closet_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_product_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `Mongkolthorn`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Mongkolthorn`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_product_closet1`
    FOREIGN KEY (`closet_id`)
    REFERENCES `Mongkolthorn`.`closet` (`closet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`kind`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`kind` (`kind_id`, `kind_name`) VALUES (400001, 'shirt');
INSERT INTO `Mongkolthorn`.`kind` (`kind_id`, `kind_name`) VALUES (400002, 'pants');
INSERT INTO `Mongkolthorn`.`kind` (`kind_id`, `kind_name`) VALUES (400003, 'skirt');
INSERT INTO `Mongkolthorn`.`kind` (`kind_id`, `kind_name`) VALUES (400004, 'clothes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`type`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200001, 'plain silk');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200002, 'thai silk');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200003, 'three baskets of silk');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200004, 'plain cotton');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200005, 'mudmee cotton');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200006, 'natural dyed cotton');
INSERT INTO `Mongkolthorn`.`type` (`type_id`, `type_name`) VALUES (200007, 'mud fermented cotton');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`gender`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`gender` (`gender_id`, `gender_name`) VALUES (300001, 'Men');
INSERT INTO `Mongkolthorn`.`gender` (`gender_id`, `gender_name`) VALUES (300002, 'Women');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500001, 'Long sleeveless lace dress', 'thai silk (1).jpg', 'Nice bright color dress, simple style. There are pleats on the legs.', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500002, 'Peated sleeve dress', 'thai silk (2).jpg', 'Knee length dress, pleated sleeves', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500003, 'Lace cuffs dress', 'thai silk (3).jpg', 'Pleated dress at the waist, sleeves with lace detailing', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500004, 'Simple elegant dress', 'thai silk (4).jpg', 'Single strap dress pleated skirt elegant and simple', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500005, 'Bows sleeves dress', 'thai silk (5).jpg', 'Long dress with V-neck with buttons tie a bow on the sleeve', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500006, 'Wide neck dress', 'thai silk (6).jpg', 'Wide neck, short sleeves', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500007, 'Blouse dress', 'thai silk (7).jpg', 'V-neck, blouse sleeves, small bow tie The end of the dress is connected with a wide fabric.', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500008, 'Long Lace dress', 'thai silk (8).jpg', 'Long sleeve dress with lace detailing on the top', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500009, 'Fasion dress', 'thai silk (9).jpg', 'The top of the dress has a twisted shape, bright colors.', 400004, 200001, 300002);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`colors`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100001, 'Red', '#EC5959');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100002, 'Orange', '#ECA059');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100003, 'Yellow', '#F6E96C');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100004, 'Green', '#ABEC59');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100005, 'Sky', '#59ECEC');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100006, 'Blue', '#6C8AF6');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100007, 'Purple', '#A359EC');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100008, 'Pink', '#FF97FB');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100009, 'Brown', '#94573C');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100010, 'Black', '#000000');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100011, 'Gray', '#989898');
INSERT INTO `Mongkolthorn`.`colors` (`color_id`, `color_name`, `color_code`) VALUES (100012, 'White', '#FFFFFF');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`product_has_colors`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600001, 500001, 100001);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600002, 500001, 100006);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600003, 500002, 100005);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600004, 500002, 100007);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600005, 500002, 100009);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600006, 500003, 100008);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600007, 500003, 100009);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600008, 500003, 100012);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600009, 500004, 100001);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600010, 500004, 100006);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600011, 500005, 100005);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600012, 500005, 100010);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600013, 500005, 100011);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600014, 500006, 100006);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600015, 500007, 100001);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600016, 500007, 100002);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600017, 500007, 100009);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600018, 500008, 100006);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600019, 500008, 100007);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600020, 500008, 100011);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600021, 500009, 100003);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600022, 500009, 100010);
INSERT INTO `Mongkolthorn`.`product_has_colors` (`has_colors_id`, `product_id`, `color_id`) VALUES (600023, 500009, 100012);

COMMIT;


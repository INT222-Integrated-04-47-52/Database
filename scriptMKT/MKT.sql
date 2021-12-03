SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Mongkolthorn
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Mongkolthorn` ;

-- -----------------------------------------------------
-- Schema Mongkolthorn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mongkolthorn` DEFAULT CHARACTER SET utf8 ;
USE `Mongkolthorn` ;

-- -----------------------------------------------------
-- Table `Mongkolthorn`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`account` (
  `account_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`gender` (
  `gender_id` INT NOT NULL,
  `gender_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`gender_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`kind`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`kind` (
  `kind_id` INT NOT NULL,
  `kind_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`kind_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`type` (
  `type_id` INT NOT NULL,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`product` (
  `product_id` INT NOT NULL,
  `pname` VARCHAR(45) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `kind_id` INT NOT NULL,
  `type_id` INT NOT NULL,
  `gender_id` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`colors` (
  `color_id` INT NOT NULL,
  `color_name` VARCHAR(45) NOT NULL,
  `color_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`color_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`closet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`closet` (
  `closet_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  `pick_up_date` DATE NOT NULL,
  PRIMARY KEY (`closet_id`, `color_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`product_has_colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`product_has_colors` (
  `has_colors_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `color_id` INT NOT NULL,
  PRIMARY KEY (`has_colors_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Mongkolthorn`.`size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mongkolthorn`.`size` (
  `size_id` INT NOT NULL,
  `size_name` VARCHAR(45) NOT NULL,
  `proportion` DECIMAL(6,2) NOT NULL,
  `closet_id` INT NOT NULL,
  PRIMARY KEY (`size_id`, `closet_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`account`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`account` (`account_id`, `fname`, `lname`, `phone`, `email`, `password`, `role`) VALUES (800001, 'Khorapin', 'Uzumaki', '0826102000', 'adminpin@email.com', '$2a$12$ZGT8qaAoCuvdQzHL1r.98emHJKJ.9Jxgi3B1vVRHSxxi/.UXAga4C', 'ADMIN');
INSERT INTO `Mongkolthorn`.`account` (`account_id`, `fname`, `lname`, `phone`, `email`, `password`, `role`) VALUES (800002, 'Noochajee', 'Kang', '0821092000', 'usernooch@email.com', '$2a$12$ZzluY8KXkX0m/fk7iyvvLeqOXrw2EPR.L6MTIYhIebCJN7WEqdu3u', 'USER');
INSERT INTO `Mongkolthorn`.`account` (`account_id`, `fname`, `lname`, `phone`, `email`, `password`, `role`) VALUES (800003, 'Prapaporn', 'Xiao', '0807102000', 'usernook@email.com', '$2a$12$FHR7I8ae6JVRrU0iSN4q4u4oMYRkWChA1WoNnxzRj7iU.lEtrGws.', 'USER');

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
-- Data for table `Mongkolthorn`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500001, 'Long sleeveless lace dress', 'thai-silk-1.jpg', 'Nice bright color dress, simple style. There are pleats on the legs.', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500002, 'Peated sleeve dress', 'thai-silk-2.jpg', 'Knee length dress, pleated sleeves', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500003, 'Lace cuffs dress', 'thai-silk-3.jpg', 'Pleated dress at the waist, sleeves with lace detailing', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500004, 'Simple elegant dress', 'thai-silk-4.jpg', 'Single strap dress pleated skirt elegant and simple', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500005, 'Bows sleeves dress', 'thai-silk-5.jpg', 'Long dress with V-neck with buttons tie a bow on the sleeve', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500006, 'Wide neck dress', 'thai-silk-6.jpg', 'Wide neck, short sleeves', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500007, 'Blouse dress', 'thai-silk-7.jpg', 'V-neck, blouse sleeves, small bow tie The end of the dress is connected with a wide fabric.', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500008, 'Long Lace dress', 'thai-silk-8.jpg', 'Long sleeve dress with lace detailing on the top', 400004, 200001, 300002);
INSERT INTO `Mongkolthorn`.`product` (`product_id`, `pname`, `image`, `description`, `kind_id`, `type_id`, `gender_id`) VALUES (500009, 'Fasion dress', 'thai-silk-9.jpg', 'The top of the dress has a twisted shape, bright colors.', 400004, 200001, 300002);

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
-- Data for table `Mongkolthorn`.`closet`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`closet` (`closet_id`, `account_id`, `product_id`, `color_id`, `pick_up_date`) VALUES (900001, 800002, 500001, 100006, '2021-11-29');
INSERT INTO `Mongkolthorn`.`closet` (`closet_id`, `account_id`, `product_id`, `color_id`, `pick_up_date`) VALUES (900002, 800003, 500009, 100010, '2021-11-30');
INSERT INTO `Mongkolthorn`.`closet` (`closet_id`, `account_id`, `product_id`, `color_id`, `pick_up_date`) VALUES (900003, 800002, 500001, 100006, '2021-12-09');

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


-- -----------------------------------------------------
-- Data for table `Mongkolthorn`.`size`
-- -----------------------------------------------------
START TRANSACTION;
USE `Mongkolthorn`;
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700001, 'Shoulder', 30.00, 900001);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700002, 'Bust', 48.00, 900001);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700003, 'Waist', 30.00, 900001);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700004, 'Hips', 30.00, 900001);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700005, 'Shoulder', 25.00, 900002);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700006, 'Bust', 42.00, 900002);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700007, 'Waist', 28.00, 900002);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700008, 'Hips', 30.00, 900002);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700009, 'Shoulder', 30.00, 900003);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700010, 'Bust', 52.30, 900003);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700011, 'Waist', 40.50, 900003);
INSERT INTO `Mongkolthorn`.`size` (`size_id`, `size_name`, `proportion`, `closet_id`) VALUES (700012, 'Hips', 50.00, 900003);

COMMIT;


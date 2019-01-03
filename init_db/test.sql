USE test;

DROP TABLE IF EXISTS parts;
CREATE TABLE parts (
 `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `necessary` TINYINT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Matherboard', '1', '15');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('CPU', '1', '12');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Keyboard', '1', '34');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Mouse', '1', '26');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Joystick', '0', '9');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Web Camera', '0', '13');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Speakers', '1', '18');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Printer', '0', '22');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Microphone', '0', '17');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Scanner', '0', '25');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Hard Disk', '1', '18');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Floppy Disk', '0', '8');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Compact Disc ', '0', '14');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Video Graphics Adapter', '0', '31');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Computer case', '1', '27');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Memory chip', '1', '42');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Memory Stick', '0', '56');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Memory Card', '0', '41');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Memory card reader', '0', '25');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Network Card', '0', '19');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Sound Card', '0', '23');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Plotter', '0', '14');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Router', '0', '53');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Solid State Drive', '0', '48');
INSERT INTO `test`.`parts` (`name`, `necessary`, `quantity`) VALUES ('Power Supply Unit', '1', '17');
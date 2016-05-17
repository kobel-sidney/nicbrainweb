ALTER TABLE `nicbraindesenvv12`.`veiculo` DROP FOREIGN KEY `FK_cwb6cj3nu7re5a6msdqyaik5f`;
ALTER TABLE `nicbraindesenvv12`.`veiculo` DROP COLUMN `id_pessoa`,
DROP INDEX `FK_cwb6cj3nu7re5a6msdqyaik5f`;
ALTER TABLE `nicbraindesenvv12`.`veiculo` ADD COLUMN `nome` VARCHAR(255) NOT NULL AFTER `id_veiculo`;


CREATE TABLE `nicbraindesenvv12`.`veiculo_tipo` (
  `id_veiculo_tipo` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_veiculo_tipo`));

ALTER TABLE `nicbraindesenvv12`.`veiculo` ADD COLUMN `id_veiculo_tipo` BIGINT(20) NOT NULL AFTER `id_veiculo`;
ALTER TABLE `nicbraindesenvv12`.`veiculo` ADD INDEX `fk_veiculo_2_idx` (`id_veiculo_tipo` ASC);
ALTER TABLE `nicbraindesenvv12`.`veiculo` 
		  ADD CONSTRAINT `fk_veiculo_veiculo_tipo1`
		  FOREIGN KEY (`id_veiculo_tipo`)
		  REFERENCES `nicbraindesenvv12`.`veiculo_tipo` (`id_veiculo_tipo`)
		  ON DELETE NO ACTION
		  ON UPDATE NO ACTION;


INSERT INTO `nicbraindesenvv12`.`veiculo_tipo` (`id_veiculo_tipo`, `nome`) VALUES ('1', 'Passeio');
INSERT INTO `nicbraindesenvv12`.`veiculo_tipo` (`id_veiculo_tipo`, `nome`) VALUES ('2', 'Utilitário');
INSERT INTO `nicbraindesenvv12`.`veiculo_tipo` (`id_veiculo_tipo`, `nome`) VALUES ('3', 'Moto');
INSERT INTO `nicbraindesenvv12`.`veiculo_tipo` (`id_veiculo_tipo`, `nome`) VALUES ('4', 'Caminhão');





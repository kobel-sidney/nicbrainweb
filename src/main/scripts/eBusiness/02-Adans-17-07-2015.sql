CREATE TABLE `troca_veiculo` (
  `id_troca_veiculo` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_veiculo` bigint(20) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo_troca` char(1) NOT NULL COMMENT '''E'' Entrega  e ''R'' Retirada',
  PRIMARY KEY (`id_troca_veiculo`),
  KEY `fk_troca_veiculo_veiculo_idx` (`id_veiculo`),
  CONSTRAINT `fk_troca_veiculo_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



CREATE TABLE `troca_veiculo_pessoa` (
  `id_troca_veiculo` bigint(20) NOT NULL,
  `id_pessoa` bigint(20) NOT NULL,
  KEY `fk_troca_veiculo_pessoa1_idx` (`id_pessoa`),
  KEY `fk_troca_veiculo_pessoa_veiculo_idx` (`id_troca_veiculo`),
  CONSTRAINT `fk_troca_veiculo_pessoa_troca_veiculo1` FOREIGN KEY (`id_troca_veiculo`) REFERENCES `troca_veiculo` (`id_troca_veiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_troca_veiculo_pessoa_pessoa1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




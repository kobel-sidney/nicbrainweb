ALTER TABLE `nicbraindesenvv12`.`checklist_padrao` ADD COLUMN `id_contratante` BIGINT(20) ,ADD INDEX `fk_checklist_padrao_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`checklist_padrao` SET `id_contratante`='1' WHERE `id_contratante` is null ;
ALTER TABLE `nicbraindesenvv12`.`checklist_padrao` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`checklist_padrao` 
		ADD CONSTRAINT `fk_checklist_padrao_contratante1` 
		FOREIGN KEY (`id_contratante`) 
		REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`) 
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`relacionamento_perfil_formulario` ADD COLUMN `id_contratante` BIGINT(20) ,ADD INDEX `fk_relacionamento_perfil_formulario_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`relacionamento_perfil_formulario` SET `id_contratante`='1' WHERE `id_contratante` is null ;
ALTER TABLE `nicbraindesenvv12`.`relacionamento_perfil_formulario` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`relacionamento_perfil_formulario` 
	 ADD CONSTRAINT `fk_relacionamento_perfil_formulario_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`grupo_questao` ADD COLUMN `id_contratante` BIGINT(20) , ADD INDEX `fk_grupo_questao_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`grupo_questao` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`grupo_questao` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`grupo_questao` 
	ADD CONSTRAINT `fk_grupo_questao_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`perfil_formulario` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_perfil_formulario_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`perfil_formulario` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`perfil_formulario` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`perfil_formulario` 
	ADD CONSTRAINT `fk_perfil_formulario_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`questao` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_questao_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`questao` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`questao` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`questao` 
	ADD CONSTRAINT `fk_questao_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;

	  
ALTER TABLE `nicbraindesenvv12`.`resposta` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_resposta_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`resposta` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`resposta` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`resposta` 
	ADD CONSTRAINT `fk_resposta_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`procedimento` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_procedimento_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`procedimento` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`procedimento` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`procedimento` 
	ADD CONSTRAINT `fk_procedimento_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`veiculo` ADD COLUMN `id_contratante` BIGINT(20) ,ADD INDEX `fk_veiculo_id_contratante_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`veiculo` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`veiculo` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`veiculo` 
	ADD CONSTRAINT `fk_veiculo_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;	
	  
ALTER TABLE `nicbraindesenvv12`.`cargo` ADD COLUMN `id_contratante` BIGINT(20) ,ADD INDEX `fk_cargo_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`cargo` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`cargo` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`cargo` 
	ADD CONSTRAINT `fk_cargo_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`departamento` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_departamento_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`departamento` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`departamento` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`departamento` 
	ADD CONSTRAINT `fk_departamento_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	  
ALTER TABLE `nicbraindesenvv12`.`fornecedor` ADD COLUMN `id_contratante` BIGINT(20) ,ADD INDEX `fk_fornecedor_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`fornecedor` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`fornecedor` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`fornecedor` 
	ADD CONSTRAINT `fk_fornecedor_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`grupo`	ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_grupo_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`grupo` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`grupo` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`grupo` 
	ADD CONSTRAINT `fk_grupo_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	
	
ALTER TABLE `nicbraindesenvv12`.`mensagem` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_mensagem_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`mensagem` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`mensagem` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`mensagem` 
	ADD CONSTRAINT `fk_mensagem_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;

ALTER TABLE `nicbraindesenvv12`.`modelo_equipamento` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_modelo_equipamento_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`modelo_equipamento` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`modelo_equipamento` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`modelo_equipamento` 
	ADD CONSTRAINT `fk_modelo_equipamento_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`telefone_util` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_telefone_util_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`telefone_util` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`telefone_util` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`telefone_util` 
	ADD CONSTRAINT `fk_telefone_util_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
	 
ALTER TABLE `nicbraindesenvv12`.`tipo_classificacao` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_tipo_classificacao_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`tipo_classificacao` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`tipo_classificacao` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`tipo_classificacao` 
	ADD CONSTRAINT `fk_tipo_classificacao_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`tipo_questao` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_tipo_questao_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`tipo_questao` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`tipo_questao` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`tipo_questao` 
	ADD CONSTRAINT `fk_tipo_questao_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`tipo_servico` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_tipo_servico_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`tipo_servico` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`tipo_servico` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`tipo_servico` 
	ADD CONSTRAINT `fk_tipo_servico_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;
	  
ALTER TABLE `nicbraindesenvv12`.`turno` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_turno_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`turno` SET `id_contratante`='1' WHERE `id_contratante` is null ;	
ALTER TABLE `nicbraindesenvv12`.`turno` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`turno` 
	ADD CONSTRAINT `fk_turno_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;

ALTER TABLE `nicbraindesenvv12`.`classificacao_ocorrencia` ADD COLUMN `id_contratante` BIGINT(20)  ,ADD INDEX `fk_classificacao_ocorrencia_1_idx` (`id_contratante` ASC);
UPDATE `nicbraindesenvv12`.`classificacao_ocorrencia` SET `id_contratante`='1' WHERE `id_contratante` is null ;
ALTER TABLE `nicbraindesenvv12`.`classificacao_ocorrencia` CHANGE COLUMN `id_contratante` `id_contratante` BIGINT(20) NOT NULL ;
ALTER TABLE `nicbraindesenvv12`.`classificacao_ocorrencia` 
	ADD CONSTRAINT `fk_classificacao_ocorrencia_contratante1`
	  FOREIGN KEY (`id_contratante`)
	  REFERENCES `nicbraindesenvv12`.`contratante` (`id_contratante`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;


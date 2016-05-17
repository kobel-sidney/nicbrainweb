ALTER TABLE `nicbraindesenvv12`.`resposta_questao` 
ADD INDEX `fk_resposta_questao_1_idx` (`id_grupo_questao` ASC),
ADD INDEX `fk_resposta_questao_perfil_formulario2_idx` (`id_perfil_formulario` ASC),
ADD INDEX `fk_resposta_questao_resposta1_idx` (`id_resposta` ASC),
ADD INDEX `fk_resposta_questao_atividade1_idx` (`id_atividade` ASC),
ADD INDEX `fk_resposta_questao_questao1_idx` (`id_questao` ASC);
ALTER TABLE `nicbraindesenvv12`.`resposta_questao` 
ADD CONSTRAINT `fk_resposta_questao_grupo_questao1`
  FOREIGN KEY (`id_grupo_questao`)
  REFERENCES `nicbraindesenvv12`.`grupo_questao` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resposta_questao_perfil_formulario1`
  FOREIGN KEY (`id_perfil_formulario`)
  REFERENCES `nicbraindesenvv12`.`perfil_formulario` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resposta_questao_questao1`
  FOREIGN KEY (`id_questao`)
  REFERENCES `nicbraindesenvv12`.`questao` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resposta_questao_resposta1`
  FOREIGN KEY (`id_resposta`)
  REFERENCES `nicbraindesenvv12`.`resposta` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_resposta_questao_atividade1`
  FOREIGN KEY (`id_atividade`)
  REFERENCES `nicbraindesenvv12`.`atividade` (`id_atividade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

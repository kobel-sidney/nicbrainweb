-- Cria um relacionamento entre Procedimento e PerfilFormulario:

ALTER TABLE `procedimento`
	ADD `id_perfil_formulario` BIGINT(20) NULL;

ALTER TABLE `procedimento`
	ADD CONSTRAINT `FK_procedimento_id_perfil_formulario`
	FOREIGN KEY (`id_perfil_formulario`) REFERENCES `perfil_formulario` (`id`);

-- Remover o relacionamento entre Procedimento e Formulário:

ALTER TABLE `procedimento`
	DROP FOREIGN KEY `FK_68yjbxv7doohh0dbtr0m9evq4`;

ALTER TABLE `procedimento`
	DROP COLUMN `id_formulario`;
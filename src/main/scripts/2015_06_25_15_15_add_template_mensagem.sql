-- inclusao do campo 'template':

ALTER TABLE `mensagem`
	ADD `template` TINYINT(1) NOT NULL DEFAULT 0;

-- Criacao da tabela que relaciona o cliente com as mensagens

CREATE TABLE `cliente_mensagem` (
	`id_cliente` BIGINT(20) NOT NULL,
	`id_mensagem` BIGINT(20) NOT NULL
);

ALTER TABLE `cliente_mensagem`
	ADD CONSTRAINT `PK_cliente_mensagem`
	PRIMARY KEY (`id_cliente`, `id_mensagem`);

ALTER TABLE `cliente_mensagem`
	ADD CONSTRAINT `FK_cliente_mensagem_id_cliente`
	FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

ALTER TABLE `cliente_mensagem`
	ADD CONSTRAINT `FK_cliente_mensagem_id_mensagem`
	FOREIGN KEY (`id_mensagem`) REFERENCES `mensagem` (`id_mensagem`);

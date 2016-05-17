-- Criacao da tabela que relaciona o procedimento com os cliente

CREATE TABLE `procedimento_cliente` (
	`id_procedimento` BIGINT(20) NOT NULL,
	`id_cliente` BIGINT(20) NOT NULL
);

ALTER TABLE `procedimento_cliente`
	ADD CONSTRAINT `PK_procedimento_cliente`
	PRIMARY KEY (`id_procedimento`, `id_cliente`);

ALTER TABLE `procedimento_cliente`
	ADD CONSTRAINT `FK_procedimento_cliente_id_id_procedimento`
	FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id_procedimento`);

ALTER TABLE `procedimento_cliente`
	ADD CONSTRAINT `FK_procedimento_cliente_id_cliente`
	FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);


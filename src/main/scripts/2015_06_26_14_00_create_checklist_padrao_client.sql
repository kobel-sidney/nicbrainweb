-- Criacao da tabela que relaciona o checklist com o cliente

CREATE TABLE `checklist_padrao_cliente` (
	`id_checklist_padrao` BIGINT(20) NOT NULL,
	`id_cliente` BIGINT(20) NOT NULL
);

ALTER TABLE `checklist_padrao_cliente`
	ADD CONSTRAINT `PK_checklist_padrao_cliente`
	PRIMARY KEY (`id_checklist_padrao`, `id_cliente`);

ALTER TABLE `checklist_padrao_cliente`
	ADD CONSTRAINT `FK_checklist_padrao_cliente_id_checklist_padrao`
	FOREIGN KEY (`id_checklist_padrao`) REFERENCES `checklist_padrao` (`id_checklist_padrao`);

ALTER TABLE `checklist_padrao_cliente`
	ADD CONSTRAINT `FK_checklist_padrao_cliente_id_cliente`
	FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

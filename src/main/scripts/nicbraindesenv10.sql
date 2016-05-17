/*Tabela Segmento*/
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (1, 'Administração', 'Administração do Sistema', null);
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (2, 'Evento', 'Realização de Eventos', null);
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (3, 'Condominio', 'Condominios Residenciais', null);
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (4, 'Escola', 'Instituição de Ensino', null);
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (5, 'Segurança', 'Empresas de Segurança', null);
insert into segmento (IdSegmento, NomeSegmento, DescricaoSegmento, Logo) values (6, 'Shopping', 'Conjunto de lojas de compras', null);


/*Tabela Grupo*/
insert into grupo (idGrupo, NomeGrupo, DescricaoGrupo) values (1, 'Superior Imediato', 'Superior Imediato');
insert into grupo (idGrupo, NomeGrupo, DescricaoGrupo) values (2, 'Gerentes', 'Gerentes');
insert into grupo (idGrupo, NomeGrupo, DescricaoGrupo) values (3, 'Diretores', 'Diretores');
insert into grupo (idGrupo, NomeGrupo, DescricaoGrupo) values (4, 'Responsável', 'Responsável');


/*Tabela Tipo Mensagem*/
insert into tipo_mensagem (idTipoMsg, NomeTipoMsg, DescricaoTipoMsg) values (1, 'Aviso', 'Mensagem de Aviso');
insert into tipo_mensagem (idTipoMsg, NomeTipoMsg, DescricaoTipoMsg) values (2, 'Alerta', 'Mensagem de Alerta');

/*Tabela Tipo Envio*/
insert into tipo_envio (idTipoEnvio, NomeTipoEnvio, DescricaoTipoEnvio)	 values (1, 'E-Mail', 'Mensagem por e-mail');
insert into tipo_envio (idTipoEnvio, NomeTipoEnvio, DescricaoTipoEnvio)	 values (2, 'Push', 'Mensagem por push');
insert into tipo_envio (idTipoEnvio, NomeTipoEnvio, DescricaoTipoEnvio)	 values (3, 'SMS', 'Mensagem por SMS');	


/*Tabela Cargo*/
insert into cargo(idCargo, NomeCargo, DescricaoCargo) values (1, 'Gerente', 'Gerentes');
insert into cargo(idCargo, NomeCargo, DescricaoCargo) values (2, 'Arquiteto de Soluções', 'Responsavel por desenhar o sistema');	
insert into cargo(idCargo, NomeCargo, DescricaoCargo) values (3, 'CEO', 'Chief Executive Officer');		

/*Tabela Pais*/
insert into pais (IdPais, Nomepais)	values (1, 'Brasil');

/*Tabela Estado*/
insert into estado (IdEstado, IdPais, SiglaEstado, NomeEstado)	values (1, 1, 'SP', 'São Paulo');
insert into estado (IdEstado, IdPais, SiglaEstado, NomeEstado)	values (2, 1, 'RJ', 'Rio de Janeiro');	
insert into estado (IdEstado, IdPais, SiglaEstado, NomeEstado)	values (3, 1, 'MG', 'Minas Gerais');		


/*Tabela Municipio*/
insert into municipio (idMunicipio, IdPais, IdEstado, NomeMunicipio) values (1,1,1, 'São Paulo');
insert into municipio (idMunicipio, IdPais, IdEstado, NomeMunicipio) values (2,1,1, 'Santo André');
insert into municipio (idMunicipio, IdPais, IdEstado, NomeMunicipio) values (3,1,2, 'Rio de Janeiro');	
insert into municipio (idMunicipio, IdPais, IdEstado, NomeMunicipio) values (4,1,3, 'Belo Horizonte');		


/*Tabela Tipo_Logradouro*/
insert into Tipo_Logradouro (idTipoLogradouro, NomeTipoLogradouro, DescricaoTipoLogradouro)	 values (1, 'Rua', 'Rua Comum');
insert into Tipo_Logradouro (idTipoLogradouro, NomeTipoLogradouro, DescricaoTipoLogradouro)	 values (2, 'Avenida', 'Rua de grande movimento');

/*Tabela Endereço*/
insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (1, 2, 'José Caballero', 65, 'Sala 12', ' Vila Bastos', '09040-210', '-23.658226', '-46.533063', 1, 1, 2, now());

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (2, 1, 'Ática', 209, 'apto 104', ' Jd. Brasil', '04634-040', '-23.636830', '-46.667798', 1, 1, 1, now());

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (3, 1, 'Santa Albina', 430, null, ' Jd. Trussardi', '05518-000', '-23.584511', '-46.729257', 1, 1, 1, now());

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (4, 2, 'Salvador Allende', 6555, 'Rio Centro-Portão H', 'Barra da Tijuca', '22783-127', '-22.978049', '-43.411488', 1, 2, 3, now());	

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (5, 1, 'Professor Eurico Rabelo', 20271, null, 'Maracanã', '20271-150', '-22.913931', '-43.230989', 1, 2, 3, now());	

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (6, 1, 'Doutor Luís Aires', 0, null, 'Itaquera', '08295-005', '-23.543503', '-46.476490', 1, 1, 1, now());		

insert into Endereco (idEndereco, idTipoLogradouro, Nome, Numero, Complemento, Bairro, Cep, latitude, longitude, idpais, idEstado, Idmunicipio, DtCadastro)	
	values (7, 2, 'Antônio Abrahão Caram', 1001, null, 'São Luís', '31275-000', '-19.865015', '-43.970914', 1, 3, 4, now());		



/*Tabela Contratante*/
insert into Contratante(idContratante, idSegmento, Nomefantasia, CNPJContratante, IEContratante, TelefoneContratante, Observacao, RazaoSocial, Site, Logo,
						 ResponsavelContratante, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco)
values
						(1, 1, 'Kobel', '03.841.747/0001-41', 'ISENTO', '(11) 4427-7554', 'Empresa dona do NicBrain', 'Kobel Ltda', 'www.kobel.com.br', null,
						 'Sidney Samitsu da Silva', '(11) 4427-7554', '(11) 99171-7827', 'sidney@kobel.com.br', 1	);						 
	
insert into Contratante(idContratante, idSegmento, Nomefantasia, CNPJContratante, IEContratante, TelefoneContratante, Observacao, RazaoSocial, Site, Logo,
						 ResponsavelContratante, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco)
values
						(2, 3, 'Belfort', '62.447.032/0001-97', 'ISENTO', '(11) 3723-2020', 'Empresa de Segurança', 'Belfort Segurança Patrimonial', 'www.belfort.com.br', null,
						 'Marcus Belfort', '(11) 3723-2020', '(11) 98380-5892', 'marcus@belfort.com.br', 3);						 

insert into Contratante(idContratante, idSegmento, Nomefantasia, CNPJContratante, IEContratante, TelefoneContratante, Observacao, RazaoSocial, Site, Logo,
						 ResponsavelContratante, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco)
values
						(3, 2, 'Fifa', '54.513.020/0001-95', 'ISENTO', '(21) 2014-2014', 'Federação Internacional Futebol', 'Fifa Intl.', 'www.fifa.com', null,
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', 4);						 



/*Tabela EmailConfigContratante*/
insert into emailConfig_contratante (idContratante, hostName, SmtpPort, UserId, Password, fromSender, fromName, SSLOnConnect, StartTlsEnabled)
	values (1, 'smtp.abc.terra.com.br', 587, 'nicbrain.desenv@kolss.com.br', 'desenv1', 'nicbrain.desenv@kolss.com.br', 'NicBrainMobile', 0, 0);

/*Tabela Tipo_Pessoa*/
insert into tipo_pessoa (idTipoPessoa, NomeTipoPessoa) value (1, 'Pessoa Fisica');

/*Tabela Pessoa*/
insert into pessoa (IdPessoa, NomePessoa, CpfPessoa, RgPessoa, DtNascimentoPessoa, Foto, IdTipoPessoa, IdEndereco, Ativo)	
	values (1, 'Alberto Rodrigues', '279.167.028-94', '27.344.084-6', '1974-09-30 00:00:00', null, 1, 2, 1);

insert into pessoa (IdPessoa, NomePessoa, CpfPessoa, RgPessoa, DtNascimentoPessoa, Foto, IdTipoPessoa, IdEndereco, Ativo)	
	values (2, 'Sidney Samitsu', '596.278.919-91', '18.740.470-7', '1968-08-25 00:00:00', null, 1, 1, 1);

insert into pessoa (IdPessoa, NomePessoa, CpfPessoa, RgPessoa, DtNascimentoPessoa, Foto, IdTipoPessoa, IdEndereco, Ativo)	
	values (3, 'Marcus Sandin', '111.222.333-44', '11.222.333-4', '2000-01-01 00:00:00', null, 1, 3, 1);

insert into pessoa (IdPessoa, NomePessoa, CpfPessoa, RgPessoa, DtNascimentoPessoa, Foto, IdTipoPessoa, IdEndereco, Ativo)	
	values (4, 'Ederson Juliano', '222.111.333-44', '11.222.333-4', '2000-01-01 00:00:00', null, 1, 1, 1);

insert into pessoa (IdPessoa, NomePessoa, CpfPessoa, RgPessoa, DtNascimentoPessoa, Foto, IdTipoPessoa, IdEndereco, Ativo)	
	values (5, 'Luiz Fernando Amorim', '333.222.111-44', '11.222.333-4', '2000-01-01 00:00:00', null, 1, 3, 1);



/*Tabela E-mail_Pessoa*/
insert into email_pessoa (idEmail, idPessoa, email, DtCadastro)	 values (1,1, 'alberto@kobel.com.br', now());
insert into email_pessoa (idEmail, idPessoa, email, DtCadastro)	 values (2,2, 'sidney@kobel.com.br', now());
insert into email_pessoa (idEmail, idPessoa, email, DtCadastro)	 values (3,3, 'marcus@belfort.com.br', now());
insert into email_pessoa (idEmail, idPessoa, email, DtCadastro)	 values (4,4, 'ederson@kobel.com.br', now());	
insert into email_pessoa (idEmail, idPessoa, email, DtCadastro)	 values (5,5, 'lamorim@belfort.com.br', now());	


/*Tabela Tipo_Telefone*/
insert into tipo_telefone (idTipoTelefone, NomeTipoTelefone) values (1, 'Residencial');
insert into tipo_telefone (idTipoTelefone, NomeTipoTelefone) values (2, 'Comercial');	
insert into tipo_telefone (idTipoTelefone, NomeTipoTelefone) values (3, 'Celular');	
insert into tipo_telefone (idTipoTelefone, NomeTipoTelefone) values (4, 'Recado');	

/*Tabela Telefone_Pessoa*/
insert into telefone_pessoa (idTelefone, idPessoa, telefone, dtCadastro, idTipoTelefone)	value (1, 1, '(11) 99155-8623', now(), 3); 
insert into telefone_pessoa (idTelefone, idPessoa, telefone, dtCadastro, idTipoTelefone)	value (2, 1, '(11) 2619-6892', now(), 1); 	


/*Tabela Funcionario - Estão como funcionarios FIFA, por causa da tabela Checklist*/ 
insert into funcionario (idPessoa, IdContratante, idCargo, idFuncionarioSuperior, nrMatricula, Ativo)
values (3, 3, 3, null, 00001, 1); /* marcus */

insert into funcionario (idPessoa, IdContratante, idCargo, idFuncionarioSuperior, nrMatricula, Ativo)
values (4, 3, 3, null, 00001, 1);  /* ederson */

insert into funcionario (idPessoa, IdContratante, idCargo, idFuncionarioSuperior, nrMatricula, Ativo)
values (2, 3, 1, 4, 00002, 1);  /* sidney */

insert into funcionario (idPessoa, IdContratante, idCargo, idFuncionarioSuperior, nrMatricula, Ativo)
values (1, 3, 2, 2, 00003, 1);  /* alberto */

insert into funcionario (idPessoa, IdContratante, idCargo, idFuncionarioSuperior, nrMatricula, Ativo)
values (5, 2, 2, null, 00002, 1);  /* amorin - esta como empresa belfort */




/*Tabela Perfil*/
insert into perfil (idPerfil, nomePerfil, DescricaoPerfil, Ativo)
	values (1, 'Administrador', 'Administra o sistema', 1);

insert into perfil (idPerfil, nomePerfil, DescricaoPerfil, Ativo)
	values (2, 'Gerente', 'Gerencia o processo', 1);

insert into perfil (idPerfil, nomePerfil, DescricaoPerfil, Ativo)
	values (3, 'Operador', 'Opera o sistema', 1);


/*Tabela Usuario - Estão com usários FIFA , por causa da tabela Checklist*/
insert into usuario (idpessoa, idContratante, idPerfil, NomeUsuario, Senhausuario, EmailUsuario, DtUltimoLogin, UltimoIP, DtPrimeiroAcesso, nrTentativaslogin, 
	usuarioBloqueado, DtvalidadeSenha, dtValidadeConta, Permissao, Ativo)	
values (1, 3, 1, 'arodrigues', 'arodrigues', 'alberto@kobel.com.br', null, null, null, 0, 
	 	0, '2015-01-01 00:00:00', '2020-01-01 00:00:00', 'ROLE_ADMIN', 1);

insert into usuario (idpessoa, idContratante, idPerfil, NomeUsuario, Senhausuario, EmailUsuario, DtUltimoLogin, UltimoIP, DtPrimeiroAcesso, nrTentativaslogin, 
	usuarioBloqueado, DtvalidadeSenha, dtValidadeConta, Permissao, Ativo)	
values (2, 3, 1, 'ssamitsu', 'ssamitsu', 'sidney@kobel.com.br', null, null, null, 0, 
	 	0, '2015-01-01 00:00:00', '2020-01-01 00:00:00', 'ROLE_ADMIN', 1);

insert into usuario (idpessoa, idContratante, idPerfil, NomeUsuario, Senhausuario, EmailUsuario, DtUltimoLogin, UltimoIP, DtPrimeiroAcesso, nrTentativaslogin, 
	usuarioBloqueado, DtvalidadeSenha, dtValidadeConta, Permissao, Ativo)	
values (3, 3, 1, 'msandin', 'msandin', 'marcus@belfort.com.br', null, null, null, 0, 
	 	0, '2015-01-01 00:00:00', '2020-01-01 00:00:00', 'ROLE_OP', 1);

insert into usuario (idpessoa, idContratante, idPerfil, NomeUsuario, Senhausuario, EmailUsuario, DtUltimoLogin, UltimoIP, DtPrimeiroAcesso, nrTentativaslogin, 
	usuarioBloqueado, DtvalidadeSenha, dtValidadeConta, Permissao, Ativo)	
values (4, 3, 2, 'ejuliano', 'ejuliano', 'ederson@kobel.com.br', null, null, null, 0, 
	 	0, '2015-01-01 00:00:00', '2020-01-01 00:00:00', 'ROLE_GER', 1);

insert into usuario (idpessoa, idContratante, idPerfil, NomeUsuario, Senhausuario, EmailUsuario, DtUltimoLogin, UltimoIP, DtPrimeiroAcesso, nrTentativaslogin, 
	usuarioBloqueado, DtvalidadeSenha, dtValidadeConta, Permissao, Ativo)	
values (5, 2, 1, 'lamorim', 'lamorim', 'lamorim@belfort.com.br', null, null, null, 0, 
	 	0, '2015-01-01 00:00:00', '2020-01-01 00:00:00', 'ROLE_OP', 1);



/*Tabela Grupo Funcionario*/
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (1, 4, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (2, 1, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (2, 2, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (2, 4, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (3, 1, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (3, 3, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (3, 4, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (4, 1, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (4, 3, 3, 1);
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (4, 4, 3, 1);	
insert into grupo_funcionario (idPessoa, idGrupo, idContratante, Ativo) values (5, 4, 2, 1);


/*Tabela Menu*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (1, 'Contratante', 'Contratante', null, null, 'E', 1, '/images/icones/icon-contratante.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (2, 'Perfil de Acesso', 'Perfil de Acesso', null, null, 'E', 2, '/images/icones/icon-cadeado.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (3, 'Usuário', 'Usuário', null, null, 'E', 3, '/images/icones/icon-usuario.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (4, 'Dados Mestres', 'Dados Mestres', null, null, 'E', 4, '/images/icones/icon-database.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (5, 'Controle de Acesso', 'Controle de Acesso', null, null, 'E', 5, '/images/icones/icon-acesso.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (6, 'Ocorrência', 'Ocorrência', null, null, 'E', 6, '/images/icones/icon-ocorrencia.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (7, 'CheckList', 'CheckList', null, null, 'E', 7, '/images/icones/icon-checklist.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (8, 'Monitorar', 'Monitorar', null, null, 'E', 8, '/images/icones/icon-monitorar.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (9, 'Rastrear', 'Rastrear', null, null, 'E', 9, '/images/icones/icon-rastrear.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (10, 'Relatórios', 'Relatórios', null, null, 'E', 10, '/images/icones/icon-relatorio.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (11, 'TelefonesUteis', 'Relatórios', null, null, 'D', 11, '/images/icones/icon-telefone.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (12, 'Meus Alertas', 'Meus Alertas', null, null, 'D', 12, '/images/icones/icon-alerta.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (13, 'Envio de Mensagem', 'Envio de Mensagem', null, null, 'D', 13, '/images/icones/icon-mensagem.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (14, 'Câmeras', 'Câmeras', null, null, 'D', 14, '/images/icones/icon-camera.png', 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (15, 'Documentos', 'Documentos', null, null, 'D', 15, '/images/icones/icon-documento.png', 1);

/*Submenu de Contratante*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (16, 'Cadastro Contratante', 'Cadastro Contratante', 1, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (17, 'Consulta Contratante', 'Consulta Contratante', 1, null, 'E', 2, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (18, 'Cliente', 'Cliente', 1, null, 'E', 3, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (19, 'Local', 'Local', 1, null, 'E', 4, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (20, 'Evento', 'Evento', 1, null, 'E', 5, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (21, 'CheckList e Atividades', 'CheckList e Atividades', 1, null, 'E', 6, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (22, 'Funcionário', 'Funcionário', 1, null, 'E', 7, null, 1);

/*SubMenu de Dados Mestre*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (23, 'Segmento', 'Segmento', 4, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (24, 'CheckList e Procedimentos', 'CheckList e Procedimentos', 4, null, 'E', 2, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (25, 'Tipo de Mensagem', 'Tipo de Mensagem', 4, null, 'E', 3, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (26, 'Aviso', 'Aviso', 4, null, 'E', 4, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (27, 'Status', 'Status', 4, null, 'E', 5, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (28, 'País', 'País', 4, null, 'E', 6, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (29, 'Estado', 'Estado', 4, null, 'E', 7, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (30, 'Municipio', 'Municipio', 4, null, 'E', 8, null, 1);

/*SubMenu de Controle de Acesso*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (31, 'Cadastro de Pessoas', 'Cadastro de Pessoas', 5, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (32, 'Bloqueio de Pessoas', 'Bloqueio de Pessoas', 5, null, 'E', 2, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (33, 'Cadastro de Veículos', 'Cadastro de Veículos', 5, null, 'E', 3, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (34, 'Bloqueio de Veículos', 'Bloqueio de Veículos', 5, null, 'E', 4, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (35, 'Liberar Acesso', 'Liberar Acesso', 5, null, 'E', 5, null, 1);

/*SubMenu de Ocorrencia*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (36, 'Cadastro de Ocorrência', 'Cadastro de Ocorrência', 6, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (37, 'Lista de Ocorrências', 'Lista de Ocorrências', 6, null, 'E', 2, null, 1);

/*SubMenu de Monitorar*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (38, 'Visualizar Imagem', 'Visualizar Imagem', 8, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (39, 'Recuperar Imagem', 'Recuperar Imagem', 8, null, 'E', 2, null, 1);

/*SubMenu de Rastrear*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (40, 'Rastrear Pessoas', 'Rastrear Pessoas', 9, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (41, 'Rastrear Veículos', 'Rastrear Veículos', 9, null, 'E', 2, null, 1);

/*SubMenu de Relatórios*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (42, 'OS de Segurança', 'OS de Segurança', 10, null, 'E', 1, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (43, 'OS de Serviço', 'OS de Serviço', 10, null, 'E', 2, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (44, 'OS de Limpeza', 'OS de Limpeza', 10, null, 'E', 3, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (45, 'OS com Respostas Semelhantes', 'OS com Respostas Semelhantes', 10, null, 'E', 4, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (46, 'CheckLists', 'CheckLists', 10, null, 'E', 5, null, 1);
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (47, 'Ocorrências', 'Ocorrências', 10, null, 'E', 6, null, 1);


/*Itens faltantes dos outros menus*/
insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (48, 'Perfil de Acesso', 'Perfil de Acesso', 2, 'ListaPerfil.nicbrain', 'E', 1, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (49, 'Usuários', 'Usuários', 3, 'ListaUsuarioFuncionario.nicbrain', 'E', 1, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (50, 'Cargos', 'Cargos', 4, 'ListaCargo.nicbrain', 'E', 9, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (51, 'Classificação Ocorrência', 'Classificação Ocorrência', 4, 'ListaClassificacaoOcorrencia.nicbrain', 'E', 10, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (52, 'Endereços', 'Endereços', 4, 'ListaEndereco.nicbrain', 'E', 11, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (53, 'Formulários', 'Formulários', 4, 'ListaFormulario.nicbrain', 'E', 12, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (54, 'Gravidade Ocorrência', 'Gravidade Ocorrência', 4, 'ListaGravidadeOcorrencia.nicbrain', 'E', 13, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (55, 'Grupos', 'Grupos', 4, 'ListaGrupo.nicbrain', 'E', 14, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (56, 'Menu', 'Menu', 4, 'ListaMenu.nicbrain', 'E', 15, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (57, 'Perguntas', 'Perguntas', 4, 'ListaPergunta.nicbrain', 'E', 16, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (58, 'Telefones Uteis', 'Telefones Uteis', 4, 'ListaTelefoneUtil.nicbrain', 'E', 17, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (59, 'Tipo de Envio', 'Tipo de Envio', 4, 'ListaTipoEnvio.nicbrain', 'E', 18, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (60, 'Tipo de Equipamento', 'Tipo de Equipamento', 4, 'ListaTipoEquipamento.nicbrain', 'E', 19, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (61, 'Tipo de Logradouro', 'Tipo de Logradouro', 4, 'ListaTipoLogradouro.nicbrain', 'E', 20, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (62, 'Tipo de Ocorrências', 'Tipo de Ocorrências', 4, 'ListaTipoOcorrencia.nicbrain', 'E', 21, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (63, 'Tipo de Pessoa', 'Tipo de Pessoa', 4, 'ListaTipoPessoa.nicbrain', 'E', 22, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (64, 'Tipo de Telefone', 'Tipo de Telefone', 4, 'ListaTipoTelefone.nicbrain', 'E', 23, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (65, 'Tópicos', 'Tópicos', 4, 'ListaTopico.nicbrain', 'E', 24, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (66, 'Mapa Ocorrências', 'Mapa Ocorrências', 6, 'Operacao.nicbrain', 'E', 3, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (67, 'Lista de Eventos', 'Lista de Eventos', 7, 'ListaEventoPorChecklist.nicbrain', 'E', 1, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (68, 'Mapa de Eventos', 'Mapa de Eventos', 7, 'MapaLocalPorChecklist.nicbrain', 'E', 2, null, 1);

insert into Menu (idMenu, NomeMenu, Descricaomenu, idMenuSuperior, urlMenu, ladoMenu, nrItemMenu, urlIcone, Ativo)
	values (69, 'Mapa Ocorrências - Google', 'Mapa Ocorrências  Google', 6, 'MapaLocalPorOcorrencia.nicbrain', 'E', 4, null, 1);




/*Tabela Perfil_Menu*/
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 16, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 17, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 18, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 19, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 20, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 21, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 22, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 23, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 24, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 25, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 26, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 27, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 28, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 29, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 30, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 31, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 32, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 33, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 34, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 35, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 36, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 37, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 38, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 39, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 40, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 41, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 42, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 43, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 44, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 45, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 46, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 47, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 48, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 49, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 50, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 51, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 52, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 53, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 54, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 55, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 56, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 57, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 58, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 59, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 60, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 61, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 62, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 63, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 64, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 65, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 66, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 67, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 68, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (1, 69, 1);			

insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 17, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 18, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 19, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 20, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 21, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 22, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 31, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 32, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 33, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 34, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 35, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 36, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 37, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 38, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 39, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 40, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 41, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 42, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 43, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 44, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 45, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 46, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 47, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 48, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 49, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 50, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 51, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 52, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 53, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 54, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 55, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 56, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 57, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 58, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 59, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 60, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 61, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 62, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 63, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 64, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 65, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 66, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 67, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 68, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (2, 69, 1);		

insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 36, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 37, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 38, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 39, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 40, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 41, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 42, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 43, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 44, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 45, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 46, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 47, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 48, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 49, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 50, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 51, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 52, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 53, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 54, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 55, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 56, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 57, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 58, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 59, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 60, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 61, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 62, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 63, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 64, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 65, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 66, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 67, 1);
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 68, 1);	
insert into perfil_menu (idPerfil, idMenu, Ativo) values (3, 69, 1);			

/*Tabela Modulo*/
insert into modulo (idContratante, idMenu, Ativo) value (1, 1, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 2, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 3, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 4, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 5, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 6, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 7, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 8, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 9, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 10, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 11, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 12, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 13, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 14, 1);
insert into modulo (idContratante, idMenu, Ativo) value (1, 15, 1);	

insert into modulo (idContratante, idMenu, Ativo) value (2, 1, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 2, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 3, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 4, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 6, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 7, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 8, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 10, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 11, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 12, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 13, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 14, 1);
insert into modulo (idContratante, idMenu, Ativo) value (2, 15, 1);	

insert into modulo (idContratante, idMenu, Ativo) value (3, 1, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 2, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 3, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 4, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 6, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 7, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 8, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 10, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 11, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 12, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 13, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 14, 1);
insert into modulo (idContratante, idMenu, Ativo) value (3, 15, 1);		

/*Tabela telefone_util*/
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (1, 'BOMBEIROS', '193');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (2, 'DEFESA CIVIL', '199');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (3, 'POLICIA CIVIL', '147');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (4, 'POLICIA MILITAR', '190');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (5, 'PRONTO SOCORRO', '192');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (6, 'DISQUE DENÚNCIA', '181');
insert into telefone_util (idtelefoneUtil, nomeTelefoneUtil, NrtelefoneUtil) values (7, 'POLICIA FEDERAL', '194');

/*Tabela Status*/
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (1, 'Agendada', 'Com programação realizada');
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (2, 'Em Andamento', 'Já iniciada');	
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (3, 'Aguardando Atendimento', 'Em aguardo Terceiros');	
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (4, 'Pausada', 'Em aguardo');
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (5, 'Cancelada', 'Não será realizada');	
insert into status (idStatus, nomeStatus, DescricaoStatus)	values (6, 'Finalizada', 'Finalizou a execução');		

/*Tabela Tipo_Ocorrencia*/
insert into tipo_ocorrencia (idTipoOcorrencia, NomeTipoOcorrencia, DescricaoTipoOcorrencia) values (1, 'Anomalia', 'Algo Anormal');
insert into tipo_ocorrencia (idTipoOcorrencia, NomeTipoOcorrencia, DescricaoTipoOcorrencia) values (2, 'Incidencia', 'Algo Inesperado');
insert into tipo_ocorrencia (idTipoOcorrencia, NomeTipoOcorrencia, DescricaoTipoOcorrencia) values (3, 'Emergencia', 'Algo Urgente');	

/*Tabela Gravidade_Ocorrencia*/
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (1, 'Maxima', 'Maxima Gravidade', 91, 100);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (2, 'Alta+', 'Gravidade Muito Alta', 71, 90);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (3, 'Alta', 'Alta Gravidade', 61, 70);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (4, 'Média++', 'Média/Alta Gravidade', 51, 60);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (5, 'Média+', 'Média/Média Gravidade', 41, 50);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (6, 'Média', 'Gravidade Média', 31, 40);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (7, 'Baixa++', 'Baixa/Média Gravidade', 21, 30);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (8, 'Baixa+', 'Baixa/Baixa Gravidade', 11, 20);
insert into gravidade_ocorrencia (idGravidadeOcorrencia, NomeGravidadeOcorrencia, DescricaoGravidadeocorrencia, ScoreMinimo, ScoreMaximo)
	values (9, 'Baixa', 'Baixa Gravidade', 0, 10);

/*Tabela Classificação_Ocorrencia*/
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (1, 'BRIGA');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (2, 'ALARME');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (3, 'FOGO');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (4, 'TUMULTO');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (5, 'ROUBO');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (6, 'AGUA');
insert into classificacao_ocorrencia (idClassificacaoOcorrencia, NomeClassificacaoOcorrencia) values (7, 'FERIDO');


/*Tabela Cliente*/
insert into Cliente(idCliente, idContratante, Nomefantasia, RazaoSocial, CNPJCliente, IECliente, Site, Logo, TelefoneCliente,  
						 ResponsavelCliente, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco, Ativo)
values
						(1, 1, 'Kobel', 'Kobel Ltda', '03.841.747/0001-41', 'ISENTO', 'www.kobel.com.br', null, '(11) 4427-7554', 
						 'Sidney Samitsu da Silva', '(11) 4427-7554', '(11) 99171-7827', 'sidney@kobel.com.br', 1, 1);						 

insert into Cliente(idCliente, idContratante, Nomefantasia, RazaoSocial, CNPJCliente, IECliente, Site, Logo, TelefoneCliente,  
						 ResponsavelCliente, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco, Ativo)
values
						(2, 2, 'Condominio 1', 'Condo 1', '87.694.344/0001-26', 'ISENTO', null, null, '(11) 4427-7500', 
						 'Luiz Fernando Amorim', '(11) 3723-2020', '(11) 98380-5892', 'lamorim@belfort.com.br', 2, 1);		

insert into Cliente(idCliente, idContratante, Nomefantasia, RazaoSocial, CNPJCliente, IECliente, Site, Logo, TelefoneCliente,  
						 ResponsavelCliente, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco, Ativo)
values
						(3, 2, 'Condominio 2', 'Condo 2', '92.434.304/0001-85', 'ISENTO', null, null, '(11) 4427-5475', 
						 'Luiz Fernando Amorim', '(11) 3723-2020', '(11) 98380-5892', 'lamorim@belfort.com.br', 2, 1);		

insert into Cliente(idCliente, idContratante, Nomefantasia, RazaoSocial, CNPJCliente, IECliente, Site, Logo, TelefoneCliente,  
						 ResponsavelCliente, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, IdEndereco, Ativo)
values
						(4, 3, 'Copa do Mundo 2014', 'Copa do Mundo', '54.513.020/0001-95', 'ISENTO', 'www.copa2014.gov.br', null, '(21) 2014-2014', 
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', 4, 1);		




/*Tabela Local*/
insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(1, 1, 1, 'Sede Kobel', 'www.kobel.com.br', null, null, '(11) 4427-7554', 
						 'Sidney Samitsu da Silva', '(11) 4427-7554', '(11) 99171-7827', 'sidney@kobel.com.br', 'Sede Kobel - Santo André', 30, 1);						 

insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(2, 2, 2, 'Condominio 1', null, null, null, '(11) 4427-7500', 
						 'Luiz Fernando Amorim', '(11) 3723-2020', '(11) 98380-5892', 'lamorim@belfort.com.br', 'Condominio de Teste', 20, 2);	

insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(3, 3, 2, 'Condominio 2', null, null, null, '(11) 4427-5475', 
						 'Luiz Fernando Amorim', '(11) 3723-2020', '(11) 98380-5892', 'lamorim@belfort.com.br', 'Condominio de Teste Nr 2', 15, 2);	

insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(4, 4, 3, 'Maracanã', null, null, null, '(21) 2014-2014', 
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', 'Estádio Mário Filho', 50, 5);	

insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(5, 4, 3, 'Itaquerão', null, null, null, '(21) 2014-2014', 
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', 'Arena Corinthians', 50, 6);	

insert into Local(idLocal, idCliente, idContratante, Nomelocal, Site, Logo, mapaLocal, Telefonelocal,  
						 ResponsavelLocal, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, DistanciaLimite, IdEndereco)
values
						(6, 4, 3, 'Mineirão', null, null, null, '(21) 2014-2014', 
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', 'Estádio Governador Magalhães Pinto', 50, 7);	


/*Tabela Evento*/
insert into Evento(idEvento, idLocal, idCliente, idContratante, NomeEvento,  DtHrInicioEvento, DtHrFimEvento,
						 ResponsavelEvento, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, Ativo)
values
						(1, 1, 1, 1, 'Rotina', '2014-02-18 00:00:00', '2025-01-01 00:00:00',  
						 'Sidney Samitsu da Silva', '(11) 4427-7554', '(11) 99171-7827', 'sidney@kobel.com.br', 'Sede Kobel - Santo André', 1);						 

insert into Evento(idEvento, idLocal, idCliente, idContratante, NomeEvento,  DtHrInicioEvento, DtHrFimEvento,
						 ResponsavelEvento, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, Ativo)
values
						(2, 4, 4, 3, 'Brasil x Argentina', '2014-07-12 00:00:00', '2014-07-12 00:00:00',  
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', null, 1);						 

insert into Evento(idEvento, idLocal, idCliente, idContratante, NomeEvento,  DtHrInicioEvento, DtHrFimEvento,
						 ResponsavelEvento, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, Ativo)
values
						(3, 6, 4, 3, 'Brasil x México', '2014-06-15 00:00:00', '2014-06-15 00:00:00',  
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', null, 1);						 

insert into Evento(idEvento, idLocal, idCliente, idContratante, NomeEvento,  DtHrInicioEvento, DtHrFimEvento,
						 ResponsavelEvento, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, Ativo)
values
						(4, 5, 4, 3, 'Brasil x Croácia', '2014-06-12 00:00:00', '2014-06-12 00:00:00',  
						 'José Maria Marin', '(21) 2014-2014', null, 'marin@cbf.com.br', null, 1);						 

insert into Evento(idEvento, idLocal, idCliente, idContratante, NomeEvento,  DtHrInicioEvento, DtHrFimEvento,
						 ResponsavelEvento, TelefoneResponsavel, CelularResponsavel, EmailResponsavel, Observacao, Ativo)
values
						(5, 2, 2, 2, 'Rotina Condominio', '2014-06-12 00:00:00', '2014-06-12 00:00:00',  
						 'Luiz Fernando Amorim', '(21) 1234-5678', null, 'lamorim@belfort.com.br', null, 1);						 



/*Tabela CheckList_Padrao*/
insert into checklist_padrao (IdCheckListPadrao, NomeChecklist, DescricaoCheckList, Recorrente, TempoExecEstimado, TempoTolerInicio, TempoTolerFim)
	values (1, 'Dia do Evento', 'Dia do Evento', 0, 0, 0, 0);

insert into checklist_padrao (IdCheckListPadrao, NomeChecklist, DescricaoCheckList, Recorrente, TempoExecEstimado, TempoTolerInicio, TempoTolerFim)
	values (2, 'Recepção das Equipes', 'Recepção das Equipes', 0, 0, 0, 0);

insert into checklist_padrao (IdCheckListPadrao, NomeChecklist, DescricaoCheckList, Recorrente, TempoExecEstimado, TempoTolerInicio, TempoTolerFim)
	values (3, 'Preparação dos Vestiários', 'Preparação dos Vestiários', 0, 0, 0, 0);

/*Tabela CheckList_Segmento*/
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (1,1);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (1,2);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (1,5);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (2,1);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (2,2);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (2,5);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (3,1);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (3,2);
insert into CheckList_Segmento (IdCheckListPadrao, idSegmento) values (3,5);	

/*Tabela Procedimento*/
insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (151, 'Ligar para o seu superior imediato', 'Ligar para o seu superior imediato', 0, null, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (150, 'Procedimento 3.3', 'Procedimento 3.3', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (149, 'Procedimento 3', 'Procedimento 3', 1, 150, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (148, 'Procedimento 2.2', 'Procedimento 2.2', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (147, 'Procedimento 2', 'Procedimento 2', 1, 148, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (146, 'Procedimento 1.1', 'Procedimento 1.1', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (145, 'Procedimento 1', 'Procedimento 1', 1, 146, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (144, 'Liberar area após serviço prestado', 'Liberar area após serviço prestado', 1, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (143, 'Acionar Bombeiros e Ambulância pessoalmente', 'Acionar Bombeiros e Ambulância pessoalmente', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (142, 'Acionar Bombeiros e Ambulância por rádio', 'Acionar Bombeiros e Ambulância por rádio', 1, 143, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (141, 'Anotar dados dos envolvidos manualmente', 'Anotar dados dos envolvidos manualmente', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (140, 'Cadastrar envolvidos na Blacklist do Sistema', 'Cadastrar envolvidos na Blacklist do Sistema', 0, 141, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (139, 'Liberar a area após a detenção', 'Liberar a area após a detenção', 1, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (138, 'Entregar detentos a polícia', 'Entregar detentos a polícia', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (137, 'Chamar a polícia para ajudar a deter os envolvidos na briga', 'Chamar a polícia para ajudar a deter os envolvidos na briga', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (136, 'Deter os envolvidos na briga', 'Deter os envolvidos na briga', 1, 137, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (135, 'Chamar reforços para retirar as pessoas do local', 'Chamar reforços para retirar as pessoas do local', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (134, 'Retirar as pessoas do local', 'Retirar as pessoas do local', 1, 135, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (133, 'Chamar reforços para isolar a area', 'Chamar reforços para isolar a area', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (132, 'Isolar a area', 'Isolar a area', 1, 133, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (131, 'Acionar polícia local pessoalmente', 'Acionar polícia local pessoalmente', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (130, 'Acionar polícia local por rádio', 'Acionar polícia local por rádio', 1, 131, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (129, 'Coordination of departures of doping test participants', 'Coordination of departures of doping test participants', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (128, 'Coordination of departures', 'Coordination of departures', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (127, 'Doping test', 'Doping test', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (126, 'Mixed Zone', 'Mixed Zone', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (125, 'Press-Conference', 'Press-Conference', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (124, 'Cleaning up the dressing rooms', 'Cleaning up the dressing rooms', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (123, 'Cleaning up the reserve bench', 'Cleaning up the reserve bench', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (122, 'Cleaning up the dressing rooms', 'Cleaning up the dressing rooms', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (121, 'Kick-off', 'Kick-off', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (120, 'Positioning of the bench of the match officials at the center line', 'Positioning of the bench of the match officials at the center line', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (119, 'Beginning of the pre-match cerimony', 'Beginning of the pre-match cerimony', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (118, 'Formation of the teams in front of the pitch access and last check of the players equipment by the Assistant Referees',
 'Formation of the teams in front of the pitch access and last check of the players equipment by the Assistant Referees', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (117, 'Players leave the dressing rooms', 'Players leave the dressing rooms', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (116, 'Substitutes and team officials leave the dressing rooms', 'Substitutes and team officials leave the dressing rooms', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (115, '3 minutes warning for players', '3 minutes warning for players', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (114, 'Last check of pitch marktings by Assistant Referees', 'Last check of pitch marktings by Assistant Referees', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (113, 'Check of goal nets after warm-up by Assistant Referees', 'Check of goal nets after warm-up by Assistant Referees', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (112, 'End of warm-up on the pitch', 'End of warm-up on the pitch', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (111, 'Beginning of warm-up on the pitch', 'Beginning of warm-up on the pitch', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (110, 'Colours, equipment, jewelry, names, accreditations and numbers to be checked by the 4th Official', 
	'Colours, equipment, jewelry, names, accreditations and numbers to be checked by the 4th Official', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (109, 'Pick-up start lists', 'Pick-up start lists', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (108, 'Latest arrival of Teams/Referees', 'Latest arrival of Teams/Referees', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (107, 'Arrival of Team B', 'Arrival of Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (106, 'Check-Up of catering for dressing room Team B', 'Check-Up of catering for dressing room Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (105, 'Arrival of Team A', 'Arrival of Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (104, 'Check-Up of catering for dressing room Team A', 'Check-Up of catering for dressing room Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (103, 'Arrival of Referees', 'Arrival of Referees', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (102, 'Check-Up of catering for the referees dressing room', 'Check-Up of catering for the referees dressing room', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (101, 'Checking the pitch', 'Checking the pitch', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (100, 'Arrival of the teams equipment', 	'Arrival of the teams equipment', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (99, 'Unlocking the dressing rooms', 'Unlocking the dressing rooms', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (98, 'End of Press Conference/Coordination of departure of Team B press conference participants', 
	'End of Press Conference/Coordination of departure of Team B press conference participants', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (97, 'Press Conference', 'Press Conference', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (96, 'Coordination of departures Team B', 'Coordination of departures Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (95, 'Departure of Ball Crew', 'Departure of Ball Crew', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (94, 'Training', 'Training', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (93, 'End of MCM', 'End of MCM', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (92, 'Arrival of Team B', 'Arrival of Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (91, 'MCM', 'MCM', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (90, 'Arrival of Team B MCM participants', 	'Arrival of Team B MCM participants', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (89, 'Check-Up of beverage supply for dressing room Team B', 'Check-Up of beverage supply for dressing room Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (88, 'Arrival of the teams equipment', 'Arrival of the teams equipment', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (87, 'Unlocking dressing room  Team B', 'Unlocking dressing room  Team B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (86, 'End of MCM/Coordination of departures of Team A MCM participants', 
	'End of MCM/Coordination of departures of Team A MCM participants', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (85, 'Coordination of departures Team A', 'Coordination of departures Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (84, 'MCM', 'MCM', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (83, 'Training', 'Training', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (82, 'End of Press Conference', 'End of Press Conference', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (81, 'Press Conference', 'Press Conference', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (80, 'Arrival of Team A', 'Arrival of Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (79, 'Check-Up of beverage supply for dressing room Team A', 'Check-Up of beverage supply for dressing room Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (78, 'Checking the pitch', 'Checking the pitch', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (77, 'Arrival of the teams equipment', 'Arrival of the teams equipment', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (76, 'Arrival Ball Crew', 'Arrival Ball Crew', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (75, 'Unlocking dressing room Team A', 'Unlocking dressing room Team A', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (74, 'Fechamento das instalações do estádio (acesso permitido somente ao staff e pessoas autorizadas)', 
	'Fechamento das instalações do estádio (acesso permitido somente ao staff e pessoas autorizadas)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (73, 'Desativação dos postos de segurança pública externos ao perímetro de segurança do estádio',
 'Desativação dos postos de segurança pública externos ao perímetro de segurança do estádio', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (72, 'Desativação Operacional do Centro de Comando e Controle', 'Desativação Operacional do Centro de Comando e Controle', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (71, 'Início da retirada de material de descarte e lixo do compound', 'Início da retirada de material de descarte e lixo do compound', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (70, 'Fechamento dos acessos da Zona 4 para a Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 
	'Fechamento dos acessos da Zona 4 para a Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (69, 'Armazenamento do material de descarte e lixo no compound correspondente (observar planta do estádio e checagem do pessoal de segurança)', 
	'Armazenamento do material de descarte e lixo no compound correspondente (observar planta do estádio e checagem do pessoal de segurança)', 
	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (68, 'Término do segundo turno de segurança (diurno)', 'Término do segundo turno de segurança (diurno)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (67, 'Fechamento dos portões da Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 
	'Fechamento dos portões da Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (66, 'Desativação dos postos de Stewards da Zona 3', 'Desativação dos postos de Stewards da Zona 3', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (65, 'Reunião Técnica de Avaliação da equipe da Gerência Local de Segurança', 
	'Reunião Técnica de Avaliação da equipe da Gerência Local de Segurança', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (64, 'Desativação do posto da sala de controle de dopagem (desativar somente quando os resultados do teste de dopagem estejam prontos. Após a desativação só será permitido o acesso de pessoa credenciada)', 
	'Desativação do posto da sala de controle de dopagem (desativar somente quando os resultados do teste de dopagem estejam prontos. Após a desativação só será permitido o acesso de pessoa credenciada)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (63, 'Seguranças checam a Zona 4', 'Seguranças checam a Zona 4', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (62, 'Fechamento dos portões da Zona 2 (acesso autorizado para o Staff e pessoal de limpeza)', 
	'Fechamento dos portões da Zona 2 (acesso autorizado para o Staff e pessoal de limpeza)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (61, 'Desativação dos postos de Stewards da Zona 2', 'Desativação dos postos de Stewards da Zona 2', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (60, 'Início de funcionamento do Posto Verificação de Veículos (PVV) para retirada e reposição de carga de acordo com a programação de logística, F&B e outras áreas', 
	'Início de funcionamento do Posto Verificação de Veículos (PVV) para retirada e reposição de carga de acordo com a programação de logística, F&B e outras áreas',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (59, 'Debrief do Centro de Comando e Controle', 	'Debrief do Centro de Comando e Controle', 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (58, 'Seguranças checam a Zona 3', 'Seguranças checam a Zona 3', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (57, 'Desmobilização das unidades de Pronta Resposta da segurança pública', 
	'Desmobilização das unidades de Pronta Resposta da segurança pública', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (56, 'Stewards e seguranças checam a Zona 2', 'Stewards e seguranças checam a Zona 2', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (55, 'Início do turno de segurança (noturno)', 'Início do turno de segurança (noturno)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (54, 'Desativação dos postos de Stewards da Zona 1', 'Desativação dos postos de Stewards da Zona 1',	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (53, 'Início dos deslocamentos das equipes A e B (estádio - hotel)', 'Início dos deslocamentos das equipes A e B (estádio - hotel)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (52, 'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 
	'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (51, 'Briefing dos Supervisores de segurança privada do turno do dia', 'Briefing dos Supervisores de segurança privada do turno do dia', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (50, 'Início da entrevista coletiva dos dirigentes das equipes A e B', 	'Início da entrevista coletiva dos dirigentes das equipes A e B',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (49, 'Briefing dos Supervisores de segurança privada do turno noturno', 	'Briefing dos Supervisores de segurança privada do turno noturno',
 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (48, 'Revista Geral do turno noturno', 'Revista Geral do turno noturno', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (47, 'Previsão de término do jogo (posicionamento de Stewards e segurança privada para retirada das equipes, árbitros e delegados da FIFA)', 
	'Previsão de término do jogo (posicionamento de Stewards e segurança privada para retirada das equipes, árbitros e delegados da FIFA)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (46, 'Posicionamento dos vigilantes para o Media Center', 'Posicionamento dos vigilantes para o Media Center', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (45, 'Abertura dos Portões de saída de público ( Supervisor deverá conferir que os portões estejam abertos)', 
	'Abertura dos Portões de saída de público ( Supervisor deverá conferir que os portões estejam abertos)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (44, 'Inicio do segundo tempo (reposicionamento dos Stewards Z1 e Z2)', 'Inicio do segundo tempo (reposicionamento dos Stewards Z1 e Z2)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (43, 'Término do primeiro tempo e Início do intervalo (acompanhamento dos Stewards da unidade de reação Z1)',
 'Término do primeiro tempo e Início do intervalo (acompanhamento dos Stewards da unidade de reação Z1)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (42, 'Reposicionamento dos Stewards para o intervalo (Z1 e Z2)', 
	'Reposicionamento dos Stewards para o intervalo (Z1 e Z2)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (41, 'Início do Jogo', 'Início do Jogo', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (40, 'Início da cerimônia do pré-jogo (entrada das equipes, árbitros e delegados da FIFA)', 
	'Início da cerimônia do pré-jogo (entrada das equipes, árbitros e delegados da FIFA)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (39, 'Término do aquecimento (retirada dos jogadores do campo)', 'Término do aquecimento (retirada dos jogadores do campo)',
 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (38, 'Preparação do acesso de entrada das equipes, árbitros e delegados da FIFA (posicionamento dos Stewards)', 
	'Preparação do acesso de entrada das equipes, árbitros e delegados da FIFA (posicionamento dos Stewards)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (37, 'Início do aquecimento das equipes (goleiros e demais jogadores)', 
	'Início do aquecimento das equipes (goleiros e demais jogadores)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (36, 'Implantação da unidade de reação na Zona 1 (Stweards)', 'Implantação da unidade de reação na Zona 1 (Stweards)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (35, 'Chegada das Equipes A e B', 'Chegada das Equipes A e B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (34, 'Preparar o receptivo de chegada das equipes A e B', 'Preparar o receptivo de chegada das equipes A e B', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (33, 'Início das atividades do estádio (sonorização, receptivo do público, orientações de segurança, visitação as áreas comerciais)',
 'Início das atividades do estádio (sonorização, receptivo do público, orientações de segurança, visitação as áreas comerciais)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (32, 'Início do deslocamento da Equipe B (hotel - estádio)', 
	'Início do deslocamento da Equipe B (hotel - estádio)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (31, 'Início do deslocamento da Equipe A (hotel - estádio)', 'Início do deslocamento da Equipe A (hotel - estádio)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (30, 'Posicionamento dos Stewards na Zona 1', 'Posicionamento dos Stewards na Zona 1', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (29, 'Instalação do Posto de segurança da Sala de Controle de Dopagem', 'Instalação do Posto de segurança da Sala de Controle de Dopagem',
 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (28, 'Chegada dos árbitros e delegados da FIFA', 'Chegada dos árbitros e delegados da FIFA', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (27, 'Chegada dos VIP/VVIPs (Protocolo da FIFAs)', 'Chegada dos VIP/VVIPs (Protocolo da FIFAs)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (26, 'Posicionamento das Unidades de Pronta Resposta', 'Posicionamento das Unidades de Pronta Resposta', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (25, 'Abertura dos portões para os espectadores', 'Abertura dos portões para os espectadores', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (24, 'Entrevista Coletiva = Media Center', 'Entrevista Coletiva = Media Center', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (23, 'Reunião de Nivelamento Operacional entre os dirigentes da segurança pública e privada',
 'Reunião de Nivelamento Operacional entre os dirigentes da segurança pública e privada', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (22, 'Término de entregas de mercadorias (6 horas antes do inicio do jogo)', 
	'Término de entregas de mercadorias (6 horas antes do inicio do jogo)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (21, 'Checagem das áreas da ZONA 2 pelos seguranças (camarotes, VVIPs e VIPs)', 
	'Checagem das áreas da ZONA 2 pelos seguranças (camarotes, VVIPs e VIPs)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (20, 'Checagem das áreas da ZONA 2 pelos Stewards (vomitórios e arquibancadas)',
 'Checagem das áreas da ZONA 2 pelos Stewards (vomitórios e arquibancadas)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (19, 'Início das atividades operacionais do Centro de Comando e Controle', 
	'Início das atividades operacionais do Centro de Comando e Controle',
 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (18, 'Início das atividades do segundo turno de segurança', 'Início das atividades do segundo turno de segurança', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (17, 'Posicionamento dos respetivos postos de trabalho (Stewards e seguranças)', 
	'Posicionamento dos respetivos postos de trabalho (Stewards e seguranças)',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (16, 'Briefing dos Stewards e Seguranças que atuarem no perímetro de segurança', 
	'Briefing dos Stewards e Seguranças que atuarem no perímetro de segurança', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (15, 'Revista Geral do segundo turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 
	'Revista Geral do segundo turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (14, 'Início das atividades de segurança pública (fora do perímetro de segurança)', 
	'Início das atividades de segurança pública (fora do perímetro de segurança)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (13, 'Término do serviço de segurança do turno noturno', 'Término do serviço de segurança do turno noturno', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (12, 'Ativação das Zonas de Credenciamento', 'Ativação das Zonas de Credenciamento', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (11, 'A segurança privada realiza verificação física sobre a condição dos perímetros (interno e externo)', 
	'A segurança privada realiza verificação física sobre a condição dos perímetros (interno e externo)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (10, 'Ativação dos Mag & Bag', 'Ativação dos Mag & Bag', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (9, 'Início do primeiro turno de segurança (diurno)', 'Início do primeiro turno de segurança (diurno)',
 	0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (8, 'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 
	'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (7, 'Briefing dos Supervisores de segurança privada do turno da noite', 
	'Briefing dos Supervisores de segurança privada do turno da noite',
	 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (6, 'Briefing dos Supervisores de segurança privada do turno do dia', 
	'Briefing dos Supervisores de segurança privada do turno do dia', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (5, 'Término da Varredura', 	'Término da Varredura', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (4, 'Revista Geral do primeiro turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 
	'Revista Geral do primeiro turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (3, 'Briefing para os supervisores da segurança privada do primeiro turno', 
	'Briefing para os supervisores da segurança privada do primeiro turno', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (2, 'Apresentação dos supervisores do primeiro turno de segurança privada', 
	'Apresentação dos supervisores do primeiro turno de segurança privada', 0, 151, 0,0,0, null );

insert into procedimento (idProcedimento, NomeProcedimento, DescricaoProcedimento, mandatorio, idProcedimentoAuxiliar, TempoExecEstimado, 
	TempoTolerInicio, TempoTolerFim, IdFormulario) 	
values (1, 'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)', 
	'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)', 0, 151, 120,0,0, null );


/* Tabela checklist_procedimento */
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 1, 1);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 2, 2);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 3, 3);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 4, 4);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 5, 5);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 6, 6);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 7, 7);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 8, 8);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 9, 9);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 10, 10);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 11, 11);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 12, 12);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 13, 13);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 14, 14);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 15, 15);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 16, 16);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 17, 17);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 18, 18);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 19, 19);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 20, 20);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 21, 21);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 22, 22);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 23, 23);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 24, 24);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 25, 25);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 26, 26);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 27, 27);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 28, 28);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 29, 29);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 30, 30);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 31, 31);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 32, 32);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 33, 33);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 34, 34);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 35, 35);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 36, 36);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 37, 37);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 38, 38);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 39, 39);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 40, 40);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 41, 41);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 42, 42);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 43, 43);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 44, 44);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 45, 45);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 46, 46);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 47, 47);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 48, 48);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 49, 49);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 50, 50);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 51, 51);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 52, 52);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 53, 53);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 54, 54);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 55, 55);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 56, 56);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 57, 57);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 58, 58);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 59, 59);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 60, 60);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 61, 61);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 62, 62);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 63, 63);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 64, 64);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 65, 65);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 66, 66);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 67, 67);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 68, 68);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 69, 69);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 70, 70);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 71, 71);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 72, 72);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 73, 73);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (1, 74, 74);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 75, 75);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 76, 76);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 77, 77);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 78, 78);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 79, 79);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 80, 80);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 81, 81);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 82, 82);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 83, 83);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 84, 84);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 85, 85);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 86, 86);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 87, 87);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 88, 88);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 89, 89);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 90, 90);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 91, 91);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 92, 92);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 93, 93);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 94, 94);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 95, 95);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 96, 96);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 97, 97);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (2, 98, 98);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 99, 99);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 100, 100);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 101, 101);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 102, 102);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 103, 103);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 104, 104);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 105, 105);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 106, 106);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 107, 107);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 108, 108);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 109, 109);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 110, 110);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 111, 111);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 112, 112);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 113, 113);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 114, 114);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 115, 115);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 116, 116);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 117, 117);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 118, 118);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 119, 119);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 120, 120);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 121, 121);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 122, 122);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 123, 123);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 124, 124);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 125, 125);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 126, 126);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 127, 127);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 128, 128);
insert into checklist_procedimento (IdCheckListPadrao, IdProcedimento, NrItem) values (3, 129, 129);


/*Tabela CheckList */
insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (1, 2, 4, 4, 3, 'Dia do Evento', 'Dia do Evento', 0,
		640, 0, 0, '2014-06-12 10:00:00', '2014-06-12 20:00:00',
		null, null, null, null, 1, 2, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (2, 2, 4, 4, 3, 'Recepção das Equipes', 'Recepção das Equipes', 0,
		60, 0, 0, '2014-06-12 14:00:00', '2014-06-12 15:00:00',
		null, null, null, null, 1, 2, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (3, 2, 4, 4, 3, 'Preparação dos Vestiários', 'Preparação dos Vestiários', 0,
		60, 0, 0, '2014-06-12 13:00:00', '2014-06-12 14:00:00',
		null, null, null, null, 1, 2, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (1, 3, 6, 4, 3, 'Dia do Evento', 'Dia do Evento', 0,
		640, 0, 0, '2014-06-12 10:00:00', '2014-06-12 20:00:00',
		null, null, null, null, 1, 3, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (2, 3, 6, 4, 3, 'Recepção das Equipes', 'Recepção das Equipes', 0,
		60, 0, 0, '2014-06-12 14:00:00', '2014-06-12 15:00:00',
		null, null, null, null, 1, 3, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (3, 3, 6, 4, 3, 'Preparação dos Vestiários', 'Preparação dos Vestiários', 0,
		60, 0, 0, '2014-06-12 13:00:00', '2014-06-12 14:00:00',
		null, null, null, null, 1, 3, 1, 1)	;


insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (1, 4, 5, 4, 3, 'Dia do Evento', 'Dia do Evento', 0,
		640, 0, 0, '2014-06-12 10:00:00', '2014-06-12 20:00:00',
		null, null, null, null, 1, 4, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (2, 4, 5, 4, 3, 'Recepção das Equipes', 'Recepção das Equipes', 0,
		60, 0, 0, '2014-06-12 14:00:00', '2014-06-12 15:00:00',
		null, null, null, null, 1, 4, 1, 1)	;

insert into checklist ( IdChecklist, idEvento, IdLocal, IdCliente, IdContratante, NomeCheckList, DescricaoCheckList, Recorrente, 
	TempoExecEstimado, TempoTolerInicio, TempoTolerFim, DthrInicioPrevisto, DthrFimPrevisto,
	dtHrinicioRealizado, DthrFimRealizado, latitude, longitude, idStatus, idFuncionarioResp, IdCheckListPadrao, Ativo)
values (3, 4, 5, 4, 3, 'Preparação dos Vestiários', 'Preparação dos Vestiários', 0,
		60, 0, 0, '2014-06-12 13:00:00', '2014-06-12 14:00:00',
		null, null, null, null, 1, 4, 1, 1)	;


/*Tabela CheckList_Ocorrencia*/
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (1,1,'Briga', 'Checklist Briga');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (2,2,'Alarme', 'Checklist Alarme');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (3,3,'Fogo', 'Checklist Fogo');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (4,4,'Tumulto', 'Checklist Tumulto');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (5,5,'Roubo', 'Checklist Roubo');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (6,6,'Água', 'Checklist Água');
insert into checklist_ocorrencia (idChecklistOcorrencia, idClassificacaoOcorrencia, NomeChecklistOcorrencia, DescricaoChecklistOcorrencia)
	values (7,7,'Ferido', 'Checklist Ferido');

/*Tabela CheckList_Segmento_Ocorrencia*/
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 1, 1);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 2, 2);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 3, 3);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 4, 4);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 5, 5);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 6, 6);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (1, 7, 7);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 1, 1);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 2, 2);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 3, 3);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 4, 4);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 5, 5);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 6, 6);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (2, 7, 7);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 1, 1);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 2, 2);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 3, 3);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 4, 4);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 5, 5);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 6, 6);
insert into CheckList_Segmento_Ocorrencia (idSegmento, idChecklistOcorrencia, idClassificacaoOcorrencia) values (5, 7, 7);	

/*Tabela Checklist_procedimento_ocorrencia*/
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	130	,	1	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	132	,	2	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	134	,	3	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	136	,	4	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	138	,	5	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	139	,	6	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	140	,	7	);
insert into Checklist_procedimento_ocorrencia values (	1	,	1	,	142	,	1	);
insert into Checklist_procedimento_ocorrencia values (	7	,	7	,	132	,	1	);
insert into Checklist_procedimento_ocorrencia values (	7	,	7	,	134	,	2	);
insert into Checklist_procedimento_ocorrencia values (	7	,	7	,	144	,	3	);
insert into Checklist_procedimento_ocorrencia values (	2	,	2	,	145	,	1	);
insert into Checklist_procedimento_ocorrencia values (	2	,	2	,	147	,	2	);
insert into Checklist_procedimento_ocorrencia values (	2	,	2	,	149	,	3	);
insert into Checklist_procedimento_ocorrencia values (	3	,	3	,	145	,	1	);
insert into Checklist_procedimento_ocorrencia values (	3	,	3	,	147	,	2	);
insert into Checklist_procedimento_ocorrencia values (	3	,	3	,	149	,	3	);
insert into Checklist_procedimento_ocorrencia values (	4	,	4	,	145	,	1	);
insert into Checklist_procedimento_ocorrencia values (	4	,	4	,	147	,	2	);
insert into Checklist_procedimento_ocorrencia values (	4	,	4	,	149	,	3	);
insert into Checklist_procedimento_ocorrencia values (	5	,	5	,	145	,	1	);
insert into Checklist_procedimento_ocorrencia values (	5	,	5	,	147	,	2	);
insert into Checklist_procedimento_ocorrencia values (	5	,	5	,	149	,	3	);
insert into Checklist_procedimento_ocorrencia values ( 	6	,	6	,	145	,	1	);
insert into Checklist_procedimento_ocorrencia values (	6	,	6	,	147	,	2	);
insert into Checklist_procedimento_ocorrencia values (	6	,	6	,	149	,	3	);

/*Tabela Mensagem */
insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (1, 'Início na data e hora prevista', 'Sempre que um checklist ou uma atividade é iniciado na data e hora prevista', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (2, 'Inicio dentro do periodo de tolerância', 'Sempre que um checklist ou uma atividade é iniciado dentro do periodo de tolerância', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (3, '25% do tempo percorrido', 'Sempre que um checklist ou uma atividade atingir 25% do seu tempo de execução', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (4, '50% do tempo percorrido', 'Sempre que um checklist ou uma atividade atingir 50% do seu tempo de execução', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (5, '75% do tempo percorrido', 'Sempre que um checklist ou uma atividade atingir 75% do seu tempo de execução', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (6, 'Parabéns, atividade concluída com êxito', 'Sempre que uma atividade for finalizada com êxito na data e hora prevista', 0, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (7, 'Atividade concluída dentro do período de tolerância com êxito', 'Sempre que uma atividade for finalizada com êxito dentro do período de tolerância',
	 0, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (8, 'Parabéns, checklist concluído com êxito', 'Sempre que um checklist for finalizado com êxito na data e hora prevista', 1, 0, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (9, 'Checklist concluído com êxito dentro do período de tolerância com êxito', 
			'Sempre que um checklist for finalizado com êxito dentro do período de tolerância', 1, 1, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (10, 'Produtividade da atividade', 'Ao encerrar um checklist, enviar aviso com o % de produtividade de cada atividade do checklist', 1, 0, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (11, 'Produtividade do checklist', 'Ao encerrar um checklist, enviar aviso com o % de produtividade do checklist  e de cada atividade do checklist',
	 1, 0, 1, 1);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (12, 'Início não realizado na data e hora prevista', 'Sempre que um checklist ou atividade não for iniciado na data/hora prevista', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (13, 'Início com atraso', 'Sempre que um checklist ou atividade for iniciado após a data/hora prevista', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (14, 'Estouro do tempo de tolerância para início (quando parametrizado tolerância):',
	 'Sempre que estourar o tempo de tolerância de início de um checklist ou atividade e esta não ter sido iniciada', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (15, 'Estouro de data/hora prevista para finalização', 'Sempre que um checklist ou atividade não for finalizado na data/hora prevista', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (16, 'Estouro do tempo previsto para finalização (quando parametrizado por período e não com dt/hh de inicio e fim):', 
		'Sempre que estourar o tempo previsto de execução de um checklist ou atividade', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (17, 'Início com atraso:', 'Sempre que um checklist ou uma atividade for iniciado depois do horário de início previsto', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (18, 'Finalizado com atraso:', 'Sempre que um checklist ou uma atividade for concluído depois do horário de término previsto', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (19, 'Checklist ou atividade Pausada:', 'Sempre que um checklist ou uma atividade é pausado', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (20, 'Checklist ou atividade Cancelada:', 'Sempre que um checklist ou uma atividade é cancelado', 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (21, 'Checklist e atividades pendentes:', 
		'Sempre duas (2) horas após o final do tempo previsto de término do checklist. Caso não exista término previsto, considerar duas (2) horas após o término do turno.',
		 1, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (22, 'Clientes não visitados na semana:', 'Todas as segundas-feiras reportando se na semana anterior não houve agendamento de checklist para o cliente', 
		1, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (23, 'Atividade por período não iniciada - mais a msg específica de TI, T2 e T3.', 
		'Deverá verificar qual o período da atividade e calcular e comparar se o tempo restante para o término do checklist é suficiente para a execução', 
		0, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (24, 'Realização fora do local designado', 
		'Ao iniciar um checklist ou atividade, comparar a lat/long capturada pelo aplicativo mobile no check de início com a lat/long do cadastro do local do cliente/checklist. Se a distancia exceder uma distância previamente cadastrada no local, enviar alerta',
		 1, 1, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (25, 'Alerta manual', 'Permitir escrever mensagem para envio', 0, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (26, 'Alerta de equipamento com defeito:', 'Verificação automática se equipamentos estão em funcionamento', 0, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (27, 'Item Normas e procedimentos / treinamento avaliado como Ruim - vide relatório de OSs', 
		'Quando o campo 3. Normas e procedimento / treinamentos do tópico B do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim', 
		1, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (28, 'Itens SARCC RQO e Nextel / Celular avaliado como Ruim - vide relatório de OSs', 
		'Quando os campos SARCC RQO e Nextel / Celular do tópico C do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim', 1, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (29, 'Item Normas e procedimentos / treinamento avaliado como Ruim menos de 10 vezes no mês', 
		'Quando o campo 3. Normas e procedimento / treinamentos do tópico B do formulário de OS (Segurança, Serviços e Limpeza) for preenchido com ruim menos de 10 vezes no mês anterior. Calcular todo dia 01 do mês',
		 0, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (30, 'Respostas semelhantes nas OSs do dia - vide relatório de OSs', 
		'Comparar para um mesmo usuário responsável pelas atividades de um dia de preenchimento de OSs (Segurança, Serviços e Limpeza), se para cada resposta preenchida em campos de pontuação, obtiver preenchimento das OSs semelhantes mediante a um índice de 95% de respostas idênticas',
		 0, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (31, 'Respostas pontuadas como RUIM nas OSs - vide relatório de OSs', 
		'Analisar as OS após o preenchimento e enviar os campos que contenham a pontuação como Ruim', 1, 0, 1, 2);

insert into mensagem (idMensagem, TextoMensagem, DescricaoMensagem, CheckList, Atividade, Ativo, idTipoMsg)
	values (32, ' Alerta Mensal de Desempenho (tirar dúvida sobre este alerta)', 'Enviar todo dia 01 do mês', 0, 0, 1, 2);


/* Tabela grupo_mensagem */
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 1, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 2, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 3, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 4, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 5, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 6, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 7, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 8, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 9, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 10, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 11, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 12, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 13, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 14, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 15, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 16, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 17, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 18, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 19, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 20, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 21, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 22, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 23, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 24, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 26, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 12, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 13, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 14, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 15, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 16, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 17, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 18, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 19, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 20, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 21, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 22, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 23, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 24, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 26, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 27, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 28, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 29, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 30, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 31, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 32, 1, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 1, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 2, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 3, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 4, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 5, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 6, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 7, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 8, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 9, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 10, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 11, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 10, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 11, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 13, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 14, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 15, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 16, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 17, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 18, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 19, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 20, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 21, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 22, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 23, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 24, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (1, 26, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 12, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 13, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 14, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 15, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 16, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 17, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 18, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 19, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 20, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 21, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 22, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 23, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 24, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 26, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 27, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 28, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 29, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 30, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 31, 2, 1);
insert into grupo_mensagem (IdGrupo, IdMensagem, IdTipoEnvio, Ativo) values (2, 32, 2, 1);


/* Tabela cliente_mensagem*/
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 1, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 2, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 3, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 4, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 5, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 6, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 7, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 8, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 9, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 10, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 11, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 12, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 13, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 14, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 15, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 16, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 17, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 18, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 19, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 20, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 21, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 22, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 23, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 24, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 25, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 26, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 27, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 28, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 29, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 30, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 31, 1);
insert into cliente_mensagem (IdCliente, IdContratante, IdMensagem, Ativo) values (4, 3, 32, 1);

/* Tabela checklist_mensagem */
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 1, 1);  
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 2, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 3, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 4, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 5, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 8, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 9, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 10, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 11, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 12, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 13, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 14, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 15, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 16, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 17, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 18, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 19, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 20, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 21, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 22, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 24, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 27, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 28, 1);
insert into checklist_mensagem (IdCheckList, IdEvento, IdLocal, IdCliente, IdContratante, IdMensagem, Ativo) values (1, 2, 4, 4, 3, 31, 1);




/*Tabela Atividade */
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (1, 1, 2, 4, 4, 3, 1, 1, 1,
		'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)', 'Varredura antibombas (VVIP, árbitros, vestiário das delegações e campo)',
		120, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 12:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (2,	1,	2,	4,	4,	3,	2,	2,	1,
		'Apresentação dos supervisores do primeiro turno de segurança privada', 'Apresentação dos supervisores do primeiro turno de segurança privada',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (3,	1,	2,	4,	4,	3,	3,	3,	1,
		'Briefing para os supervisores da segurança privada do primeiro turno', 'Briefing para os supervisores da segurança privada do primeiro turno',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);
				
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (4,	1,	2,	4,	4,	3,	4,	4,	1,
		'Revista Geral do primeiro turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 'Revista Geral do primeiro turno do dia (50% da força de trabalho do turno diurno de 12 horas)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (5,	1,	2,	4,	4,	3,	5,	5,	1,
		'Término da Varredura', 'Término da Varredura',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (6,	1,	2,	4,	4,	3,	6,	6,	1,
		'Briefing dos Supervisores de segurança privada do turno do dia', 'Briefing dos Supervisores de segurança privada do turno do dia',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (7,	1,	2,	4,	4,	3,	7,	7,	1,
		'Briefing dos Supervisores de segurança privada do turno da noite', 'Briefing dos Supervisores de segurança privada do turno da noite',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (8,	1,	2,	4,	4,	3,	8,	8,	1,
		'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (9,	1,	2,	4,	4,	3,	9,	9,	1,
		'Início do primeiro turno de segurança (diurno)', 'Início do primeiro turno de segurança (diurno)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (10,	1,	2,	4,	4,	3,	10,	10,	1,
		'Ativação dos Mag & Bag', 'Ativação dos Mag & Bag',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (11,	1,	2,	4,	4,	3,	11,	11,	1,
		'A segurança privada realiza verificação física sobre a condição dos perímetros (interno e externo)', 'A segurança privada realiza verificação física sobre a condição dos perímetros (interno e externo)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (12,	1,	2,	4,	4,	3,	12,	12,	1,
		'Ativação das Zonas de Credenciamento', 'Ativação das Zonas de Credenciamento',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (13,	1,	2,	4,	4,	3,	13,	13,	1,
		'Término do serviço de segurança do turno noturno', 'Término do serviço de segurança do turno noturno',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);
				
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (14,	1,	2,	4,	4,	3,	14,	14,	1,
		'Início das atividades de segurança pública (fora do perímetro de segurança)', 'Início das atividades de segurança pública (fora do perímetro de segurança)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (15,	1,	2,	4,	4,	3,	15,	15,	1,
		'Revista Geral do segundo turno do dia (50% da força de trabalho do turno diurno de 12 horas)', 'Revista Geral do segundo turno do dia (50% da força de trabalho do turno diurno de 12 horas)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (16,	1,	2,	4,	4,	3,	16,	16,	1,
		'Briefing dos Stewards e Seguranças que atuarem no perímetro de segurança', 'Briefing dos Stewards e Seguranças que atuarem no perímetro de segurança',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (17,	1,	2,	4,	4,	3,	17,	17,	1,
		'Posicionamento dos respetivos postos de trabalho (Stewards e seguranças)', 'Posicionamento dos respetivos postos de trabalho (Stewards e seguranças)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (18,	1,	2,	4,	4,	3,	18,	18,	1,
		'Início das atividades do segundo turno de segurança', 'Início das atividades do segundo turno de segurança',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (19,	1,	2,	4,	4,	3,	19,	19,	1,
		'Início das atividades operacionais do Centro de Comando e Controle', 'Início das atividades operacionais do Centro de Comando e Controle',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (20,	1,	2,	4,	4,	3,	20,	20,	1,
		'Checagem das áreas da ZONA 2 pelos Stewards (vomitórios e arquibancadas)', 'Checagem das áreas da ZONA 2 pelos Stewards (vomitórios e arquibancadas)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (21,	1,	2,	4,	4,	3,	21,	21,	1,
		'Checagem das áreas da ZONA 2 pelos seguranças (camarotes, VVIPs e VIPs)', 'Checagem das áreas da ZONA 2 pelos seguranças (camarotes, VVIPs e VIPs)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (22,	1,	2,	4,	4,	3,	22,	22,	1,
		'Término de entregas de mercadorias (6 horas antes do inicio do jogo)', 'Término de entregas de mercadorias (6 horas antes do inicio do jogo)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (23,	1,	2,	4,	4,	3,	23,	23,	1,
		'Reunião de Nivelamento Operacional entre os dirigentes da segurança pública e privada', 'Reunião de Nivelamento Operacional entre os dirigentes da segurança pública e privada',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);
				
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (24,	1,	2,	4,	4,	3,	24,	24,	1,
		'Entrevista Coletiva = Media Center', 'Entrevista Coletiva = Media Center',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (25,	1,	2,	4,	4,	3,	25,	25,	1,
		'Abertura dos portões para os espectadores', 'Abertura dos portões para os espectadores',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (26,	1,	2,	4,	4,	3,	26,	26,	1,
		'Posicionamento das Unidades de Pronta Resposta', 'Posicionamento das Unidades de Pronta Resposta',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (27,	1,	2,	4,	4,	3,	27,	27,	1,
		'Chegada dos VIP/VVIPs (Protocolo da FIFAs)', 'Chegada dos VIP/VVIPs (Protocolo da FIFAs)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (28,	1,	2,	4,	4,	3,	28,	28,	1,
		'Chegada dos árbitros e delegados da FIFA', 'Chegada dos árbitros e delegados da FIFA',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (29,	1,	2,	4,	4,	3,	29,	29,	1,
		'Instalação do Posto de segurança da Sala de Controle de Dopagem', 'Instalação do Posto de segurança da Sala de Controle de Dopagem',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (30,	1,	2,	4,	4,	3,	30,	30,	1,
		'Posicionamento dos Stewards na Zona 1', 'Posicionamento dos Stewards na Zona 1',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (31,	1,	2,	4,	4,	3,	31,	31,	1,
		'Início do deslocamento da Equipe A (hotel - estádio)', 'Início do deslocamento da Equipe A (hotel - estádio)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (32,	1,	2,	4,	4,	3,	32,	32,	1,
		'Início do deslocamento da Equipe B (hotel - estádio)', 'Início do deslocamento da Equipe B (hotel - estádio)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (33,	1,	2,	4,	4,	3,	33,	33,	1,
		'Início das atividades do estádio (sonorização, receptivo do público, orientações de segurança, visitação as áreas comerciais)', 'Início das atividades do estádio (sonorização, receptivo do público, orientações de segurança, visitação as áreas comerciais)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);
				
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (34,	1,	2,	4,	4,	3,	34,	34,	1,
		'Preparar o receptivo de chegada das equipes A e B', 'Preparar o receptivo de chegada das equipes A e B',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (35,	1,	2,	4,	4,	3,	35,	35,	1,
		'Chegada das Equipes A e B', 'Chegada das Equipes A e B',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (36,	1,	2,	4,	4,	3,	36,	36,	1,
		'Implantação da unidade de reação na Zona 1 (Stweards)', 'Implantação da unidade de reação na Zona 1 (Stweards)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (37,	1,	2,	4,	4,	3,	37,	37,	1,
		'Início do aquecimento das equipes (goleiros e demais jogadores)', 'Início do aquecimento das equipes (goleiros e demais jogadores)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (38,	1,	2,	4,	4,	3,	38,	38,	1,
		'Preparação do acesso de entrada das equipes, árbitros e delegados da FIFA (posicionamento dos Stewards)', 'Preparação do acesso de entrada das equipes, árbitros e delegados da FIFA (posicionamento dos Stewards)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (39,	1,	2,	4,	4,	3,	39,	39,	1,
		'Término do aquecimento (retirada dos jogadores do campo)', 'Término do aquecimento (retirada dos jogadores do campo)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (40,	1,	2,	4,	4,	3,	40,	40,	1,
		'Início da cerimônia do pré-jogo (entrada das equipes, árbitros e delegados da FIFA)', 'Início da cerimônia do pré-jogo (entrada das equipes, árbitros e delegados da FIFA)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (41,	1,	2,	4,	4,	3,	41,	41,	1,
		'Início do Jogo', 'Início do Jogo',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (42,	1,	2,	4,	4,	3,	42,	42,	1,
		'Reposicionamento dos Stewards para o intervalo (Z1 e Z2)', 'Reposicionamento dos Stewards para o intervalo (Z1 e Z2)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (43,	1,	2,	4,	4,	3,	43,	43,	1,
		'Término do primeiro tempo e Início do intervalo (acompanhamento dos Stewards da unidade de reação Z1)', 'Término do primeiro tempo e Início do intervalo (acompanhamento dos Stewards da unidade de reação Z1)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);
				
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (44,	1,	2,	4,	4,	3,	44,	44,	1,
		'Inicio do segundo tempo (reposicionamento dos Stewards Z1 e Z2)', 'Inicio do segundo tempo (reposicionamento dos Stewards Z1 e Z2)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (45,	1,	2,	4,	4,	3,	45,	45,	1,
		'Abertura dos Portões de saída de público ( Supervisor deverá conferir que os portões estejam abertos)', 'Abertura dos Portões de saída de público ( Supervisor deverá conferir que os portões estejam abertos)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (46,	1,	2,	4,	4,	3,	46,	46,	1,
		'Posicionamento dos vigilantes para o Media Center', 'Posicionamento dos vigilantes para o Media Center',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (47,	1,	2,	4,	4,	3,	47,	47,	1,
		'Previsão de término do jogo (posicionamento de Stewards e segurança privada para retirada das equipes, árbitros e delegados da FIFA)', 'Previsão de término do jogo (posicionamento de Stewards e segurança privada para retirada das equipes, árbitros e delegados da FIFA)',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (48,	1,	2,	4,	4,	3,	48,	48,	1,
		'Revista Geral do turno noturno', 'Revista Geral do turno noturno',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (49,	1,	2,	4,	4,	3,	49,	49,	1,
		'Briefing dos Supervisores de segurança privada do turno noturno', 'Briefing dos Supervisores de segurança privada do turno noturno',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
				NomeAtividade, DescricaoAtividade, 
				TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
				DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
				latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (50,	1,	2,	4,	4,	3,	50,	50,	1,
		'Início da entrevista coletiva dos dirigentes das equipes A e B', 'Início da entrevista coletiva dos dirigentes das equipes A e B',
		0, 0, 0, 
		'2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
		null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (51,          1,            2,            4,            4,            3,            51,          51,          1,
                               'Briefing dos Supervisores de segurança privada do turno do dia', 'Briefing dos Supervisores de segurança privada do turno do dia',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (52,          1,            2,            4,            4,            3,            52,          52,          1,
                               'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)', 'Início da troca dos turnos de serviço (ajustes e orientações específicas do posto)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (53,          1,            2,            4,            4,            3,            53,          53,          1,
                               'Início dos deslocamentos das equipes A e B (estádio - hotel)', 'Início dos deslocamentos das equipes A e B (estádio - hotel)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (54,          1,            2,            4,            4,            3,            54,          54,          1,
                               'Desativação dos postos de Stewards da Zona 1', 'Desativação dos postos de Stewards da Zona 1',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);		

							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (55,          1,            2,            4,            4,            3,            55,          55,          1,
                               'Início do turno de segurança (noturno)', 'Início do turno de segurança (noturno)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (56,          1,            2,            4,            4,            3,            56,          56,          1,
                               'Stewards e seguranças checam a Zona 2', 'Stewards e seguranças checam a Zona 2',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);							   
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (57,          1,            2,            4,            4,            3,            57,          57,          1,
                               'Desmobilização das unidades de Pronta Resposta da segurança pública', 'Desmobilização das unidades de Pronta Resposta da segurança pública',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (58,          1,            2,            4,            4,            3,            58,          58,          1,
                               'Seguranças checam a Zona 3', 'Seguranças checam a Zona 3',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (59,          1,            2,            4,            4,            3,            59,          59,          1,
                               'Debrief do Centro de Comando e Controle', 'Debrief do Centro de Comando e Controle',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (60,          1,            2,            4,            4,            3,            60,          60,          1,
                               'Início de funcionamento do Posto Verificação de Veículos (PVV) para retirada e reposição de carga de acordo com a programação de logística, F&B e outras áreas', 'Início de funcionamento do Posto Verificação de Veículos (PVV) para retirada e reposição de carga de acordo com a programação de logística, F&B e outras áreas',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (61,          1,            2,            4,            4,            3,            61,          61,          1,
                               'Desativação dos postos de Stewards da Zona 2', 'Desativação dos postos de Stewards da Zona 2',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);						

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (62,          1,            2,            4,            4,            3,            62,          62,          1,
                               'Fechamento dos portões da Zona 2 (acesso autorizado para o Staff e pessoal de limpeza)', 'Fechamento dos portões da Zona 2 (acesso autorizado para o Staff e pessoal de limpeza)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);	
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (63,          1,            2,            4,            4,            3,            63,          63,          1,
                               'Seguranças checam a Zona 4', 'Seguranças checam a Zona 4',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (64,          1,            2,            4,            4,            3,            64,          63,          1,
                               'Desativação do posto da sala de controle de dopagem (desativar somente quando os resultados do teste de dopagem estejam prontos. Após a desativação só será permitido o acesso de pessoa credenciada)', 'Desativação do posto da sala de controle de dopagem (desativar somente quando os resultados do teste de dopagem estejam prontos. Após a desativação só será permitido o acesso de pessoa credenciada)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (65,          1,            2,            4,            4,            3,            65,          65,          1,
                               'Reunião Técnica de Avaliação da equipe da Gerência Local de Segurança', 'Reunião Técnica de Avaliação da equipe da Gerência Local de Segurança',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (66,          1,            2,            4,            4,            3,            66,          66,          1,
                               'Desativação dos postos de Stewards da Zona 3', 'Desativação dos postos de Stewards da Zona 3',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (67,          1,            2,            4,            4,            3,            67,          67,          1,
                               'Fechamento dos portões da Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 'Fechamento dos portões da Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (68,          1,            2,            4,            4,            3,            68,          68,          1,
                               'Término do segundo turno de segurança (diurno)', 'Término do segundo turno de segurança (diurno)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (69,          1,            2,            4,            4,            3,            69,          69,          1,
                               'Armazenamento do material de descarte e lixo no compound correspondente (observar planta do estádio e checagem do pessoal de segurança)', 'Armazenamento do material de descarte e lixo no compound correspondente (observar planta do estádio e checagem do pessoal de segurança)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);		

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (70,          1,            2,            4,            4,            3,            70,          70,          1,
                               'Fechamento dos acessos da Zona 4 para a Zona 3 (acesso autorizado para o Staff e pessoal de limpeza)', 'Armazenamento do material de descarte e lixo no compound correspondente (observar planta do estádio e checagem do pessoal de segurança)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);			

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (71,          1,            2,            4,            4,            3,            71,          71,          1,
                               'Início da retirada de material de descarte e lixo do compound', 'Início da retirada de material de descarte e lixo do compound',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);		

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (72,          1,            2,            4,            4,            3,            72,          72,          1,
                               'Desativação Operacional do Centro de Comando e Controle', 'Desativação Operacional do Centro de Comando e Controle',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);	
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (73,          1,            2,            4,            4,            3,            73,          73,          1,
                               'Desativação dos postos de segurança pública externos ao perímetro de segurança do estádio', 'Desativação dos postos de segurança pública externos ao perímetro de segurança do estádio',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (74,          1,            2,            4,            4,            3,            74,          74,          1,
                               'Fechamento das instalações do estádio (acesso permitido somente ao staff e pessoas autorizadas)', 'Fechamento das instalações do estádio (acesso permitido somente ao staff e pessoas autorizadas)',
                               0, 0, 0, 
                               '2014-06-12 10:00:00', '2014-06-12 20:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (75,          2,            2,            4,            4,            3,            75,          75,          1,
                               'Unlocking dressing room Team A)', 'Unlocking dressing room Team A',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (76,          2,            2,            4,            4,            3,            76,          76,          1,
                               'Arrival Ball Crew', 'Arrival Ball Crew',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (77,          2,            2,            4,            4,            3,            77,          77,          1,
                               'Arrival of the teams equipment', 'Arrival of the teams equipment',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (78,          2,            2,            4,            4,            3,            78,          78,          1,
                               'Checking the pitch', 'Checking the pitch',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (79,          2,            2,            4,            4,            3,            79,          79,          1,
                               'Check-Up of beverage supply for dressing room Team A', 'Check-Up of beverage supply for dressing room Team A',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (80,          2,            2,            4,            4,            3,            80,          80,          1,
                               'Arrival of Team A', 'Arrival of Team A',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (81,          2,            2,            4,            4,            3,            81,          81,          1,
                               'Press Conference', 'Press Conference',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (82,          2,            2,            4,            4,            3,            82,          82,          1,
                               'End of Press Conference', 'End of Press Conference',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (83,          2,            2,            4,            4,            3,            83,          83,          1,
                               'Training', 'Training',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (84,          2,            2,            4,            4,            3,            84,          84,          1,
                               'MCM', 'MCM',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (85,          2,            2,            4,            4,            3,            85,          85,          1,
                               'Coordination of departures Team A', 'Coordination of departures Team A',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (86,          2,            2,            4,            4,            3,            86,          86,          1,
                               'End of MCM/Coordination of departures of Team A MCM participants', 'End of MCM/Coordination of departures of Team A MCM participants',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (87,          2,            2,            4,            4,            3,            87,          87,          1,
                               'Unlocking dressing room  Team B', 'Unlocking dressing room  Team B',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (88,          2,            2,            4,            4,            3,            88,          88,          1,
                               'Arrival of the teams equipment', 'Arrival of the teams equipment',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (89,          2,            2,            4,            4,            3,            89,          89,          1,
                               'Check-Up of beverage supply for dressing room Team B', 'Check-Up of beverage supply for dressing room Team B',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (90,          2,            2,            4,            4,            3,            90,          90,          1,
                               'Arrival of Team B MCM participants', 'Arrival of Team B MCM participants',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (91,          2,            2,            4,            4,            3,            91,          91,          1,
                               'MCM', 'MCM',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (92,          2,            2,            4,            4,            3,            92,          92,          1,
                               'Arrival of Team B', 'Arrival of Team B',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (93,          2,            2,            4,            4,            3,            93,          93,          1,
                               'End of MCM', 'End of MCM',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (94,          2,            2,            4,            4,            3,            94,          94,          1,
                               'Training', 'Training',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (95,          2,            2,            4,            4,            3,            95,          95,          1,
                               'Departure of Ball Crew', 'Departure of Ball Crew',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (96,          2,            2,            4,            4,            3,            96,          96,          1,
                               'Coordination of departures Team B', 'Coordination of departures Team B',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (97,          2,            2,            4,            4,            3,            97,          97,          1,
                               'Press Conference', 'Press Conference',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);	
							   
insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (98,          2,            2,            4,            4,            3,            98,          98,          1,
                               'End of Press Conference/Coordination of departure of Team B press conference participants', 'End of Press Conference/Coordination of departure of Team B press conference participants',
                               0, 0, 0, 
                               '2014-06-12 14:00:00', '2014-06-12 15:00:00', null, null,
                               null, null, 151, 1, 1);

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (99,          3,            2,            4,            4,            3,            99,          99,          1,
                               'Unlocking the dressing rooms', 'Unlocking the dressing rooms',
                               0, 0, 0, 
                               '2014-06-12 13:00:00', '2014-06-12 14:00:00', null, null,
                               null, null, 151, 1, 1);	

insert into atividade (idAtividade, IdChecklist, IdEvento, IdLocal, idCliente, IdContratante, IdProcedimento, nrItem, idStatus,
                                                               NomeAtividade, DescricaoAtividade, 
                                                               TempoExecEstimado, TempoTolerInicio, TempoTolerFim, 
                                                               DthrInicioPrevisto, DthrFimPrevisto, dtHrinicioRealizado, DthrFimRealizado, 
                                                               latitude, longitude, idProcedimentoAuxiliar, idFuncionarioResponsavel, Ativo)
values (100,          3,            2,            4,            4,            3,            100,          100,          1,
                               'Arrival of the teams equipment', 'Arrival of the teams equipment',
                               0, 0, 0, 
                               '2014-06-12 13:00:00', '2014-06-12 14:00:00', null, null,
                               null, null, 151, 1, 1);



/*Tabela Contexto*/
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (1, 2, 3, 4, 4, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (1, 4, 3, 4, 5, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (1, 3, 3, 4, 6, 1);

insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (2, 2, 3, 4, 4, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (2, 4, 3, 4, 5, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (2, 3, 3, 4, 6, 1);

insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (3, 2, 3, 4, 4, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (3, 4, 3, 4, 5, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (3, 3, 3, 4, 6, 1);

insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (4, 2, 3, 4, 4, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (4, 4, 3, 4, 5, 1);
insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (4, 3, 3, 4, 6, 1);	

insert into contexto (idPessoa, IdEvento, IdContratante, IdCliente, IdLocal, Ativo) values (5, 5, 2, 2, 2, 1);	


package br.com.kolss.service;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.AtividadeMensagemGrupo;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.ChecklistMensagemGrupo;
import br.com.kolss.model.entities.ClassificacaoOcorrenciaMensagem;
import br.com.kolss.model.entities.ClassificacaoOcorrenciaMensagemGrupo;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.TipoEnvio;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.message.EmailMessageSender;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MessageSenderServiceImpl {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private FuncionarioService funcionarioService;

	@Autowired
	private EmailMessageSender emailSender;

	@Autowired
	private MensagemService mensagemService;
	
	@Autowired
	private UsuarioService usuarioService;

	/**
	 * Envia mensagem para todos os Usuários cadastrados para a Ocorrência e a
	 * Mensagem.
	 * 
	 * @param ocorrencia
	 * @param idMensagem
	 * @param tituloMensagem
	 * @param corpoMensagem
	 * @return
	 * @throws ServiceException
	 */
	@Async
	public boolean enviarMensagem(Ocorrencia ocorrencia, Serializable idMensagem, String tituloMensagem,
			String corpoMensagem) throws ServiceException {
		logger.debug(
				"MessageSenderServiceImpl.enviarMensagem(Ocorrencia, Serializable, tituloMensagem, corpoMensagem)");

		// Obtém os Usuários cadastrados para receber o alerta:
		Map<TipoEnvio, Set<Usuario>> usuariosPorTipoEnvio = new HashMap<TipoEnvio, Set<Usuario>>();

		Set<Usuario> usuarios = new HashSet<>();

		ClassificacaoOcorrenciaMensagem classOcrMensagem = mensagemService
				.obterClassificacaoOcorrenciaMensagem(idMensagem, ocorrencia.getClassificacaoOcorrencia());
		Funcionario funcionarioSuperior = funcionarioService.getFuncionarioSuperior(ocorrencia);

		/*
		 * Por padrao, o usuário responsavel e o seu superior tambem devem
		 * recebem todos os alertas:
		 */
		if (ocorrencia.getUsuarioResponsavel() != null) {
			usuarios.add(ocorrencia.getUsuarioResponsavel());
		}

		if (funcionarioSuperior != null) {
			usuarios.add(funcionarioSuperior.getUsuario());
		}

		usuariosPorTipoEnvio.put(new TipoEnvio(1L), usuarios);
		usuariosPorTipoEnvio.put(new TipoEnvio(2L), usuarios);

		if (classOcrMensagem != null && classOcrMensagem.getClassificacoesOcorrenciasMensagensGrupos() != null) {
			// Usuarios do grupo devem receber as mensagem push ou E-mail
			for (ClassificacaoOcorrenciaMensagemGrupo classOcrMsgGrp : classOcrMensagem
					.getClassificacoesOcorrenciasMensagensGrupos()) {

				if (usuariosPorTipoEnvio.get(classOcrMsgGrp.getTipoEnvio()) != null) {
					usuariosPorTipoEnvio.get(classOcrMsgGrp.getTipoEnvio()).add(classOcrMsgGrp.getUsuarioResponsavel());
				}
			}
		}

		Serializable idContratante = usuarioService.obterContrantePor(ocorrencia);
//		Serializable idContratante = ocorrencia.getEvento().getLocal().getCliente().getContratante().getId();
		return enviarMensagem(idContratante, idMensagem, tituloMensagem, corpoMensagem, usuariosPorTipoEnvio);
	}

	/**
	 * Envia mensagem para todos os Usuários cadastrados para o Checklist e a
	 * Mensagem.
	 * 
	 * @param checklist
	 * @param idMensagem
	 * @param tituloMensagem
	 * @param corpoMensagem
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	@Async
	public boolean enviarMensagem(Checklist checklist, Serializable idMensagem, String tituloMensagem,
			String corpoMensagem) throws ServiceException {

		logger.debug("MessageSenderServiceImpl.enviarMensagem(Checklist, Serializable, tituloMensagem, corpoMensagem)");

		boolean enviou = false;
		Map<TipoEnvio, Set<Usuario>> usuariosPorTipoEnvio = new HashMap<TipoEnvio, Set<Usuario>>();
		Set<Usuario> usuarios = new HashSet<>();

		ChecklistMensagem chkMensagem = mensagemService.obterChecklistMensagem(idMensagem, checklist);
		Funcionario funcionarioSuperior = funcionarioService.getFuncionarioSuperior(checklist);

		/*
		 * Por padrao, o usuário responsavel e o seu superior tambem devem
		 * recebem todos os alertas:
		 */
		if (checklist.getUsuarioResponsavel() != null) {
			usuarios.add(checklist.getUsuarioResponsavel());
		}

		if (funcionarioSuperior != null) {
			usuarios.add(funcionarioSuperior.getUsuario());
		}

		usuariosPorTipoEnvio.put(new TipoEnvio(1L), usuarios);
		usuariosPorTipoEnvio.put(new TipoEnvio(2L), usuarios);

		if (chkMensagem != null && chkMensagem.getChecklistsMensagensGrupos() != null) {
			// Usuarios do grupo devem receber as mensagem push ou E-mail
			for (ChecklistMensagemGrupo chkMsgGrp : chkMensagem.getChecklistsMensagensGrupos()) {

				if (usuariosPorTipoEnvio.get(chkMsgGrp.getTipoEnvio()) != null) {
					usuariosPorTipoEnvio.get(chkMsgGrp.getTipoEnvio()).add(chkMsgGrp.getUsuarioResponsavel());
				}
			}
		}

		Serializable idContratante = checklist.getEvento().getLocal().getCliente().getContratante().getId();
		enviou = enviarMensagem(idContratante, idMensagem, tituloMensagem, corpoMensagem, usuariosPorTipoEnvio);

		return enviou;
	}

	/**
	 * Envia mensagem para todos os Usuários cadastrados para o Checklist e a
	 * Atividade.
	 * 
	 * @param atividade
	 * @param idMensagem
	 * @param tituloMensagem
	 * @param corpoMensagem
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	@Async
	public boolean enviarMensagem(Atividade atividade, Serializable idMensagem, String tituloMensagem,
			String corpoMensagem) throws ServiceException {
		logger.debug("MessageSenderServiceImpl.enviarMensagem(Atividade, Serializable, tituloMensagem, corpoMensagem)");

		AtividadeMensagem atvMensagem = mensagemService.obterAtividadeMensagem(idMensagem, atividade);
		Funcionario funcionarioSuperior = funcionarioService.getFuncionarioSuperior(atividade);
		Map<TipoEnvio, Set<Usuario>> usuariosPorTipoEnvio = new HashMap<TipoEnvio, Set<Usuario>>();
		Set<Usuario> usuarios = new HashSet<>();

		/*
		 * Por padrao, o usuário responsavel e o seu superior tambem devem
		 * recebem todos os alertas:
		 */
		if (atividade.getUsuarioResponsavel() != null) {
			usuarios.add(atividade.getUsuarioResponsavel());
		}

		if (funcionarioSuperior != null) {
			usuarios.add(funcionarioSuperior.getUsuario());
		}

		usuariosPorTipoEnvio.put(new TipoEnvio(1L), usuarios);
		usuariosPorTipoEnvio.put(new TipoEnvio(2L), usuarios);

		if (atvMensagem != null && atvMensagem.getAtividadesMensagensGrupos() != null) {

			// Usuarios do grupo devem receber as mensagem push ou E-mail
			for (AtividadeMensagemGrupo atvMsgGrp : atvMensagem.getAtividadesMensagensGrupos()) {

				if (usuariosPorTipoEnvio.get(atvMsgGrp.getTipoEnvio()) != null) {
					usuariosPorTipoEnvio.get(atvMsgGrp.getTipoEnvio()).add(atvMsgGrp.getUsuarioResponsavel());
				}
			}

		}

		Serializable idContratante = atvMensagem.getAtividade().getChecklist().getEvento().getLocal().getCliente()
				.getContratante().getId();
		return enviarMensagem(idContratante, idMensagem, tituloMensagem, corpoMensagem, usuariosPorTipoEnvio);

	}

	private boolean enviarMensagem(Serializable idContratante, Serializable idMensagem, String tituloMensagem,
			String corpoMensagem, Map<TipoEnvio, Set<Usuario>> usuariosPorTipoEnvio) {
		logger.debug(
				"MessageSenderServiceImpl.enviarMensagem(Serializable, Serializable, tituloMensagem, corpoMensagem, Map<TipoEnvio, Set<Usuario>>)");

		/* Enviar a Mensagem para o(s) funcionario(s): */
		Set<TipoEnvio> tiposEnvios = usuariosPorTipoEnvio.keySet();
		for (TipoEnvio tipoEnvio : tiposEnvios) {

			Set<Usuario> usuariosNotificar = usuariosPorTipoEnvio.get(tipoEnvio);
			int idTipoEnvio = tipoEnvio.getId().intValue();

			// TODO: REFACTORING - Aplicar Design Patterns:
			switch (idTipoEnvio) {
			case 1: // TipoEnvio.ID_TIPO_EMAIL;

				emailSender.enviar(idContratante, tituloMensagem, corpoMensagem, usuariosNotificar);

				break;
			case 2: // TipoEnvio.ID_TIPO_PUSH;
				try {
					// emailSender.enviar(tituloMensagem, corpoMensagem);
					emailSender.enviarPushs(usuariosNotificar, tituloMensagem, corpoMensagem);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case 3: // TipoEnvio.ID_TIPO_SMS;
				break;
			}

		}

		return true;
	}

	/**
	 * Envia a Mensagem para todos os Grupos de Funcionários por Tipo de Envio.
	 * 
	 * @param idContratante
	 * @param mensagem
	 * @param tituloMensagem
	 * @param corpoMensagem
	 * @param idFuncionariosObrigatorios
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	@Async
	public boolean enviarMensagem(Serializable idContratante, Serializable idMensagem, String tituloMensagem,
			String corpoMensagem, Collection<Serializable> idFuncionariosObrigatorios) throws ServiceException {
		logger.debug("MessageSenderServiceImpl.enviarMensagem");

		/*
		 * FIX ME: Comentado para que o Login Funcionasse
		 * 
		 * Map<Integer, Set<Funcionario>> mapFuncionarios =
		 * mensagemRepository.obterFuncionariosAgrupadosPorTipoEnvio(
		 * idContratante, idMensagem);
		 * 
		 * // Enviar a Mensagem para o(s) funcionario(s): Set<Integer>
		 * tiposEnvio = mapFuncionarios.keySet(); for (Integer idTipoEnvio :
		 * tiposEnvio) {
		 * 
		 * Set<Funcionario> funcionariosANotificar = mapFuncionarios.get(
		 * idTipoEnvio);
		 * 
		 * // TODO: REFACTORING - Aplicar Design Patterns: switch (idTipoEnvio)
		 * { case 1: //TipoEnvio.ID_TIPO_EMAIL;
		 * 
		 * 
		 * // Por padrao, o funcionario responsavel e o seu superior // tambem
		 * recebem um email com a mensagem:
		 * 
		 * if (idFuncionariosObrigatorios != null &&
		 * !idFuncionariosObrigatorios.isEmpty()) {
		 * 
		 * List<Funcionario> funcionariosObrigatorios =
		 * funcionarioRepository.find( idFuncionariosObrigatorios);
		 * funcionariosANotificar.addAll(funcionariosObrigatorios); }
		 * 
		 * emailSender.enviar(idContratante, tituloMensagem, corpoMensagem,
		 * funcionariosANotificar);
		 * 
		 * break; case 2: //TipoEnvio.ID_TIPO_PUSH; try {
		 * //emailSender.enviar(tituloMensagem, corpoMensagem);
		 * emailSender.enviarPushs(funcionariosANotificar, tituloMensagem,
		 * corpoMensagem); } catch (IOException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); } break; case 3:
		 * //TipoEnvio.ID_TIPO_SMS; break; }
		 * 
		 * }
		 */
		return true;
	}

	/**
	 * Envia a Mensagem para o Usuario Passado.
	 * 
	 * @param enderecoDoEmail
	 * @param tituloMensagem
	 * @param corpoMensagem
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	@Async
	public boolean enviarMensagemHtmlParaUsuario(Usuario usuario, String tituloMensagem, String corpoMensagem)
			throws ServiceException {

		emailSender.enviarNoFormatoHtml(usuario.getCliente().getContratante().getId(), tituloMensagem, corpoMensagem,
				usuario.getEmail(), usuario.getNome());

		return true;

	}

}

package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.AtividadeMensagem;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.ChecklistMensagem;
import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.ChecklistPadraoMensagem;
import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.ClassificacaoOcorrenciaMensagem;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Mensagem;
import br.com.kolss.model.entities.ProcedimentoMensagem;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.util.HibernateUtil;

/**
 * Componente responsável por obter as informações relevantes para o envio de
 * mensagens.
 */
@Repository
@Transactional(readOnly = false)
public class MensagemRepositoryImpl extends AbstractRepository implements
		MensagemRepository {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Retorna a Mensagem pelo seu ID.
	 * 
	 * @param idMensagem
	 * 
	 * @return
	 */
	@Override
	public Mensagem obter(Serializable idMensagem) {

		logger.debug("MensagemRepositoryImpl.find");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);
		criteria.createAlias("tipoMensagem", "tipoMensagem");
		criteria.add(Restrictions.eq("id", idMensagem));

		return (Mensagem) criteria.uniqueResult();
	}

	/**
	 * Retorna todas as Mensagens ativas e ordenadas de forma alfabética pelo
	 * nome.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Mensagem> obterTodos(Contratante contratante) {

		logger.debug("MensagemRepositoryImpl.obterTodos");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);

		criteria.add(Restrictions.eq("ativo", true));
		criteria.addOrder(Order.asc("descricao"));
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));

		return criteria.list();
	}

	/**
	 * Retorna as Mensagens disponíveis para o Usuário informado, em ordem
	 * alfabética da descrição da Mensagem.
	 * 
	 * @param idUsuario
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Mensagem> obterTodosPorUsuario(Serializable idUsuario) {

		logger.debug("MensagemRepositoryImpl.getMensagens(idUsuario)");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);
		criteria.add(Restrictions.eq("ativo", true));
		criteria.addOrder(Order.asc("descricao"));

		DetachedCriteria dCriteria = DetachedCriteria.forClass(Mensagem.class);
		dCriteria.createAlias("clientesMensagens", "cMensagem");
		dCriteria.createAlias("cMensagem.cliente", "cliente");
		dCriteria.createAlias("cliente.usuarios", "usr");
		dCriteria.add(Restrictions.eq("usr.id", idUsuario));
		dCriteria.setProjection(Projections.property("id"));

		criteria.add(Restrictions.or(Restrictions.eq("template", true),
				Property.forName("id").in(dCriteria)));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}

	/**
	 * Retorna o ProcedimentoMensagem pelo seu ID.
	 * 
	 * @param idProcedimentoMensagem
	 * 
	 * @return
	 */
	@Override
	public ProcedimentoMensagem obterProcedimentoMensagem(
			Serializable idProcedimentoMensagem) {

		logger.debug("MensagemRepositoryImpl.getProcedimentoMensagem");

		Session session = this.sessionFactory.getCurrentSession();
		return (ProcedimentoMensagem) session.load(ProcedimentoMensagem.class,
				idProcedimentoMensagem);
	}

	/**
	 * Retorna todos os procedimentos mensagens associados a um Procedimento e
	 * disponíveis para o Usuário informado.
	 * 
	 * @param idMensagens
	 * @param idProcedimento
	 * @param idUsuario
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<ProcedimentoMensagem> obterProcedimentosMensagens(
			Collection<Serializable> idMensagens, Serializable idProcedimento,
			Serializable idUsuario) {

		logger.debug("ProcedimentoRepository.getProcedimentosMensagens");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ProcedimentoMensagem.class);

		criteria.add(Restrictions.eq("procedimento.id", idProcedimento));

		if (!idMensagens.isEmpty()) {
			criteria.add(Restrictions.in("mensagem.id", idMensagens));
		}

		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}

	/**
	 * Salva uma nova AtividadeMensagem.
	 * 
	 * @param atividadeMensagem
	 * 
	 * @return
	 */
	@Override
	public Serializable salvar(AtividadeMensagem atividadeMensagem) {

		logger.debug("MensagemRepositoryImpl.salvar(AtividadeMensagem)");

		Session session = this.sessionFactory.getCurrentSession();
		return session.save(atividadeMensagem);
	}

	/**
	 * Salva um novo ChecklistMensagem.
	 * 
	 * @param checklistMensagem
	 * 
	 * @return
	 */
	@Override
	public Serializable salvar(ChecklistMensagem checklistMensagem) {

		logger.debug("MensagemRepositoryImpl.salvar(ChecklistMensagem)");

		Session session = this.sessionFactory.getCurrentSession();
		return session.save(checklistMensagem);
	}

	/**
	 * Salva um novo ProcedimentoMensagem.
	 * 
	 * @param atividadeMensagem
	 * 
	 * @return
	 */
	@Override
	public Serializable salvar(ProcedimentoMensagem procedimentoMensagem) {

		logger.debug("MensagemRepositoryImpl.salvar(ProcedimentoMensagem)");

		Session session = this.sessionFactory.getCurrentSession();
		return session.save(procedimentoMensagem);
	}

	/**
	 * Atualiza a AtividadeMensagem.
	 * 
	 * @param atividadeMensagem
	 */
	@Override
	public void atualizar(AtividadeMensagem atividadeMensagem) {

		logger.debug("MensagemRepositoryImpl.atualizar(AtividadeMensagem)");
		Session session = this.sessionFactory.getCurrentSession();
		session.update(atividadeMensagem);
	}

	/**
	 * Atualiza o ChecklistMensagem.
	 * 
	 * @param checklistMensagem
	 */
	@Override
	public void atualizar(ChecklistMensagem checklistMensagem) {

		logger.debug("MensagemRepositoryImpl.atualizar(ChecklistMensagem)");

		Session session = this.sessionFactory.getCurrentSession();
		session.update(checklistMensagem);
	}

	/**
	 * Atualiza o ProcedimentoMensagem.
	 * 
	 * @param procedimentoMensagem
	 */
	@Override
	public void atualizar(ProcedimentoMensagem procedimentoMensagem) {

		logger.debug("MensagemRepositoryImpl.atualizar(ProcedimentoMensagem)");

		Session session = this.sessionFactory.getCurrentSession();
		session.update(procedimentoMensagem);
	}

	/**
	 * Remove o Procedimento Mensagem.
	 * 
	 * @param procedimentoMensagem
	 */
	@Override
	public void remover(ProcedimentoMensagem procedimentoMensagem) {

		logger.debug("MensagemRepositoryImpl.remover");

		Session session = this.sessionFactory.getCurrentSession();
		session.delete(procedimentoMensagem);
	}

	// /**
	// * Retorna todos os funcionarios, agrupados pelo "Tipo de Envio", que
	// devem
	// * receber a Mensagem escolhida.
	// *
	// * @param idContratante
	// * @param idMensagem
	// *
	// * @return
	// */
	// @SuppressWarnings("unchecked")
	// public Map<Integer, Set<Funcionario>>
	// obterFuncionariosAgrupadosPorTipoEnvio(
	// Serializable idContratante, Serializable idMensagem) {
	// logger.debug("MensagemRepositoryImpl.obterFuncionariosAgrupadosPorTipoEnvio");
	// Session session = this.sessionFactory.getCurrentSession();
	//
	//
	// /* 01) Obter o(s) GrupoMensagem(ns) da Mensagem a ser enviada: */
	// Criteria critGrpMsg = session.createCriteria(GrupoMensagem.class);
	// critGrpMsg.add(Restrictions.eq("ativo", true));
	// critGrpMsg.add(Restrictions.eq("mensagem.idMensagem", idMensagem));
	// List<GrupoMensagem> grupoMensagens = critGrpMsg.list();
	//
	//
	// /* 02) Obter o(s) funcionario(s) devem receber a mensagem: */
	// Map<Integer, Set<Funcionario>> mapFuncionarios =
	// new HashMap<Integer, Set<Funcionario>>();
	// for (GrupoMensagem gm : grupoMensagens) {
	//
	// /* 02.a) Obter o(s) funcionario(s) deste grupo: */
	// Criteria critGrpFunc = session.createCriteria(
	// GrupoFuncionario.class);
	//
	// critGrpFunc.createAlias("funcionario", "f");
	// critGrpFunc.add(Restrictions.eq("f.ativo", true));
	// critGrpFunc.add(Restrictions.eq("ativo", true));
	// critGrpFunc.add(Restrictions.eq("id.idContratante", idContratante));
	// critGrpFunc.add(Restrictions.eq("id.idGrupo", gm.getIdGrupo()));
	//
	// ProjectionList projection = Projections.projectionList();
	// projection.add(Projections.property("funcionario"));
	// critGrpFunc.setProjection(Projections.distinct(projection));
	//
	// /* 02.b) Agrupar os funcionarios pelo Tipo de Envio: */
	// TipoEnvio tipoEnvio = gm.getTipoEnvio();
	// if (!mapFuncionarios.containsKey(tipoEnvio.getIdTipoEnvio())) {
	// mapFuncionarios.put(tipoEnvio.getIdTipoEnvio(),
	// new HashSet<Funcionario>());
	// }
	//
	// Set<Funcionario> funcionarios = mapFuncionarios.get(
	// tipoEnvio.getIdTipoEnvio());
	//
	// List<Funcionario> lst = critGrpFunc.list();
	// for (Funcionario fnc : lst) {
	// fnc.toString();
	// }
	// funcionarios.addAll(lst);
	// }
	//
	// return mapFuncionarios;
	// }

	/**
	 * Lista todas as Mensagens de um Checklist.<br>
	 * Se o tipoMensagem for <i>null</i> é retornado todos os
	 * ChecklistMensagens.
	 * 
	 * @param idCheckList
	 * @param idTipoMensagem
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<ChecklistMensagem> obterChecklistMensagens(
			Serializable idCheckList, Serializable idTipoMensagem,
			Contratante contratante) {

		logger.debug("MensagemRepositoryImpl.obterChecklistMensagens");

		Session currentSession = this.sessionFactory.getCurrentSession();
		Criteria criteria = currentSession
				.createCriteria(ChecklistMensagem.class);
		criteria.addOrder(Order.desc("dataEnvio"));
		criteria.add(Restrictions.isNotNull("dataEnvio"));
		criteria.add(Restrictions.eq("checklist.id", idCheckList));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));

		if (idTipoMensagem != null) {
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.id", idTipoMensagem));
		}

		return criteria.list();
	}

	/**
	 * Retorna o ChecklistMensagem associado ao Checklist.
	 * 
	 * @param idMensagem
	 * @param checklist
	 * 
	 * @return
	 */
	@Override
	public ChecklistMensagem obterChecklistMensagem(Serializable idMensagem,
			Checklist checklist) {

		logger.debug("MensagemRepositoryImpl.obterChecklistMensagem");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		criteria.add(Restrictions.eq("mensagem.id", idMensagem));
		criteria.add(Restrictions.eq("checklist.id", checklist.getId()));

		return (ChecklistMensagem) criteria.uniqueResult();
	}

	/**
	 * Retorna a AtividadeMensagem associado a Mensagem.
	 * 
	 * @param idMensagem
	 * @param atividade
	 * 
	 * @return
	 */
	@Override
	public AtividadeMensagem obterAtividadeMensagem(Serializable idMensagem,
			Atividade atividade) {

		logger.debug("MensagemRepositoryImpl.obterAtividadeMensagem");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);
		criteria.createAlias("atividadesMensagensGrupos",
				"atividadesMensagensGrupos");
		criteria.add(Restrictions.eq("mensagem.id", idMensagem));
		criteria.add(Restrictions.eq("atividade.id", atividade.getId()));

		return (AtividadeMensagem) criteria.uniqueResult();
	}

	/**
	 * Retorna as Atividades Mensagens enviadas pela Atividade selecionada.
	 * 
	 * @param atividade
	 * @param idTipoMensagem
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterMensagensEnviadas(Atividade atividade,
			Serializable idTipoMensagem) {

		logger.debug("MensagemRepositoryImpl.obterMensagensEnviadas(Atividade, Serializable)");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);

		criteria.addOrder(Order.desc("dataEnvio"));
		criteria.add(Restrictions.eq("atividade.id", atividade.getId()));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.isNotNull("dataEnvio"));

		if (idTipoMensagem != null) {
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.id", idTipoMensagem));
		}

		return criteria.list();
	}

	/**
	 * Retorna os Checklists Mensagens enviadas pelo Checklist selecionado.
	 * 
	 * @param checklist
	 * @param idTipoMensagem
	 * 
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<ChecklistMensagem> obterChecklistMensagens(Checklist checklist,
			Serializable idTipoMensagem) {

		logger.debug("MensagemRepositoryImpl.obterChecklistMensagens(Checklist, Serializable)");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		criteria.addOrder(Order.desc("dataEnvio"));
		criteria.add(Restrictions.eq("checklist.id", checklist.getId()));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.isNotNull("dataEnvio"));

		if (idTipoMensagem != null) {
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.id", idTipoMensagem));
		}

		return criteria.list();
	}

	/**
	 * Retorna a Classificação Ocorrencia Mensagem associado a Mensagem.
	 * 
	 * @param idMensagem
	 * @param classificacaoOcorrencia
	 * 
	 * @return
	 */
	@Override
	public ClassificacaoOcorrenciaMensagem obterClassificacaoOcorrenciaMensagem(
			Serializable idMensagem,
			ClassificacaoOcorrencia classificacaoOcorrencia) {

		logger.debug("MensagemRepositoryImpl.obterClassificacaoOcorrenciaMensagem");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session
				.createCriteria(ClassificacaoOcorrenciaMensagem.class);
		criteria.setFetchMode("mensagem", FetchMode.JOIN);
		criteria.setFetchMode("classificacaoOcorrencia", FetchMode.JOIN);
		criteria.add(Restrictions.eq("mensagem.id", idMensagem));
		criteria.add(Restrictions.eq("classificacaoOcorrencia.id",
				classificacaoOcorrencia.getId()));

		return (ClassificacaoOcorrenciaMensagem) criteria.uniqueResult();
	}

	/**
	 * Retorna a(s) "Atividades Mensagens" não enviadas com Atividade(s) com
	 * Início Atrasado que ainda não enviou Alertas.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComInicioAtrasadoSemAlerta() {

		logger.debug("MensagemRepositoryImpl.obterAtividadesMensagensComInicioAtrasadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);

		/*
		 * Regra 'C' - Seleciona todas as atividades que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(13)));

		criteria.createAlias("atividade", "atv");
		criteria.add(Restrictions.eq("atv.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.eq("atv.status.id",
				StatusEnum.EM_ANDAMENTO.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNotNull("atv.dataInicioRealizado")); /*
																		 * Regra
																		 * 'D'
																		 */
		criteria.add(Restrictions.gtProperty("atv.dataInicioRealizado",
				"atv.dataInicioPrevisto")); /*
											 * pre-filtro para as regras 'E' e
											 * 'F'
											 */

		return criteria.list();
	}

	/**
	 * Retorna o(s) "Checklist Mensagens" não enviadas com Checklist(s) com
	 * Início Atrasado que ainda não enviou Alertas.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComInicioAtrasadoSemAlerta() {

		logger.debug("MensagemRepositoryImpl.obterChecklistsMensagensComInicioAtrasadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		/*
		 * Regra 'C' - Seleciona todos os checklist que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(13)));

		criteria.createAlias("checklist", "chk");
		criteria.add(Restrictions.eq("chk.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.eq("chk.status.id",
				StatusEnum.EM_ANDAMENTO.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNotNull("chk.dataInicioRealizado")); /*
																		 * Regra
																		 * 'D'
																		 */
		criteria.add(Restrictions.gtProperty("chk.dataInicioRealizado",
				"chk.dataInicioPrevisto")); /*
											 * pre-filtro para as regras 'E' e
											 * 'F'
											 */

		return criteria.list();
	}

	/**
	 * Retorna a(s) "Atividades Mensagens" não enviadas com Atividade(s) com
	 * Início não Realizado que ainda não enviou Alertas.
	 * 
	 * @param dataReferencia
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComInicioNaoRealizadoSemAlerta(
			Date dataReferencia) {

		logger.debug("MensagemRepositoryImpl.obterAtividadesMensagensComInicioNaoRealizadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);

		/*
		 * Regra 'C' - Seleciona todas as atividades que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(12)));

		criteria.createAlias("atividade", "atv");
		criteria.add(Restrictions.eq("atv.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.ne("atv.status.id",
				StatusEnum.EM_ANDAMENTO.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("atv.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("atv.status.id",
				StatusEnum.CANCELADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNull("atv.dataInicioRealizado")); /* Regra 'D' */
		criteria.add(Restrictions.lt("atv.dataInicioPrevisto", dataReferencia)); /*
																				 * pre
																				 * -
																				 * filtro
																				 * para
																				 * as
																				 * regras
																				 * 'E'
																				 * e
																				 * 'F'
																				 */

		return criteria.list();
	}

	/**
	 * Retorna o(s) "Checklists Mensagens" não enviadas com Checklist(s) com
	 * Início não Realizado que ainda não enviou Alertas.
	 * 
	 * @param dataReferencia
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComInicioNaoRealizadoSemAlerta(
			Date dataReferencia) {

		logger.debug("MensagemRepositoryImpl.obterChecklistsMensagensComInicioNaoRealizadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		/*
		 * Regra 'C' - Seleciona todos os checklist que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(12)));

		criteria.createAlias("checklist", "chk");
		criteria.add(Restrictions.eq("chk.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.EM_ANDAMENTO.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.CANCELADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNull("chk.dataInicioRealizado")); /* Regra 'D' */
		criteria.add(Restrictions.lt("chk.dataInicioPrevisto", dataReferencia)); /*
																				 * pre
																				 * -
																				 * filtro
																				 * para
																				 * as
																				 * regras
																				 * 'E'
																				 * e
																				 * 'F'
																				 */

		return criteria.list();
	}

	/**
	 * Retorna a(s) "Atividades Mensagens" não enviadas com Atividade(s) com
	 * Término Atrasado que ainda não enviou Alertas.
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComTerminoAtrasadoSemAlerta()
			throws ServiceException {

		logger.debug("MensagemRepositoryImpl.obterAtividadesMensagensComTerminoAtrasadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);

		/*
		 * Regra 'C' - Seleciona todas as atividades que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(17)));

		criteria.createAlias("atividade", "atv");
		criteria.createAlias("atv.usuarioResponsavel", "usuarioResponsavel");
		criteria.add(Restrictions.eq("atv.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.eq("atv.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNotNull("atv.dataFimRealizado")); /* Regra 'D' */
		criteria.add(Restrictions.gtProperty("atv.dataFimRealizado",
				"atv.dataFimPrevisto")); /* pre-filtro para as regras 'E' e 'F' */

		return criteria.list();
	}

	/**
	 * Retorna o(s) "Checklists Mensagens" não enviadas com Checklist(s) com
	 * Término Atrasado que ainda não enviou Alertas.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> obterChecklistsMensagensComTerminoAtrasadoSemAlerta() {

		logger.debug("MensagemRepositoryImpl.obterChecklistsMensagensComTerminoAtrasadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		/*
		 * Regra 'C' - Seleciona todos os checklist que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(17)));

		criteria.createAlias("checklist", "chk");
		criteria.add(Restrictions.eq("chk.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNotNull("chk.dataFimRealizado")); /* Regra 'D' */
		criteria.add(Restrictions.gtProperty("chk.dataFimRealizado",
				"chk.dataFimPrevisto")); /* pre-filtro para as regras 'E' e 'F' */

		return criteria.list();
	}

	/**
	 * Retorna a(s) "Atividades Mensagens" não enviadas com Atividade(s) com
	 * Término não Realizado que ainda não enviou Alertas.
	 * 
	 * @param dataReferencia
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterAtividadesMensagensComTerminoNaoRealizadoSemAlerta(
			Date dataReferencia) {

		logger.debug("TerminoNaoRealizadoRegra.obterAtividadesMensagensComTerminoNaoRealizadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeMensagem.class);
		criteria.createAlias("atividade", "atv");

		/*
		 * Regra 'C' - Seleciona todas as atividades que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(15)));

		criteria.add(Restrictions.eq("atv.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.ne("atv.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("atv.status.id",
				StatusEnum.CANCELADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNull("atv.dataFimRealizado")); /* Regra 'D' */
		criteria.add(Restrictions.lt("atv.dataFimPrevisto", dataReferencia)); /*
																			 * pre-
																			 * filtro
																			 * para
																			 * as
																			 * regras
																			 * 'E'
																			 * e
																			 * 'F'
																			 */

		return criteria.list();
	}

	/**
	 * Retorna o(s) "Checklist Mensagens" não enviadas com Checklist(s) com
	 * Término não Realizado que ainda não enviou Alertas.
	 * 
	 * @param dtAtual
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> obterChecklistComTerminoNaoRealizadoSemAlerta(
			Date dtAtual) {

		logger.debug("TerminoNaoRealizadoRegra.obterChecklistComTerminoNaoRealizadoSemAlerta");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistMensagem.class);

		/*
		 * Regra 'D' - Seleciona todos os checklist que não enviarem mensagem
		 * (dataEnvio == null)
		 */
		criteria.add(Restrictions.isNull("dataEnvio"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("mensagem.id", Long.valueOf(15)));

		criteria.createAlias("checklist", "chk");
		criteria.add(Restrictions.eq("chk.ativo", true)); /* Regra 'A' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.FINALIZADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.ne("chk.status.id",
				StatusEnum.CANCELADA.getId())); /* Regra 'B' */
		criteria.add(Restrictions.isNull("chk.dataFimRealizado")); /* Regra 'C' */
		criteria.add(Restrictions.lt("chk.dataFimPrevisto", dtAtual)); /*
																		 * pre-
																		 * filtro
																		 * para
																		 * as
																		 * regras
																		 * 'E' e
																		 * 'F'
																		 */

		return criteria.list();
	}

	/**
	 * Retorna a quantidade de Mensagens geradas para um Local.<br>
	 * Se o valor do "ID Tipo de Mensagem" for <i>null</i>, irá contabilizar
	 * todos os tipos de mensagens (Avisos e Alertas).
	 * 
	 * @param idLocal
	 * @param idTipoMensagem
	 * @param ativo
	 * 
	 * @return
	 */
	@Override
	public Integer obterQuantidadeMensagem(Serializable idLocal,
			Serializable idTipoMensagem, boolean ativo) {
		logger.debug("MensagemRepositoryImpl.obterQuantidadeMensagem");

		// Pesquisa a quantidade de ChecklistMensagem:
		Session currentSession = this.sessionFactory.getCurrentSession();
		Criteria critChecklist = currentSession
				.createCriteria(ChecklistMensagem.class);
		critChecklist.add(Restrictions.isNotNull("dataEnvio"));
		critChecklist.add(Restrictions.eq("ativo", true));
		critChecklist.createAlias("checklist", "chk");
		critChecklist.add(Restrictions.eq("chk.ativo", true));
		critChecklist.add(Restrictions.ne("chk.status.id",
				StatusEnum.FINALIZADA.getId()));
		critChecklist.add(Restrictions.ne("chk.status.id",
				StatusEnum.CANCELADA.getId()));

		critChecklist.createAlias("chk.evento", "evt");
		critChecklist.createAlias("evt.local", "l");
		critChecklist.add(Restrictions.eq("l.id", idLocal));

		if (isValidId(idTipoMensagem)) {
			critChecklist.createAlias("mensagem", "msg");
			critChecklist.createAlias("msg.tipoMensagem", "tpMessage");
			critChecklist.add(Restrictions.eq("tpMessage.id", idTipoMensagem));
		}

		critChecklist.setProjection(Projections.rowCount());
		Number qtdChecklist = (Number) critChecklist.uniqueResult();

		// Pesquisa a quantidade de AtividadeMensagem:
		Criteria critAtividade = currentSession
				.createCriteria(AtividadeMensagem.class);
		critAtividade.add(Restrictions.isNotNull("dataEnvio"));
		critAtividade.add(Restrictions.eq("ativo", true));

		critAtividade.createAlias("atividade", "atv");
		critAtividade.add(Restrictions.eq("atv.ativo", true));
		critAtividade.add(Restrictions.ne("atv.status.id",
				StatusEnum.FINALIZADA.getId()));
		critAtividade.add(Restrictions.ne("atv.status.id",
				StatusEnum.CANCELADA.getId()));

		critAtividade.createAlias("atv.checklist", "chk");
		critAtividade.createAlias("chk.evento", "evt");
		critAtividade.createAlias("evt.local", "l");
		critAtividade.add(Restrictions.eq("l.id", idLocal));

		if (isValidId(idTipoMensagem)) {
			critAtividade.createAlias("mensagem", "msg");
			critAtividade.createAlias("msg.tipoMensagem", "tpMessage");
			critAtividade.add(Restrictions.eq("tpMessage.id", idTipoMensagem));
		}

		critAtividade.setProjection(Projections.rowCount());
		Number qtdAtividade = (Number) critAtividade.uniqueResult();

		final int qtd = qtdChecklist.intValue() + qtdAtividade.intValue();
		return Integer.valueOf(qtd);
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * Lista todas as Mensagens de uma Atividade.<br>
	 * Se o tipoMensagem for <i>null</i> é retornado todas as AtividadeMensagem.
	 * 
	 * @param idAtividade
	 * @param idTipoMensagem
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AtividadeMensagem> obterAtividadesMensagem(
			Serializable idAtividade, Serializable idTipoMensagem) {

		logger.debug("MensagemRepositoryImpl.obterAtividadesMensagemPorId");

		Session session = this.sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(AtividadeMensagem.class);

		criteria.addOrder(Order.desc("dataEnvio"));
		criteria.add(Restrictions.isNotNull("dataEnvio"));
		criteria.add(Restrictions.eq("atividade.id", idAtividade));
		criteria.add(Restrictions.eq("ativo", true));

		if (isValidId(idTipoMensagem)) {
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.id", idTipoMensagem));
		}

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistMensagem> obterChecklistMensagensRelatorio(
			Serializable idCheckList, Integer idEvento, Integer idLocal,
			Integer idCliente, Integer idContratante,
			Serializable idTipoMensagem) {

		logger.debug("MensagemRepositoryImpl.obterChecklistMensagensRelatorio");

		Session currentSession = HibernateUtil.getSessionFactory()
				.getCurrentSession();
		Criteria criteria = currentSession
				.createCriteria(ChecklistMensagem.class);
		criteria.addOrder(Order.desc("dataEnvio"));

		criteria.add(Restrictions.isNotNull("dataEnvio"));
		criteria.add(Restrictions.eq("checklist.id", idCheckList));
		// criteria.add(Restrictions.eq("checklist.evento.id", idEvento));
		// criteria.add(Restrictions.eq("checklist.evento.local.id", idLocal));
		// criteria.add(Restrictions.eq("id.idCliente", idCliente));
		// criteria.add(Restrictions.eq("id.idContratante", idContratante));
		criteria.add(Restrictions.eq("ativo", true));

		if (isValidId(idTipoMensagem)) {
			criteria.createAlias("mensagem", "msg");
			criteria.createAlias("msg.tipoMensagem", "tMsg");
			criteria.add(Restrictions.eq("tMsg.id", idTipoMensagem));
		}

		return criteria.list();
	}

	@Override
	public List<Mensagem> obterMensagensAssociadasAoCliente(Long idCliente) {

		logger.debug("MensagemRepositoryImpl.obterMensagensAssociadasAoCliente");

		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Mensagem.class, "m");
		criteria.createCriteria("m.clientes", "c", JoinType.INNER_JOIN);
		criteria.add(Restrictions.eq("m.ativo", true));
		criteria.add(Restrictions.eq("c.id", idCliente));
		criteria.addOrder(Order.asc("m.descricao"));

		@SuppressWarnings("unchecked")
		List<Mensagem> mensagens = (List<Mensagem>) criteria.list();
		for (Mensagem mensagem : mensagens) {
			Hibernate.initialize(mensagem.getTipoMensagem());
		}

		return mensagens;
	}

	@Override
	public List<Mensagem> obterMensagensNaoAssociadasAoCliente(Long idCliente) {

		logger.debug("MensagemRepositoryImpl.obterMensagensNaoAssociadasAoCliente");

		DetachedCriteria dc = DetachedCriteria.forClass(Cliente.class, "c");
		dc.createAlias("c.clientesMensagens", "m");
		dc.add(Restrictions.eq("c.id", idCliente));
		dc.setProjection(Property.forName("m.id"));

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class, "m");
		criteria.add(Restrictions.not(Property.forName("m.id").in(dc)));
		criteria.add(Restrictions.eq("m.ativo", true));
		criteria.addOrder(Order.asc("descricao"));

		@SuppressWarnings("unchecked")
		List<Mensagem> mensagens = (List<Mensagem>) criteria.list();
		for (Mensagem mensagem : mensagens) {
			Hibernate.initialize(mensagem.getTipoMensagem());
		}

		return mensagens;
	}

	/**
	 * Retorna todas as mensagens disponíveis que não estao associadas ao
	 * Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	@Deprecated
	@SuppressWarnings("unchecked")
	@Override
	public List<Mensagem> obterMensagensNaoSelecionadas(
			ChecklistPadrao checklistPadrao) {
		logger.debug("MensagemRepositoryImpl.obterMensagensNaoSelecionadas");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);
		criteria.addOrder(Order.asc("descricao"));

		DetachedCriteria dCriteria = DetachedCriteria
				.forClass(ChecklistPadraoMensagem.class);
		dCriteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("mensagem.id"));
		dCriteria.setProjection(Projections.distinct(projection));
		criteria.add(Property.forName("id").notIn(dCriteria));

		return criteria.list();
	}

	/**
	 * Retorna todas as mensagens disponíveis para o Usuário informado que não
	 * estao associadas ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Mensagem> obterMensagensNaoSelecionadas(
			ChecklistPadrao checklistPadrao, Serializable idUsuario) {
		logger.debug("MensagemRepositoryImpl.obterMensagensNaoSelecionadas");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);
		criteria.addOrder(Order.asc("descricao"));

		// Filtra as mensagens não associadas:
		DetachedCriteria dCriteria = DetachedCriteria
				.forClass(ChecklistPadraoMensagem.class);
		dCriteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("mensagem.id"));
		dCriteria.setProjection(Projections.distinct(projection));
		criteria.add(Property.forName("id").notIn(dCriteria));

		// Filtra as mensagens globais e associadas ao cliente:
		DetachedCriteria dCriteriaTemplate = DetachedCriteria
				.forClass(Mensagem.class);
		dCriteriaTemplate.createAlias("clientesMensagens", "pCliente");
		dCriteriaTemplate.createAlias("pCliente.cliente", "cliente");
		dCriteriaTemplate.createAlias("cliente.usuarios", "usr");
		dCriteriaTemplate.add(Restrictions.eq("usr.id", idUsuario));
		dCriteriaTemplate.setProjection(Projections.property("id"));

		criteria.add(Restrictions.or(Restrictions.eq("template", true),
				Property.forName("id").in(dCriteriaTemplate)));
		return criteria.list();
	}

	/**
	 * Retorna todas as mensagens disponíveis que estao associadas ao Checklist
	 * Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Mensagem> obterMensagensSelecionadas(
			ChecklistPadrao checklistPadrao) {
		logger.debug("MensagemRepositoryImpl.obterMensagensSelecionadas");

		Criteria criteria = criteriaChecklistMensagemSelecionadas(checklistPadrao);

		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("mensagem"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Remove as associações entre as Mensagens e o Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void removerAssociacao(ChecklistPadrao checklistPadrao) {
		logger.debug("MensagemRepositoryImpl.removerAssociacao");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session
				.createCriteria(ChecklistPadraoMensagem.class);
		criteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));

		List<ChecklistPadraoMensagem> lst = criteria.list();
		for (ChecklistPadraoMensagem entity : lst) {
			session.delete(entity);
		}

	}

	/**
	 * Associa as mensagens ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * @param idMensagens
	 */
	@Override
	public void associarMensagens(ChecklistPadrao checklistPadrao,
			List<Serializable> idMensagens) {
		logger.debug("MensagemRepositoryImpl.associarMensagens");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);

		criteria.add(Restrictions.in("id", idMensagens));
		@SuppressWarnings("unchecked")
		List<Mensagem> lst = criteria.list();

		Criteria criteriaChk = session.createCriteria(ChecklistPadrao.class);
		criteriaChk.add(Restrictions.eq("id", checklistPadrao.getId()));
		ChecklistPadrao chkPadrao = (ChecklistPadrao) criteriaChk
				.uniqueResult();

		for (Mensagem msg : lst) {
			ChecklistPadraoMensagem entity = new ChecklistPadraoMensagem(null,
					Integer.valueOf(0), msg, chkPadrao);
			session.save(entity);
		}
	}

	/**
	 * Retorna todas as Checklists Mensagens disponíveis que estao associadas ao
	 * Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ChecklistPadraoMensagem> obterChecklistPadraoMensagemSelecionadas(
			ChecklistPadrao checklistPadrao) {
		logger.debug("MensagemRepositoryImpl.obterChecklistPadraoMensagemSelecionadas");

		Criteria criteria = this
				.criteriaChecklistMensagemSelecionadas(checklistPadrao);

		return criteria.list();
	}

	/**
	 * Retorna a Criteria que pesquisa todos os Checklist Mensagens associadas
	 * ao Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	private Criteria criteriaChecklistMensagemSelecionadas(
			ChecklistPadrao checklistPadrao) {
		logger.debug("MensagemRepositoryImpl.criteriaChecklistMensagemSelecionadas");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session
				.createCriteria(ChecklistPadraoMensagem.class);
		criteria.createAlias("mensagem", "msg");
		criteria.addOrder(Order.asc("msg.descricao"));

		criteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));

		return criteria;
	}

	/**
	 * Atualizar os Checklist Padrão Mensagens.
	 * 
	 * @param checklistPadraoMensagens
	 */
	@Override
	public void atualizar(
			Collection<ChecklistPadraoMensagem> checklistPadraoMensagens) {
		logger.debug("MensagemRepositoryImpl.atualizar");

		Session session = this.sessionFactory.getCurrentSession();
		for (ChecklistPadraoMensagem entity : checklistPadraoMensagens) {
			session.update(entity);
		}

	}

	@Override
	public Mensagem obter(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class);
		criteria.add(Restrictions.eq("id", id));
		return (Mensagem) criteria.uniqueResult();
	}
}

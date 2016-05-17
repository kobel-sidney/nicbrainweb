package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.ChecklistProcedimento;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.entities.TipoClassificacao;
import br.com.kolss.model.entities.Usuario;

@Repository
public class OcorrenciaRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Retorna a Ocorrência
	 *
	 * @param idOcorrencia
	 *
	 * @return
	 */
	public Ocorrencia find(Serializable idOcorrencia) {
		logger.debug("OcorrenciaRepository.find");

		Session session = sessionFactory.getCurrentSession();
		return (Ocorrencia) session.load(Ocorrencia.class, idOcorrencia);
	}

	/**
	 * Retorna a Atividade Ocorrência.
	 *
	 * @param idAtividadeOcorrencia
	 *
	 * @return
	 */
	public AtividadeOcorrencia getAtividadeOcorrencia(Serializable idAtividadeOcorrencia) {
		logger.debug("OcorrenciaRepository.getAtividadeOcorrencia");

		Session session = sessionFactory.getCurrentSession();
		return (AtividadeOcorrencia) session.load(AtividadeOcorrencia.class, idAtividadeOcorrencia);
	}

	/**
	 * Obtém todas as ocorrências que ainda não possuem 'Data de Fim da
	 * Ocorrência'.<br>
	 *
	 * @param filtroIdLocal
	 * @param filtroIdCliente
	 * @param filtroIdContratante
	 * @param usuario
	 *
	 * @return
	 */
	@Deprecated
	@SuppressWarnings("unchecked")
	public List<Ocorrencia> getOcorrenciasEmAberto(Integer filtroIdLocal, Integer filtroIdCliente,
			Integer filtroIdContratante, Usuario usuario) {
		logger.debug("OcorrenciaRepository.getOcorrenciasEmAndamento");

		Criteria criteria = getCriteriaOcorrenciaEmAndamento();

		// FIXME: ADEQUAR AS ENTITIES V12
		// if (usuario != null) {
		// if (!usuario.getIdEventosPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idEvento",
		// usuario.getIdEventosPorContexto()));
		// }
		// if (!usuario.getIdContratantesPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idContratante",
		// usuario.getIdContratantesPorContexto()));
		// }
		// if (!usuario.getIdClientesPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idCliente",
		// usuario.getIdClientesPorContexto()));
		// }
		// if (!usuario.getIdLocaisPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idLocal",
		// usuario.getIdLocaisPorContexto()));
		// }
		// }
		if (filtroIdLocal != null && filtroIdLocal.intValue() > 0) {
			criteria.add(Restrictions.eq("contexto.id.idLocal", filtroIdLocal));
		}

		if (filtroIdCliente != null && filtroIdCliente.intValue() > 0) {
			criteria.add(Restrictions.eq("contexto.id.idCliente", filtroIdCliente));
		}

		if (filtroIdContratante != null && filtroIdContratante.intValue() > 0) {
			criteria.add(Restrictions.eq("contexto.id.idContratante", filtroIdContratante));
		}

		return criteria.list();
	}

	/**
	 * Retorna todas as Ocorrências Em Andamento de um Local e autorizadas para
	 * o Usuário selecionado (via contexto).
	 *
	 * @param local
	 * @param user
	 *
	 * @return
	 */
	@Deprecated
	@SuppressWarnings("unchecked")
	public List<Ocorrencia> getOcorrenciasEmAndamentoPorLocalPorContexto(Local local, Usuario user) {
		logger.debug("OcorrenciaRepository.getOcorrenciasPorLocal");

		Criteria criteria = getCriteriaOcorrenciaEmAndamento();
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		// FIXME: ADEQUAR AS ENTITIES V12
		// criteria.add(Restrictions.eq("contexto.id.idLocal",
		// local.getIdLocal()));
		// criteria.add(Restrictions.eq("contexto.id.idCliente",
		// local.getIdCliente()));
		// criteria.add(Restrictions.eq("contexto.id.idContratante",
		// local.getIdContratante()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));

		// FIXME: ADEQUAR AS ENTITIES V12
		// Filtros por contexto:
		// criteria.add(Restrictions.in("contexto.id.idContratante",
		// user.getIdContratantesPorContexto()));
		// criteria.add(Restrictions.in("contexto.id.idCliente",
		// user.getIdClientesPorContexto()));
		// criteria.add(Restrictions.in("contexto.id.idEvento",
		// user.getIdEventosPorContexto()));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Ocorrencia> getOcorrenciasEmAndamentoPorEvento(Serializable filtroIdEvento,
			Serializable filtroIdContratante, Serializable filtroIdCliente, Serializable filtroIdLocal,
			Usuario usuarioContexto) {
		logger.debug("OcorrenciaRepository.getOcorrenciasEmAndamentoPorEvento");

		Criteria criteria = getCriteriaOcorrenciaEmAndamento();
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		// FIXME: ADEQUAR AS ENTITIES V12
		// Filtro por Contexto:
		// if (usuarioContexto != null && usuarioContexto.getIdPessoa() != null)
		// {
		// if (!usuarioContexto.getIdEventosPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idEvento",
		// usuarioContexto.getIdEventosPorContexto()));
		// }
		// if (!usuarioContexto.getIdContratantesPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idContratante",
		// usuarioContexto.getIdContratantesPorContexto()));
		// }
		// if (!usuarioContexto.getIdClientesPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idCliente",
		// usuarioContexto.getIdClientesPorContexto()));
		// }
		// if (!usuarioContexto.getIdLocaisPorContexto().isEmpty()) {
		// criteria.add(Restrictions.in("contexto.id.idLocal",
		// usuarioContexto.getIdLocaisPorContexto()));
		// }
		// }
		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.local", "l");
		criteria.createAlias("l.cliente", "cli");
		criteria.createAlias("cli.contratante", "con");
		// criteria.createAlias("evt.usuariosNoEvento" , "usrContexto");

		// Filtros
		if (isValidId(filtroIdContratante)) {
			criteria.add(Restrictions.eq("con.id", filtroIdContratante));
		}
		if (isValidId(filtroIdCliente)) {
			criteria.add(Restrictions.eq("cli.id", filtroIdCliente));
		}
		if (isValidId(filtroIdLocal)) {
			criteria.add(Restrictions.eq("l.id", filtroIdLocal));
		}
		if (isValidId(filtroIdEvento)) {
			criteria.add(Restrictions.eq("evt.id", filtroIdEvento));
		}

		return criteria.list();
	}

	/**
	 * Retorna as Ocorrências ativas, ordenadas em ordem decrescente da data de
	 * criação podendo filtrar a consulta.
	 *
	 * @param filtroIdEvento
	 * @param filtroIdLocal
	 * @param filtroIdClassificacao
	 * @param filtroIdTipoClassificacao
	 * @param filtroIdStatus
	 * @param filtroIdResponsavel
	 * @param filtroIdSuperior
	 * @param filtroDataInicio
	 * @param idUsuarioContexto
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Ocorrencia> getOcorrenciasEmAndamento(Serializable filtroIdEvento, Serializable filtroIdLocal,
			Serializable filtroIdClassificacao, Serializable filtroIdTipoClassificacao, Serializable filtroIdStatus,
			Serializable filtroIdResponsavel, Serializable filtroIdSuperior, Date filtroDataInicio,
			Serializable idUsuarioContexto) {
		logger.debug("OcorrenciaRepository.getOcorrenciasEmAndamento");

		Criteria criteria = getCriteriaOcorrenciaEmAndamento();

		// Filtra por Contexto:
		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Filtros:
		if (isValidId(filtroIdEvento)) {
			criteria.add(Restrictions.eq("evt.id", filtroIdEvento));
		}
		if (isValidId(filtroIdLocal)) {
			criteria.createAlias("evt.local", "l");
			criteria.add(Restrictions.eq("l.id", filtroIdLocal));
		}
		if (isValidId(filtroIdClassificacao)) {
			criteria.add(Restrictions.eq("classificacaoOcorrencia.id", filtroIdClassificacao));
		}
		if (isValidId(filtroIdTipoClassificacao)) {
			criteria.add(Restrictions.eq("tipoClassificacao.id", filtroIdTipoClassificacao));
		}
		if (isValidId(filtroIdStatus)) {
			criteria.add(Restrictions.eq("status.id", filtroIdStatus));
		}
		if (isValidId(filtroIdResponsavel)) {
			criteria.add(Restrictions.eq("usuarioResponsavel.id", filtroIdResponsavel));
		}
		if (isValidId(filtroIdSuperior)) {
			DetachedCriteria dCriteria = DetachedCriteria.forClass(Funcionario.class);
			dCriteria.add(Restrictions.eq("usuario.id", filtroIdSuperior));
			criteria.createAlias("funcionariosSubordinados", "fSubordinado");
			criteria.createAlias("fSubordinado.usuario", "usr");
			dCriteria.setProjection(Projections.property("usr.id"));
			criteria.add(Property.forName("usuarioResponsavel.id").in(dCriteria));
		}
		if (filtroDataInicio != null) {
			criteria.add(Restrictions.ge("dataInicio", filtroDataInicio));
		}

		// SQL Distinct:
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}

	/**
	 * Verifica se existe alguma Ocorrência ativa no Local e autorizada para o
	 * Usuário selecionado (via contexto).
	 *
	 * @param idLocal
	 * @param user
	 *
	 * @return
	 */
	public boolean existeOcorrenciaAtivaPorLocalPorContexto(Serializable idLocal, Usuario user) {
		logger.debug("OcorrenciaRepository.existeOcorrenciaAtivaPorLocalPorContexto");

		Criteria criteria = getCriteriaOcorrenciaEmAndamento();

		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.local", "l");
		criteria.add(Restrictions.eq("l.id", idLocal));
		criteria.add(Restrictions.eq("usuarioResponsavel", user));

		// FIXME: ADEQUAR AS ENTITIES V12
		// criteria.add(Restrictions.in("contexto.id.idEvento",
		// user.getIdEventosPorContexto()));
		// criteria.add(Restrictions.in("contexto.id.idCliente",
		// user.getIdClientesPorContexto()));
		// criteria.add(Restrictions.in("contexto.id.idContratante",
		// user.getIdContratantesPorContexto()));
		criteria.setProjection(Projections.rowCount());
		Number qtd = (Number) criteria.uniqueResult();

		return (qtd.intValue() > 0 ? true : false);
	}

	/**
	 * Gera a Criteria para pesquisas de Ocorrências Em Andamento.
	 *
	 * @return
	 */
	private Criteria getCriteriaOcorrenciaEmAndamento() {
		logger.debug("OcorrenciaRepository.getCriteriaOcorrenciaEmAndamento");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Ocorrencia.class);

		criteria.addOrder(Order.desc("dataInicio"));
		criteria.add(Restrictions.isNull("dataFim"));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.add(Restrictions.eq("ativo", true));

		return criteria;
	}

	/**
	 * Retorna todos os Checklists Procedimentos Ocorrência associadas a uma
	 * Classificação Ocorrência.
	 *
	 * @param idClassificacaoOcorrencia
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ChecklistProcedimento> getChecklistsProcedimentosOcorrencias(Integer idClassificacaoOcorrencia) {
		logger.debug("OcorrenciaRepository.getChecklistsProcedimentosOcorrencias");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistProcedimento.class);

		criteria.addOrder(Order.asc("id.nrItem"));
		criteria.add(Restrictions.eq("id.idClassificacaoOcorrencia", idClassificacaoOcorrencia));

		return criteria.list();
	}

	/**
	 * Persiste uma nova Ocorrência.
	 *
	 * @param ocorrencia
	 *
	 * @return
	 */
	// @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Serializable salvar(Ocorrencia ocorrencia) {
		logger.debug("OcorrenciaRepository.salvar(Ocorrencia)");

		Session session = sessionFactory.getCurrentSession();
		Serializable serializable = session.save(ocorrencia);

		// session.flush();
		return serializable;
	}

	/**
	 * Atualiza os dados da Ocorrência.
	 *
	 * @param ocorrencia
	 *
	 * @return
	 */
	// @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Ocorrencia ocorrencia) {
		logger.debug("OcorrenciaRepository.atualizar");
		ocorrencia.setDataUltimaAtualizacao(new Date());
		Session session = sessionFactory.getCurrentSession();
		session.update(ocorrencia);
		session.flush();
	}

	/**
	 * Persiste uma nova Atividade Ocorrência.
	 *
	 * @param atividadeOcorrencia
	 *
	 * @return
	 */
	// @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public Serializable salvar(AtividadeOcorrencia atividadeOcorrencia) {
		logger.debug("OcorrenciaRepository.salvar(AtividadeOcorrencia)");

		Session session = sessionFactory.getCurrentSession();
		Serializable serializable = session.save(atividadeOcorrencia);

		// session.flush();
		return serializable;
	}

	/**
	 * Atualizar uma nova Atividade Ocorrência.
	 *
	 * @param atividadeOcorrencia
	 *
	 * @return
	 */
	// @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(AtividadeOcorrencia atividadeOcorrencia) {
		logger.debug("OcorrenciaRepository.atualizar(AtividadeOcorrencia)");

		Session session = sessionFactory.getCurrentSession();
		session.update(atividadeOcorrencia);
		session.flush();
	}

	/**
	 * Associa uma imagem a uma Ocorrência.
	 *
	 * @param idOcorrencia
	 * @param byteArrayImagem
	 */
	// @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarImagem(Serializable idOcorrencia, String byteArrayImagem) {
		logger.debug("OcorrenciaRepository.salvarImagem");

		byte[] decodeString = Base64.decodeBase64(byteArrayImagem);
		Ocorrencia ocorrencia = find(idOcorrencia);
		ocorrencia.setFoto(decodeString);

		Session session = sessionFactory.getCurrentSession();
		session.update(ocorrencia);
		session.flush();
	}

	/**
	 * Retorna todas as Atividades Ocorrências associadas a uma Ocorrência.
	 *
	 * @param idOcorrencia
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AtividadeOcorrencia> obterAtividadesPorOcorrencia(Serializable idOcorrencia) {
		logger.debug("OcorrenciaRepository.getAtividadesOcorrencias");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeOcorrencia.class);

		criteria.addOrder(Order.asc("numeroItem"));
		criteria.add(Restrictions.ne("status.id", StatusEnum.FINALIZADA.getId()));
		criteria.add(Restrictions.ne("status.id", StatusEnum.CANCELADA.getId()));
		criteria.add(Restrictions.eq("ocorrencia.id", idOcorrencia));

		return criteria.list();
	}

	/**
	 * Retorna a quantidade de Atividades Ocorrência Em Andamento de uma
	 * Ocorrência.
	 *
	 * @param ocorrencia
	 *
	 * @return
	 */
	public Integer getQuantidadeAtividadesOcorrenciaEmAndamento(Ocorrencia ocorrencia) {
		logger.debug("OcorrenciaRepository.getQuantidadeAtividadesOcorrenciaEmAndamento");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeOcorrencia.class);

		criteria.setProjection(Projections.rowCount());
		criteria.add(Restrictions.eq("ocorrencia", ocorrencia));
		criteria.add(Restrictions.or(Restrictions.eq("status.id", StatusEnum.EM_ANDAMENTO.getId()),
				Restrictions.eq("status.id", StatusEnum.AGUARDANDO.getId())));

		Number qtd = (Number) criteria.uniqueResult();
		return Integer.valueOf(qtd.intValue());
	}

	@SuppressWarnings("rawtypes")
	public List listarTotalOcorrenciaPorLocal(Date dateFrom, Date dateTo, Serializable idUsuarioContexto) {
		logger.debug("OcorrenciaRepository.listarTotalOcorrenciaPorLocal");

		// StringBuilder sql = new StringBuilder();
		// sql.append("SELECT COUNT( * ) , l.nome, o . * ");
		// sql.append(" FROM ocorrencia o, local l ");
		//
		// hql.append(" LEFT JOIN FETCH o.evento evt ");
		// hql.append(" LEFT JOIN FETCH evt.usuarios usr with usr.id in
		// (:idUsuario) ");
		//
		// sql.append(" WHERE o.local.id = l.id ");
		// if(dateFrom != null){
		// sql.append(" AND o.dataInicio BETWEEN(:dateFrom) AND (:dateTo) ");
		// }
		// sql.append(" GROUP BY o.local.id");
		//
		// try {
		// Session session = sessionFactory.getCurrentSession();
		// Query query = session.createSQLQuery(sql.toString());
		//
		// if (dateFrom != null) {
		// query.setDate("dateFrom", dateFrom);
		// query.setDate("dateTo", dateTo);
		// }
		//
		// return query.list();
		// } catch (Exception e) {
		// logger.error(e.getMessage(), e);
		// throw new DaoException("Erro ao listar Ocorrência por local");
		// }
		// Number numero = (Number) array[0];
		// String nomeLocal = (String) array[1];
		// FIXME: Arrumar quando mexer nas Ocorrências:
		return Collections.EMPTY_LIST;
	}

	@SuppressWarnings("rawtypes")
	public List listarOcorrenciaPorLocal(Serializable idLocal, Date dateFrom, Date dateTo,
			Serializable idUsuarioContexto) {
		logger.debug("OcorrenciaRepository.listarOcorrenciaPorLocal");

		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//
		// StringBuilder sql = new StringBuilder();
		// sql.append("SELECT COUNT( * ) , c.nomeClassificacaoOcorrencia FROM
		// ocorrencia o, classificacao_ocorrencia c");
		// sql.append(" WHERE o.IdClassificacaoOcorrencia =
		// c.IdClassificacaoOcorrencia");
		// sql.append(" AND o.IdLocal = :idLocal");
		// if(dateFrom != null){
		// sql.append(" AND DtInicioOcorrencia BETWEEN(:dateFrom)AND(:dateTo)");
		// }
		// sql.append(" GROUP BY o.IdClassificacaoOcorrencia");
		//
		// try {
		// // FIXME: Usar a injeção!
		// Session session = FacesContextUtil.getRequestSession();
		//
		// Query query = session.createSQLQuery(sql.toString());
		// query.setInteger("idLocal", idLocal);
		// if(dateFrom != null){
		// query.setString("dateFrom", sdf.format(dateFrom));
		// query.setString("dateTo", sdf.format(dateTo));
		// }
		// List retorno = query.list();
		//
		// return retorno;
		// } catch (Exception e) {
		// logger.error(e.getMessage(), e);
		// throw new DaoException("Erro ao listar Ocorrencias por local");
		// }
		// FIXME: Arrumar quando mexer nas Ocorrências:
		return Collections.EMPTY_LIST;
	}

	public TipoClassificacao getTipoClassificacaoOcorrencia(String nomeTipoClassificacao) {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoClassificacao.class);
		criteria.add(Restrictions.ilike("nome", nomeTipoClassificacao, MatchMode.EXACT));

		return (TipoClassificacao) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Ocorrencia> listarOcorrenciaPorStatus(Status status, Usuario user) {
		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Ocorrencia.class, "ocorrencia");
		criteria.add(Restrictions.eq("status", status));
		criteria.createAlias("ocorrencia.status", "status");

		criteria.createAlias("evento", "evt");
		criteria.add(Restrictions.eq("usuarioResponsavel", user));

		return (List<Ocorrencia>) criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Ocorrencia> obterOcorrenciasEmEsperaPorUsuario(Usuario usuario) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Ocorrencia.class, "ocorrencia");
		criteria.add(Restrictions.eq("status.id", 2L));
		criteria.createAlias("ocorrencia.status", "status");

		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioNoEvento");
		criteria.add(Restrictions.eq("usuarioNoEvento.id", usuario.getId()));

		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Ocorrencia> obterOcorrenciasFinalizadasPorUsuario(Usuario usuario, Date inicio, Date fim) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Ocorrencia.class, "ocorrencia");
		criteria.add(Restrictions.eq("status.id", 6L));
		criteria.createAlias("ocorrencia.status", "status");
		
		criteria.add(Restrictions.between("dataFim", inicio, fim));

		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioNoEvento");
		criteria.add(Restrictions.eq("usuarioNoEvento.id", usuario.getId()));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Ocorrencia> obterOcorrenciasEmEsperaPorResponsavel(Usuario usuario) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Ocorrencia.class, "ocorrencia");
		criteria.add(Restrictions.eq("status.id", 2L));
		criteria.add(Restrictions.eq("usuarioResponsavel", usuario));
		
		return criteria.list();
	}

	public List<AtividadeOcorrencia> listarAtividadeOcorrenciaPorUsuario(Long idusuario) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AtividadeOcorrencia.class);
		Criterion statusAgendado = Restrictions.eq("status.id", StatusEnum.AGENDADO.getId());
		Criterion statusAguardando = Restrictions.eq("status.id", StatusEnum.AGUARDANDO.getId());
		criteria.add(Restrictions.or(statusAgendado,statusAguardando));
		criteria.add(Restrictions.eq("usuarioResponsavel.id", idusuario));
		
		return criteria.list();
	}
}

package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Usuario;

@Repository
@Transactional(readOnly=false)
public class FuncionarioRepositoryImpl implements FuncionarioRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Retorna o Funcionário pelo seu ID.
	 *
	 * @param idFuncionario
	 *
	 * @return
	 */
	@Override
	public Funcionario buscar(Serializable idFuncionario) {
		logger.debug("FuncionarioRepository.find(idFuncionario)");

		Session session = this.sessionFactory.getCurrentSession();
		return (Funcionario) session.load(Funcionario.class, idFuncionario);
	}

	/**
	 * Retorna o Funcionário pelo seu Usuário associado.
	 *
	 * @param usuario
	 *
	 * @return
	 */
	@Override
	public Funcionario find(Usuario usuario) {
		logger.debug("FuncionarioRepository.find(Usuario)");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);

		criteria.add(Restrictions.eq("usuario.id", usuario.getId()));
		return (Funcionario) criteria.uniqueResult();
	}

	/**
	 * Retorna o(s) Funcionario(s) pelo seu ID, contendo todos os seus atributos
	 * populados.
<<<<<<< HEAD
	 *
=======
	 * 
>>>>>>> crud_evento_modelo_antigo
	 * @param idMensagem
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Funcionario> find(Collection<Serializable> idFuncionarios) {
		logger.debug("FuncionarioRepository.find(idFuncionarios)");

		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);
		criteria.add(Restrictions.in("id", idFuncionarios));

		List<Funcionario> lst = criteria.list();
		for (Funcionario fnc : lst) {
			fnc.toString();
		}

		return lst;
	}

	/**
	 * Obtém o Funcionário Responsável pela Atividade.
	 *
	 * @param idAtividade
	 *
	 * @return
	 */
	@Override
	public Funcionario getResponsavelPorAtividade(Serializable idAtividade) {
		logger.debug("FuncionarioRepository.getResponsavelPorAtividade");

		DetachedCriteria dCriteria = DetachedCriteria.forClass(Atividade.class);
		dCriteria.setProjection(Projections.property("usuarioResponsavel.id"));
		dCriteria.add(Restrictions.eq("id", idAtividade));

		return this.getFuncionarioResponsavel(dCriteria);
	}

	/**
	 * Obtém o Funcionário Responsável pelo Checklist.
	 *
	 * @param idChecklist
	 *
	 * @return
	 */
	@Override
	public Funcionario getResponsavelPorChecklist(Serializable idChecklist) {
		logger.debug("FuncionarioRepository.getResponsavelPorChecklist");

		DetachedCriteria dCriteria = DetachedCriteria.forClass(Checklist.class);
		dCriteria.setProjection(Projections.property("usuarioResponsavel.id"));
		dCriteria.add(Restrictions.eq("id", idChecklist));

		return this.getFuncionarioResponsavel(dCriteria);
	}

	/**
	 * Obtém o Funcionário Responsável do atributo da <i>Entity</i> vinda do
	 * Detached Criteria.
	 *
	 * @param detachedCriteria
	 *
	 * @return
	 */
	private Funcionario getFuncionarioResponsavel(
			DetachedCriteria detachedCriteria) {
		logger.debug("FuncionarioRepository.getFuncionarioResponsavel");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);

		criteria.add(Property.forName("usuario.id").eq(detachedCriteria));
		return (Funcionario) criteria.uniqueResult();

		// // Obtem apenas o Funcionario Responsavel:
		// ProjectionList projection = Projections.projectionList();
		// projection.add(Projections.property("funcionarioResponsavel"));
		// criteria.setProjection(Projections.distinct(projection));
		//
		// Funcionario fnc = (Funcionario) criteria.uniqueResult();
		// if (fnc != null) {
		// fnc.toString();
		// }
		//
		// return fnc;
	}

	/**
	 * Obtém o Funcionário Superior Responsável pela Atividade.
	 *
	 * @param idAtividade
	 *
	 * @return
	 */
	@Override
	public Funcionario getResponsavelSuperiorPorAtividade(
			Serializable idAtividade) {
		logger.debug("FuncionarioRepository.getResponsavelSuperiorPorAtividade");

		Funcionario fnc = this.getResponsavelPorAtividade(idAtividade);
		return fnc.getFuncionarioSuperior();
	}

	/**
	 * Obtém o Funcionário Superior Responsável pelo Checklist.
	 *
	 * @param idChecklist
	 *
	 * @return
	 */
	@Override
	public Funcionario getResponsavelSuperiorPorChecklist(
			Serializable idChecklist) {
		logger.debug("FuncionarioRepository.getResponsavelSuperiorPorChecklist");

		Funcionario fnc = this.getResponsavelPorChecklist(idChecklist);
		return fnc.getFuncionarioSuperior();
	}

	/**
	 * Realiza a pesquisa do Funcionario Superior.
	 *
	 * @param detachedCriteria
	 *
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Funcionario getFuncionarioSuperior(Serializable id,	Class<? extends AbstractEntity> classe) {
		logger.debug("FuncionarioRepository.getFuncionarioSuperior(Serializable, Class)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);

		// Pesquisa o Usuário Responsável:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(classe);
		dCriteria.setProjection(Projections.property("usuarioResponsavel.id"));
		dCriteria.add(Restrictions.eq("id", id));
		criteria.add(Property.forName("usuario.id").in(dCriteria));

		// Retorna somente o Funcionário Superior:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("funcionarioSuperior"));
		criteria.setProjection(Projections.distinct(projection));

		return (Funcionario) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Funcionario> getFuncionariosResponsaveisPorAtividade(
			Usuario user) {

		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Atividade.class);
		criteria.createAlias("funcionarioResponsavel", "f");
		criteria.createAlias("f.pessoa", "p");
		criteria.addOrder(Order.asc("p.nomePessoa"));
		criteria.add(Restrictions.eq("ativo", true));

		// Filtros por contexto:
		criteria.add(Restrictions.in("evt.id", user.getEventosUsuario()));

		// Obter apenas os Funcionarios:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("funcionarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Funcionario> getFuncionariosResponsaveisPorChecklist(
			Usuario user) {

		Session session = sessionFactory.getCurrentSession();

		Criteria criteria = session.createCriteria(Atividade.class);
		criteria.createAlias("usuarioResponsavel", "f");
		criteria.createAlias("f.pessoa", "p");
		criteria.addOrder(Order.asc("p.nome"));
		criteria.add(Restrictions.eq("ativo", true));

		// Filtros por contexto:
		criteria.add(Restrictions.eq("f.id", user.getId()));

		// Obter apenas os Funcionarios:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getPorEvento(Usuario usuario) {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Evento.class);

		criteria.add(Restrictions.eq("ativo", true));
		criteria.addOrder(Order.asc("usuarioResponsavel"));

		// Filtros por contexto:
		// criteria.add(Restrictions.eq("usr.id", idUsuarioContexto));
		// criteria.add(Restrictions.in("id", usuario.getEventosContexto()));

		// Obter apenas os nomes do responsavel pelo Evento:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Funcionario> listarTodosFuncionarios() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class,
				"funcionario");
		criteria.createAlias("funcionario.usuario", "usuario");
		criteria.createAlias("usuario.pessoa", "pessoa");

		return criteria.list();
	}

	/*
	 * Salva ou atualiza funcionario
	 *
	 * @param funcionario
	 */
	@Override
	public void salvarOuAtualizar(Funcionario funcionario) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(funcionario);
	}

	@Override
	public void atualizar(Funcionario funcionario) {
		Session session = sessionFactory.getCurrentSession();
		session.update(funcionario);
	}

	@Override
	public void excluir(Funcionario funcionario) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(funcionario);
	}

	/**
	 * Retorna todos os Funcionários cadastrados
	 * 
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Funcionario> getFuncionarios() {
		logger.debug("FuncionarioRepository.getFuncionarios");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);
	    criteria.createAlias("usuario", "usr").addOrder(Order.asc("usr.nome"));

		return criteria.list();
	}

}

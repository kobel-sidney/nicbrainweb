package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

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

import br.com.kolss.model.entities.ChecklistPadrao;
import br.com.kolss.model.entities.ChecklistProcedimento;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Procedimento;


@Repository
public class ProcedimentoRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Procedimento.
	 * 
	 * @param idProcedimento
	 * 
	 * @return
	 */
	public Procedimento find(Serializable idProcedimento) {
		logger.debug("ProcedimentoRepository.find");
		
		Session session = sessionFactory.getCurrentSession();
		return (Procedimento) session.load(Procedimento.class, idProcedimento);
	}
	
	/**
	 * Retorna os Procedimentos cadastrados, em ordem alfabética do nome.
	 * @param contratante 
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Procedimento> obterTodos(Contratante contratante) {
		logger.debug("ProcedimentoRepository.obterTodos");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Procedimento.class);
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	/**
	 * Retorna os Procedimentos disponíveis para o Usuário informado, em ordem
	 * alfabética do nome do Procedimento.
	 * 
	 * @param idUsuario
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Procedimento> getProcedimentos(Serializable idUsuario) {
		logger.debug("ProcedimentoRepository.getProcedimentos(idUsuario)");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Procedimento.class);
		criteria.addOrder(Order.asc("nome"));
		
		DetachedCriteria dCriteria = DetachedCriteria.forClass(
				Procedimento.class);
		dCriteria.createAlias("procedimentosClientes", "pCliente");
		dCriteria.createAlias("pCliente.cliente", "cliente");
		dCriteria.createAlias("cliente.usuarios", "usr");
		dCriteria.add(Restrictions.eq("usr.id", idUsuario));
		dCriteria.setProjection(Projections.property("id"));
		
		criteria.add(Restrictions.or(Restrictions.eq("template", true),
				Property.forName("id").in(dCriteria)));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Procedimento> getProcedimentosSelecionados(
			ChecklistPadrao checklistPadrao) {
		logger.debug("ProcedimentoRepository.getProcedimentosSelecionados");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistProcedimento.class);
		criteria.addOrder(Order.asc("numeroItem"));
		criteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));
		
		// Retorna somente os Procedimentos:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("procedimento"));
		criteria.setProjection(projection);
		
		return criteria.list();
	}
	
	/**
	 * Retorna todos os Procedimentos disponíveis para o Usuário inforamdo para
	 * associar com o Checklist Padrão escolhido.<br>
	 * Ordenado pela ordem do nome do procedimento.
	 * 
	 * @param checklistPadrao
	 * @param idUsuario
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Procedimento> getProcedimentosNaoSelecionados(
			ChecklistPadrao checklistPadrao, Serializable idUsuario) {
		logger.debug("ProcedimentoRepository.getProcedimentosNaoSelecionados");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Procedimento.class);
		criteria.addOrder(Order.asc("nome"));
		
		// Filtra os procedimentos ja associados:
		if (checklistPadrao != null && isValidId(checklistPadrao.getId())) {
			
			DetachedCriteria dCriteria = DetachedCriteria.forClass(
					ChecklistProcedimento.class);
			dCriteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));
			dCriteria.setProjection(Projections.property("procedimento.id"));
			criteria.add(Property.forName("id").notIn(dCriteria));
		}
		
		DetachedCriteria dCriteria = DetachedCriteria.forClass(
				Procedimento.class);
		dCriteria.createAlias("procedimentosClientes", "pCliente");
		dCriteria.createAlias("pCliente.cliente", "cliente");
		dCriteria.createAlias("cliente.usuarios", "usr");
		dCriteria.add(Restrictions.eq("usr.id", idUsuario));
		dCriteria.setProjection(Projections.property("id"));
		
		criteria.add(Restrictions.or(Restrictions.eq("template", true),
				Property.forName("id").in(dCriteria)));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	
	/**
	 * Salva um novo procedimento.
	 * 
	 * @param procedimento
	 * 
	 * @return
	 */
	public Serializable salvar(Procedimento procedimento) {
		logger.debug("ProcedimentoRepository.salvar");
		
		Session session = sessionFactory.getCurrentSession();
		Serializable serializable = session.save(procedimento);
		
		return serializable;
	}
	
	/**
	 * Atualiza um procedimento.
	 * 
	 * @param procedimento
	 */
	public void atualizar(Procedimento procedimento) {
		logger.debug("ProcedimentoRepository.atualizar");
		
		Session session = sessionFactory.getCurrentSession();
		session.update(procedimento);
	}
	
	/**
	 * Remove um procedimento.
	 * 
	 * @param procedimento
	 */
	public void remover(Procedimento procedimento) {
		logger.debug("ProcedimentoRepository.remover");
		
		Session session = sessionFactory.getCurrentSession();
		session.delete(procedimento);
	}

}

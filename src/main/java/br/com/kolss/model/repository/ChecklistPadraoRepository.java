package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
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
public class ChecklistPadraoRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Checklist Padrão.
	 * 
	 * @param idChecklistPadrao
	 * 
	 * @return
	 */
	public ChecklistPadrao obter(Serializable idChecklistPadrao ,Contratante  contratante) {
		logger.debug("ChecklistPadraoRepository.obter");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistPadrao.class);
		criteria.add(Restrictions.eq("id", idChecklistPadrao));
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return (ChecklistPadrao) criteria.uniqueResult();
	}
	
	/**
	 * Retorna os Checklists Padrões cadastrados, em ordem alfabética do nome.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ChecklistPadrao> obterTodos(Contratante contratante) {
		logger.debug("ChecklistPadraoRepository.getChecklistsPadroes");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistPadrao.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	/**
 	 * Retorna os Checklists Padrões disponíveis para o Usuário informado, em
 	 * ordem alfabética do nome do Checklist Padrão.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ChecklistPadrao> obterPorUsuario(Serializable idUsuario) {
		logger.debug("ChecklistPadraoRepository.getChecklistsPadroes");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistPadrao.class);
		criteria.addOrder(Order.asc("nome"));
		
		DetachedCriteria dCriteria = DetachedCriteria.forClass(ChecklistPadrao.class);
		dCriteria.createAlias("checklistsPadraoClientes", "pCliente");
		dCriteria.createAlias("pCliente.cliente", "cliente");
		dCriteria.createAlias("cliente.usuarios", "usr");
		dCriteria.add(Restrictions.eq("usr.id", idUsuario));
		dCriteria.setProjection(Projections.property("id"));

		criteria.add(Restrictions.or(Restrictions.eq("template", true),	Property.forName("id").in(dCriteria)));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
	
	/**
	 * Salva um novo Checklist Padrao.
	 * 
	 * @param checklistPadrao
	 * 
	 * @return
	 */
	public Serializable salvar(ChecklistPadrao checklistPadrao) {
		logger.debug("ChecklistPadraoRepository.salvar");
		
		Session session = sessionFactory.getCurrentSession();
		Serializable serializable = session.save(checklistPadrao);
		
		return serializable;
	}
	
	/**
	 * Atualiza um Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 */
	public void atualizar(ChecklistPadrao checklistPadrao) {
		logger.debug("ChecklistPadraoRepository.atualizar");
		
		Session session = sessionFactory.getCurrentSession();
		session.update(checklistPadrao);
	}
	
	/**
	 * Remove um Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 */
	public void remover(ChecklistPadrao checklistPadrao) {
		logger.debug("ChecklistPadraoRepository.remover");
		
		Session session = sessionFactory.getCurrentSession();
		session.delete(checklistPadrao);
	}

	/**
	 * Remove os Checklists Padrão.
	 * 
	 * @param checklistPadrao
	 */
	public void remover(Collection<ChecklistPadrao> checklistsPadrao) {
		logger.debug("ChecklistPadraoRepository.remover(Collection<ChecklistPadrao>)");
		
		if (checklistsPadrao != null && !checklistsPadrao.isEmpty()) {
			Session session = sessionFactory.getCurrentSession();
			for (ChecklistPadrao entity : checklistsPadrao) {
				session.delete(entity);
			}
		}
	}
	
	/**
	 * Remove todas as associações entre os Procedimentos com o Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 */
	public void removerAssociacao(
			ChecklistPadrao checklistPadrao) {
		logger.debug("ChecklistPadraoRepository.removerAssociacao");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ChecklistProcedimento.class);
		
		criteria.add(Restrictions.eq("checklistPadrao", checklistPadrao));
		@SuppressWarnings("unchecked")
		List<ChecklistProcedimento> lst = criteria.list();
		
		for (ChecklistProcedimento entity : lst) {
			session.delete(entity);
		}
	}
	
	/**
	 * Associa os Procedimentos aos Checklist Padrão.
	 * 
	 * @param checklistPadrao
	 * @param idProcedimentos
	 */
	public void associarProcedimentos(ChecklistPadrao checklistPadrao,
			List<Serializable> idProcedimentos) {
		logger.debug("ChecklistPadraoRepository.associarProcedimentos");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Procedimento.class);
		criteria.add(Restrictions.in("id", idProcedimentos));
		@SuppressWarnings("unchecked")
		List<Procedimento> procedimentos = criteria.list();
		
		Criteria criteriaChk = session.createCriteria(ChecklistPadrao.class);
		criteriaChk.add(Restrictions.eq("id", checklistPadrao.getId()));
		ChecklistPadrao chkPadrao = (ChecklistPadrao) criteriaChk.uniqueResult();
		
		int numeroItem = 1;
		for (Serializable id : idProcedimentos) {
			for (Procedimento procedimento : procedimentos) {
				if (procedimento.getId().equals(id)) {
					ChecklistProcedimento entity = new ChecklistProcedimento(
							chkPadrao, procedimento, numeroItem);
					session.save(entity);
					numeroItem++;
					break;
				}
			}
			
		}
	}
	
}

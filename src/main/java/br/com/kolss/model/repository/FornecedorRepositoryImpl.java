package br.com.kolss.model.repository;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Fornecedor;

@Repository
@Transactional(readOnly = true)
public class FornecedorRepositoryImpl implements FornecedorRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Fornecedor> obterTodos(Contratante contratante) {
		
		logger.debug("FornecedorRepositoryImpl.listar");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Fornecedor.class);
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		criteria.addOrder(Order.asc("nomeFantasia"));
		
		return (List<Fornecedor>) criteria.list();
	}
	
	@Override
	@Transactional(readOnly = false)
	public void salvar(Fornecedor fornecedor) {
		
		logger.debug("FornecedorRepositoryImpl.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(fornecedor);
	}

	@Override
	@Transactional(readOnly = false)
	public void atualizar(Fornecedor fornecedor) {
		
		logger.debug("FornecedorRepositoryImpl.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(fornecedor);
	}

	@Override
	@Transactional(readOnly = false)
	public void remover(Fornecedor fornecedor) {
		
		logger.debug("FornecedorRepositoryImpl.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(fornecedor);
	}

}

package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.TipoEndereco;

@Repository
public class TipoEnderecoRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * Retorna todos os tipos de endereços cadastrados no sistema.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TipoEndereco> getTiposEnderecos() {

		logger.debug("BbTipoEnderecoRepository.getTiposEnderecos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoEndereco.class);
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

	public TipoEndereco buscar(Long id) {
		
		logger.debug("TipoEnderecoRepository.buscar()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoEndereco.class);
		criteria.add(Restrictions.eq("id", id));
		
		return (TipoEndereco) criteria.uniqueResult();
	}

	public void remover(TipoEndereco tipoEndereco) {
		
		logger.debug("TipoEnderecoRepository.remover()");
		Session session = sessionFactory.getCurrentSession();
		session.delete(tipoEndereco);
	}

	public void salvar(TipoEndereco tipoEndereco) {
		logger.debug("TipoEnderecoRepository.salvar()");
		Session session = sessionFactory.getCurrentSession();
		session.save(tipoEndereco);
	}

	public void atualizar(TipoEndereco tipoEndereco) {
		logger.debug("TipoEnderecoRepository.atualizar()");
		Session session = sessionFactory.getCurrentSession();
		session.update(tipoEndereco);		
	}

	
}

package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Usuario;

@Repository
public class ContratanteRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Retorna um Contratante.
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 */
	public Object find(Long id) {
		logger.debug("ContratanteRepository.find(id)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Contratante.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.setFetchMode("configuracaoEmail", FetchMode.JOIN);
		
		return criteria.uniqueResult();
	}

	/**
	 * Atualiza um Contratante
	 * 
	 * @param contratante
	 */
	public void atualizar(Contratante contratante) {
		logger.debug("ContratanteRepository.atualizar");

		Session session = sessionFactory.getCurrentSession();
		session.update(contratante);
	}

	/**
	 * Salva um contratante
	 * 
	 * @param contratante
	 */
	public void salvar(Contratante contratante) {
		logger.debug("ContratanteRepository.salvar");

		Session session = sessionFactory.getCurrentSession();
		session.save(contratante);
	}

	/**
	 * Remove um contratante
	 * 
	 * @param contratante
	 */
	public void remover(Contratante contratante) {
		logger.debug("ContratanteRepository.remover");

		Session session = sessionFactory.getCurrentSession();
		session.delete(contratante);
	}

	/**
	 * Retorna todos os Contratantes
	 * 
	 */
	@SuppressWarnings("unchecked")
	public List<Contratante> listar() {
		logger.debug("ContratanteRepository.listar");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Contratante.class, "c");
		criteria.addOrder(Order.asc("nomeFantasia"));
		List<Contratante> contratantes = criteria.list();
		for(Contratante contratante : contratantes){
			  Hibernate.initialize(contratante.getSegmento());  
			  Hibernate.initialize(contratante.getEnderecos());
		}

		return contratantes;
	}

	public Contratante obterPorUsuario(Usuario usuario) {
		
		logger.debug("ContratanteRepository.obterPorUsuario");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Contratante.class);
		criteria.createAlias("clientes", "cliente");
		criteria.createAlias("cliente.usuarios","usuario");
		criteria.add(Restrictions.eq("usuario.id", usuario.getId()));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		return (Contratante) criteria.uniqueResult();
	}

}
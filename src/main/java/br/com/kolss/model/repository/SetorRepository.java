package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Setor;

@Repository
public class SetorRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	protected SessionFactory sessionFactory;

	/**
	 * Obtém um Setor pela sua chave.
	 *
	 * @param idSetor
	 *
	 * @return
	 */
	public Setor find(Serializable idSetor) {
		logger.debug("SetorRepository.find");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Setor.class, "setor");
		criteria.createAlias("setor.usuarioResponsavel", "usuarioResponsavel");
		criteria.add(Restrictions.eq("id", idSetor));

		return (Setor) criteria.uniqueResult();
	}

	public List<Setor> obterTodos() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Setor.class);
		return criteria.list();
	}

	public List<Setor> obterPorContratante(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Setor.class, "setor");

		criteria.createAlias("setor.local", "local");
		criteria.createAlias("local.cliente", "cliente");
		criteria.add(Restrictions.eq("cliente.contratante", contratante));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}

	public List<Setor> obterPorCliente(Cliente cliente) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Setor.class, "setor");

		criteria.createAlias("setor.local", "local");
		criteria.createAlias("local.cliente", "cliente");
		criteria.add(Restrictions.eq("local.cliente", cliente));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

		return criteria.list();
	}

	public void excluir(Setor setor) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(setor);
	}

	public void salvar(Setor setor) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(setor);
	}

}

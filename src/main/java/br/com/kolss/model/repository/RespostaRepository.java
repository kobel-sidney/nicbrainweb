package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Resposta;

@Repository
public class RespostaRepository extends AbstractRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Resposta> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Resposta.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}

	public void salvar(Resposta resposta) {
		Session session = sessionFactory.getCurrentSession();
		session.save(resposta);
	}

	public void atualizar(Resposta resposta) {
		Session session = sessionFactory.getCurrentSession();
		session.update(resposta);
	}

	public void remover(Resposta resposta) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(resposta);
	}
}

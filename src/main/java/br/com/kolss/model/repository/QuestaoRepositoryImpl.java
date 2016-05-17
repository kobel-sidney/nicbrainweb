package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.TipoQuestao;

@Repository
public class QuestaoRepositoryImpl extends AbstractRepository implements QuestaoRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	@Override
	public Questao find(Long id) {

		final Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Questao.class);
		criteria.add(Restrictions.eq("id", id));
		return (Questao) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Questao> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Questao.class, "questao");
		criteria.createAlias("questao.tipoQuestao", "tipoQuestao");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("questao.descricao"));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<TipoQuestao> obterTipoQuestao(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoQuestao.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}

	public void salvar(Questao questao) {
		Session session = sessionFactory.getCurrentSession();
		session.save(questao);
	}

	public void atualizar(Questao questao) {
		Session session = sessionFactory.getCurrentSession();
		session.update(questao);
	}

	public void remover(Questao questao) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(questao);
	}

	@Override
	public String obterDescricao(Long idQuestao) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Questao.class, "questao");
		criteria.add(Restrictions.eq("id", idQuestao));
		criteria.setProjection(Projections.property("descricao"));
		
		return (String) criteria.uniqueResult();
	}
}

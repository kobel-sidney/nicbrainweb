package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoQuestao;

@Repository
public class TipoQuestaoRepository extends AbstractRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<TipoQuestao> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoQuestao.class);
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		return criteria.list();
	}

	public TipoQuestao obter(Serializable id) {
		Session session = sessionFactory.getCurrentSession();
		TipoQuestao tipoQuestao = (TipoQuestao) session.load(TipoQuestao.class,	id);

		if (tipoQuestao != null) {
			tipoQuestao.toString();
		}
		return tipoQuestao;
	}

	public void salvar(TipoQuestao tipoQuestao) {
		Session session = sessionFactory.getCurrentSession();
		session.save(tipoQuestao);
	}

	public void atualizar(TipoQuestao tipoQuestao) {
		Session session = sessionFactory.getCurrentSession();
		session.update(tipoQuestao);
	}

	public void remover(TipoQuestao tipoQuestao) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(tipoQuestao);
	}
}

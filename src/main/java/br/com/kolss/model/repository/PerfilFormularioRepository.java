package br.com.kolss.model.repository;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.PerfilFormulario;


@Repository
public class PerfilFormularioRepository extends AbstractRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	public PerfilFormulario find(Serializable id) {
		Session session = this.sessionFactory.getCurrentSession();
		PerfilFormulario perfilFormulario = (PerfilFormulario) session.load(
				PerfilFormulario.class, id);

		if (perfilFormulario != null) {
			perfilFormulario.toString();
		}
		return perfilFormulario;
	}

	public void salvar(PerfilFormulario perfilFormulario) {
		Date date = new Date();
		Session session = this.sessionFactory.getCurrentSession();
		perfilFormulario.setDataCriacao(new Timestamp(date.getTime()));
		session.save(perfilFormulario);
	}

	public void atualizar(PerfilFormulario perfilFormulario) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(perfilFormulario);
	}

	public void remover(PerfilFormulario perfilFormulario) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(perfilFormulario);
	}

	@SuppressWarnings("unchecked")
	public List<PerfilFormulario> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PerfilFormulario.class);
		criteria.add(Restrictions.eq("contratante.id",contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		return criteria.list();
	}
	
}

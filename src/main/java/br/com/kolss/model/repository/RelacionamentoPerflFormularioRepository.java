package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;

@Repository
public class RelacionamentoPerflFormularioRepository extends AbstractRepository {

	@Autowired
	SessionFactory sessionFactory;

	/**
	 * Cria uma lista de RelacionamentoPerfilFormulario, que traz os dados dos
	 * relacionamentos junto. PerfilFor
	 * 
	 * @return criteria.list();
	 */
	@SuppressWarnings("unchecked")
	public List<RelacionamentoPerfilFormulario> listarRelacionamentoPerfilFormulario() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(
				RelacionamentoPerfilFormulario.class,
				"relacionamentoPerfilFormulario");

		criteria.createAlias("relacionamentoPerfilFormulario.perfilFormulario",
				"perfilFormulario");
		criteria.createAlias("relacionamentoPerfilFormulario.grupoQuestao",
				"grupoQuestao");
		criteria.createAlias("relacionamentoPerfilFormulario.questao",
				"questao");
		criteria.createAlias("relacionamentoPerfilFormulario.resposta",
				"resposta");

		criteria.addOrder(Order.asc("relacionamentoPerfilFormulario.id"));
		return criteria.list();
	}

	public void salvar(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		Session session = sessionFactory.getCurrentSession();
		session.save(relacionamentoPerfilFormulario);
	}

	public void atualizar(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		Session session = sessionFactory.getCurrentSession();
		session.update(relacionamentoPerfilFormulario);
	}

	public void remover(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(relacionamentoPerfilFormulario);
	}
}

package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
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
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.PostoServico;
import br.com.kolss.model.entities.Usuario;

@Repository
@Transactional(readOnly = true)
public class PostoServicoRepository extends AbstractRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Obtém os Postos de Serviço.
	 * 
	 * @param filtroIdTipoServico
	 * @param filtroIdSetor
	 * @param filtroIdLocal
	 * @param usuario
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PostoServico> getPostoServicos(
			Serializable filtroIdTipoServico, Serializable filtroIdSetor,
			Serializable filtroIdLocal, Usuario usuario) {
		logger.debug("PostoServicoRepository.getPostoServicos");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PostoServico.class);
		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.eq("ativo", true));

		criteria.createAlias("setor", "st");
		criteria.createAlias("st.local", "l");
		criteria.createAlias("l.cliente", "cl");
		criteria.createAlias("cl.contratante", "cn");

		if (usuario != null) {
			DetachedCriteria dCriteria = DetachedCriteria
					.forClass(Evento.class);
			dCriteria.createAlias("usuariosNoEvento", "usr");
			dCriteria.add(Restrictions.eq("usr.id", usuario.getId()));

			dCriteria.createAlias("local", "lEvt");
			dCriteria.setProjection(Projections.property("lEvt.id"));
			criteria.add(Property.forName("l.id").in(dCriteria));
		}

		if (isValidId(filtroIdSetor)) {
			criteria.add(Restrictions.eq("st.id", filtroIdSetor));
		}
		if (isValidId(filtroIdTipoServico)) {
			criteria.add(Restrictions.eq("tipoServico.id", filtroIdTipoServico));
		}
		if (isValidId(filtroIdLocal)) {
			criteria.add(Restrictions.eq("l.id", filtroIdLocal));
		}

		// if (usuario != null) {
		// criteria.createAlias("l.eventos", "ev");
		// criteria.createAlias("ev.usuariosNoEvento", "usr");
		// criteria.add(Restrictions.eq("usr.id", usuario.getId()));
		// }

		return criteria.list();
	}
	
	public List<PostoServico> obterPostoServicos(Contratante contratante) {
		logger.debug("PostoServicoRepository.getPostoServicos");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PostoServico.class, "posto");
		criteria.createAlias("posto.setor", "setor");
		criteria.createAlias("setor.local", "local");
		criteria.createAlias("local.cliente", "cliente");
		criteria.add(Restrictions.eq("cliente.contratante", contratante));
		
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<PostoServico> obterTodos() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PostoServico.class,
				"postoServico");
		criteria.createAlias("postoServico.setor", "setor");
		criteria.createAlias("postoServico.tipoServico", "tipoServico");
		return criteria.list();
	}
	
	public PostoServico obter(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(PostoServico.class, "posto");
		
		criteria.createAlias("posto.tipoServico", "tipo");
		criteria.add(Restrictions.eq("id", id));
		
		return (PostoServico) criteria.uniqueResult();
	}

	public void remover(PostoServico postoServico) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(postoServico);
	}

	public void salvar(PostoServico postoServico) {
		Session session = sessionFactory.getCurrentSession();
		session.save(postoServico);
	}

	public void atualizar(PostoServico postoServico) {
		Session session = sessionFactory.getCurrentSession();
		session.update(postoServico);
	}
}

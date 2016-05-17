package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Menu;

@Repository
@Transactional(readOnly = true)
public class MenuRepository extends AbstractRepository {

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<Menu> getMenuSuperiores() {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Menu.class);

		criteria.addOrder(Order.asc("descricao"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.isNull("menuSuperior"));

		return criteria.list();
	}

	public Menu find(Long id) {
		logger.debug("MenuRepository.find(id)");

		Session session = sessionFactory.getCurrentSession();
		return (Menu) session.load(Menu.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenuSuperioresAssociadosAoContratante(Long idContratante) {
		logger.debug("MenuRepository.getMenuSuperioresAssociadosAoContratante");
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(Menu.class, "m");   
		criteria.createCriteria("m.contratantes","c", JoinType.INNER_JOIN);
		criteria.add(Restrictions.eq("m.ativo", true));
		criteria.add(Restrictions.isNull("m.menuSuperior"));
		criteria.add(Restrictions.eq("c.id", idContratante));
		criteria.addOrder(Order.asc("m.descricao"));

		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenuSuperioresNaoAssociadosAoContratante(Long idContratante) {

		logger.debug("MenuRepository.getMenuSuperioresNaoAssociadosAoContratante");

		DetachedCriteria dc = DetachedCriteria.forClass(Contratante.class, "c");
		dc.createAlias("c.menus", "sm");
		dc.add(Restrictions.eq("c.id", idContratante));
		dc.setProjection(Property.forName("sm.id"));

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Menu.class, "m");
		criteria.add(Restrictions.not(Property.forName("m.id").in(dc)));	
		criteria.add(Restrictions.eq("m.ativo", true));
		criteria.add(Restrictions.isNull("m.menuSuperior"));
		criteria.addOrder(Order.asc("descricao"));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Menu> obterTodos() {

		List<Menu> list;
		logger.debug("MenuRepository.obterTodos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Menu.class);   
		list = criteria.list();
		
		return list;
	}

	public void salvar(Menu model) {
		
		logger.debug("MenuRepository.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	public void atualizar(Menu model) {
		
		logger.debug("MenuRepository.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
		
	}

	public void remover(Menu model) {
		logger.debug("MenuRepository.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}
package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.ModeloEquipamento;


@Repository("ModeloEquipamentoRepository")
public class ModeloEquipamentoRepositoryImpl implements	ModeloEquipamentoRepository {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void atualizar(ModeloEquipamento modeloEquipamento) {
		Session session = sessionFactory.getCurrentSession();
		session.update(modeloEquipamento);
	}

	@Override
	public void salvar(ModeloEquipamento modeloEquipamento) {
		Session session = sessionFactory.getCurrentSession();
		session.save(modeloEquipamento);
	}

	@Override
	public void remover(ModeloEquipamento modeloEquipamento) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(modeloEquipamento);
	}

	@Override
	public ModeloEquipamento obter(Serializable id) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ModeloEquipamento.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.addOrder(Order.asc("nome"));
		
		return (ModeloEquipamento) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ModeloEquipamento> obterTodos(Contratante contratante) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ModeloEquipamento.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

}

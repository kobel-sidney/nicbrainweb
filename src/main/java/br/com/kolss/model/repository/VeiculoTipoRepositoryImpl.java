package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.TipoVeiculo;

@Repository
public class VeiculoTipoRepositoryImpl implements VeiculoTipoRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<TipoVeiculo> buscarTodos() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoVeiculo.class);
		return (List<TipoVeiculo>) criteria.list();
	}

	@Override
	public TipoVeiculo BuscarPorId(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoVeiculo.class);
		criteria.add(Restrictions.eq("id", id));
		TipoVeiculo veiculoTipo = (TipoVeiculo)criteria.uniqueResult();
		return veiculoTipo;
	}

}

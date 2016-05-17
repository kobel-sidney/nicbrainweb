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
import br.com.kolss.model.entities.Veiculo;


@Repository
public class VeiculoRepositoryImpl implements VeiculoRepository {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void inserir(Veiculo veiculo) {
		logger.debug("VeiculoRepositoryImpl.inserir()");
		Session session = sessionFactory.getCurrentSession();
		session.save(veiculo);
	}

	@Override
	public void atualizar(Veiculo veiculo) {
		logger.debug("VeiculoRepositoryImpl.atualizar()");
		Session session = sessionFactory.getCurrentSession();
		session.update(veiculo);
	}

	@Override
	public void deletar(Veiculo veiculo) {
		logger.debug("VeiculoRepositoryImpl.deletar()");
		Session session = sessionFactory.getCurrentSession();
		session.delete(veiculo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Veiculo> obterTodos(Contratante contratante) {
		logger.debug("VeiculoRepositoryImpl.obterTodos(contratante)");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Veiculo.class);
		criteria.createAlias("veiculoTipo", "veiculoTipo");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return (List<Veiculo>) criteria.list();
	}

	@Override
	public List<Veiculo> obterPorCliente(Cliente cliente) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Veiculo.class);
		criteria.createAlias("veiculoTipo", "veiculoTipo");
		criteria.add(Restrictions.eq("contratante", cliente.getContratante()));
		return (List<Veiculo>) criteria.list();
	}

	@Override
	public Veiculo obter(Serializable id,Contratante contratante) {
		logger.debug("VeiculoRepositoryImpl.obter(id,contratante)");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Veiculo.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return(Veiculo)criteria.uniqueResult();
	}

	@Override
	public Veiculo obter(Long id) {
		logger.debug("VeiculoRepositoryImpl.obter(id)");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Veiculo.class);
		criteria.add(Restrictions.eq("id", id));
		return(Veiculo)criteria.uniqueResult();
	}

}

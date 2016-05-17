package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TrocaVeiculo;
import br.com.kolss.model.entities.Veiculo;

@Repository
public class TrocaVeiculoRepositoryImpl implements TrocaVeiculoRepository {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void inserir(TrocaVeiculo trocaVeiculo) {
		logger.debug("TrocaVeiculoRepositoryImpl.inserir()");
		Session session = sessionFactory.getCurrentSession();
		session.save(trocaVeiculo);
	}

	@Override
	public void atualizar(TrocaVeiculo trocaVeiculo) {
		logger.debug("TrocaVeiculoRepositoryImpl.atualizar()");
		Session session = sessionFactory.getCurrentSession();
		session.update(trocaVeiculo);
	}

	@Override
	public void deletar(TrocaVeiculo trocaVeiculo) {
		logger.debug("TrocaVeiculoRepositoryImpl.deletar()");
		Session session = sessionFactory.getCurrentSession();
		session.delete(trocaVeiculo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TrocaVeiculo> obterTodos(Contratante contratante) {
		logger.debug("TrocaVeiculoRepositoryImpl.obterTodos()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrocaVeiculo.class);
		criteria.createAlias("veiculo", "veiculo");
		criteria.createAlias("veiculo.contratante", "contratante");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return (List<TrocaVeiculo>) criteria.list();
	}

	@Override
	public TrocaVeiculo obter(Serializable id,Contratante contratante) {
		logger.debug("TrocaVeiculoRepositoryImpl.obter()");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TrocaVeiculo.class);
		criteria.createAlias("veiculo", "veiculo");
		criteria.createAlias("veiculo.contratante", "contratante");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		criteria.add(Restrictions.eq("id", id));
		return (TrocaVeiculo)criteria.uniqueResult();
	}

    @Override
    public TrocaVeiculo buscarComStatusSaida(Veiculo veiculo) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(TrocaVeiculo.class);
        criteria.add(Restrictions.eq("tipoTroca", "S"));
        criteria.add(Restrictions.eq("veiculo", veiculo));
        criteria.createAlias("pessoas", "pessoas");
        
        return (TrocaVeiculo) criteria.uniqueResult();
    }

}

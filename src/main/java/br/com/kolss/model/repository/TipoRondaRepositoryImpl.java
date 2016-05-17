package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.TipoRonda;

@Repository
public class TipoRondaRepositoryImpl implements TipoRondaRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void salvar(TipoRonda tipoRonda) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(tipoRonda);
	}
	
	@Override
	public void excluir(TipoRonda tipoRonda) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(tipoRonda);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TipoRonda> obterRondas() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoRonda.class);

		return criteria.list();
	}

}

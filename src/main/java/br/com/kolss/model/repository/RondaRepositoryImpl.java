package br.com.kolss.model.repository;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.entities.Veiculo;

@Repository
@Transactional
public class RondaRepositoryImpl implements RondaRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void salvar(Ronda ronda) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(ronda);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Ronda> obterRondasFinalizadas(Cliente cliente) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class, "r");
        criteria.createAlias("r.tripulantes", "t", JoinType.NONE);
        criteria.add(Restrictions.eq("cliente", cliente));
        criteria.add(Restrictions.isNull("fim"));

        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

        return criteria.list();
    }

    @Override
    public Ronda obterRonda(Long idRonda) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class, "r");
        criteria.createAlias("r.tripulantes", "t", JoinType.NONE);
        criteria.add(Restrictions.eq("id", idRonda));

        return (Ronda) criteria.uniqueResult();
    }

    @Override
    public Ronda obterRondaEmAndamento(Long idRonda) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class, "r");
        criteria.createAlias("r.tripulantes", "t", JoinType.NONE);
        criteria.add(Restrictions.eq("id", idRonda));
        criteria.add(Restrictions.isNull("fim"));

        return (Ronda) criteria.uniqueResult();
    }
    
    @Override
    public Ronda obterEmAndamentoPorUsuario(Usuario usuario) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class);
        criteria.add(Restrictions.eq("responsavelRonda.id", usuario.getId()));
        criteria.add(Restrictions.isNull("fim"));

        return (Ronda) criteria.uniqueResult();
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Ronda> obterEmAndamentoPorContexto(Usuario usuario) {
    	
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class);
        criteria.createAlias("local.eventos", "evento");
        criteria.createAlias("evento.usuariosNoEvento", "usuarioNoEvento");
        criteria.add(Restrictions.isNull("fim"));
        criteria.add(Restrictions.eq("evento.ronda", true));
        criteria.add(Restrictions.eq("usuarioNoEvento.id", usuario.getId()));
        
        return criteria.list();
    }
    
    @Override
    public Ronda obterEmAndamentoPorVeiculo(Veiculo veiculo) {
    	Session session = sessionFactory.getCurrentSession();
    	Criteria criteria = session.createCriteria(Ronda.class);
    	criteria.add(Restrictions.isNull("fim"));
    	criteria.add(Restrictions.eq("veiculo", veiculo));
    	
    	return (Ronda) criteria.uniqueResult();
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<Ronda> obterFinalizadasRecentes(Usuario usuario, Date inicio, Date fim) {
		Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(Ronda.class);
        criteria.createAlias("local.eventos", "evento");
        criteria.createAlias("evento.usuariosNoEvento", "usuarioNoEvento");

        criteria.add(Restrictions.isNotNull("fim"));
        criteria.add(Restrictions.between("fim", inicio, fim));
        criteria.add(Restrictions.eq("evento.ronda", true));
		criteria.add(Restrictions.eq("usuarioNoEvento.id", usuario.getId()));
        
        return criteria.list();
	}
}

package br.com.kolss.model.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Usuario;


@Repository
public class UsuarioDaoImpl implements UsuarioDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
    public Usuario obterUsuarioPorEmail(final String email){
    	
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("email",email));
		
		return (Usuario) criteria.uniqueResult();
    }	
	
    @Override
    public Usuario obterUsuarioPorNome(final String nome){
    	
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("nome",nome));
		
		return (Usuario) criteria.uniqueResult();
    }	
    
}

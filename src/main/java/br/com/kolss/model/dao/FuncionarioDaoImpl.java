package br.com.kolss.model.dao;

import java.util.Collections;
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

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.util.FacesContextUtil;
import br.com.kolss.util.HibernateUtil;

@Repository
@Transactional(readOnly=false)
public class FuncionarioDaoImpl implements FuncionarioDao {

	private final Logger logger = Logger.getLogger(getClass());
	@Autowired
	
	private SessionFactory sessionFactory;
	
	@Override
	public List<Funcionario> listarFuncionarioSubordinados(Integer idFuncionarioSuperior)
			throws DaoException {
		try {
			Session session = HibernateUtil.getCurrentSession();

			Criteria criteria = session.createCriteria(Funcionario.class);
			criteria.add(Restrictions.eq("ativo", true));
			criteria.createAlias("funcionarioSuperior", "fSuperior");
			criteria.add(Restrictions.eq("fSuperior.id.idPessoa", idFuncionarioSuperior));

			return criteria.list();

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Checklist");
		}
	}

	@Override
	public List<Funcionario> listarFuncionariosPorContratante(Long idContratante) throws DaoException {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			Criteria criteria = session.createCriteria(Funcionario.class, "f");
			criteria.createAlias("f.usuario", "u");
			criteria.createAlias("u.cliente", "c");
			criteria.createAlias("c.contratante", "co");
			criteria.add(Restrictions.eq("co.id",
					idContratante));
		
		return criteria.list();

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Funcionarios");
		}
	}
	
}

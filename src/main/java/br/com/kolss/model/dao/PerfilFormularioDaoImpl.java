package br.com.kolss.model.dao;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.kolss.model.entities.PerfilFormulario;

@Repository("perfilFormularioDao")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class PerfilFormularioDaoImpl implements PerfilFormularioDao {

	private static final Logger LOGGER = Logger
			.getLogger(PerfilFormulario.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PerfilFormulario findById(Long id) {

		PerfilFormulario perfilFormulario = null;

		try {
			Assert.notNull(id, "INFORME UM ID DE PERFIL DE FORMULARIO");

			Criteria criteria = this.sessionFactory.getCurrentSession()
					.createCriteria(PerfilFormulario.class);
			criteria.add(Restrictions.eq("id", id));

			perfilFormulario = (PerfilFormulario) criteria.uniqueResult();

		} catch (Exception ex) {
			LOGGER.error("ERRO AO CONSULTAR PERFIL FORMULARIO", ex);
		}

		return perfilFormulario;
	}
}

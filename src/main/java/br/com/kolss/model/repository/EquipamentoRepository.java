package br.com.kolss.model.repository;

import java.io.Serializable;
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

import br.com.kolss.model.entities.Equipamento;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.entities.Usuario;


@Repository
@Transactional(readOnly = true)
public class EquipamentoRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	public List<Equipamento> getEquipamentos(Serializable idTipoEquipamento,
			Setor setor, Usuario usuario) {
		logger.debug("EquipamentoRepository.getEquipamentos");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Equipamento.class);
		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.eq("ativo", true));
		
		criteria.createAlias("modeloEquipamento", "me");
		criteria.createAlias("me.tipoEquipamento", "te");
		criteria.add(Restrictions.eq("te.id", idTipoEquipamento));
		criteria.createAlias("setor", "st");
		
		if (setor != null) {
			criteria.add(Restrictions.eq("st.id", setor.getId()));
		}
		
		if (usuario != null) {
			criteria.createAlias("st.local", "l");
			
			DetachedCriteria dCriteria = DetachedCriteria.forClass(Evento.class);
			dCriteria.createAlias("usuariosNoEvento", "usr");
			dCriteria.add(Restrictions.eq("usr.id", usuario.getId()));
			
			dCriteria.createAlias("local", "lEvt");
			dCriteria.setProjection(Projections.property("lEvt.id"));
			criteria.add(Property.forName("l.id").in(dCriteria));
		}
		
		return criteria.list();
	}
	
}

package br.com.kolss.bbeans;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Grupo;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbGrupo")
@Scope("request")
public class BbGrupo {
	
	@SuppressWarnings("unchecked")
	public List<Grupo> getGrupos() {
//        InterfaceDAO<Grupo> grupoDAO = new HibernateDAO<Grupo>(Grupo.class, FacesContextUtil.getRequestSession());
//        return grupoDAO.getEntities();
    	
    	Session session = FacesContextUtil.getRequestSession();
    	Criteria criteria = session.createCriteria(Grupo.class);
    	criteria.addOrder(Order.asc("nomeGrupo"));
    	
    	return criteria.list();
    }
    
}
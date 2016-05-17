package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Topico;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbTopico")
@Scope("request")
public class BbTopico {
	
	public List<Topico> getTopicos() {
		InterfaceDAO<Topico> topicoDAO = new HibernateDAO<Topico>(Topico.class,
				FacesContextUtil.getRequestSession());
		return topicoDAO.getEntities();
	}
}
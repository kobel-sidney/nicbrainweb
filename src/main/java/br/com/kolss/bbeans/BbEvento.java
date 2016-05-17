package br.com.kolss.bbeans;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.formula.functions.Even;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.service.EventoService;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbEvento")
@Scope("request")
public class BbEvento {
	
	@Autowired
	private EventoService eventoService;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	
	public List<Evento> getEventos() {
		InterfaceDAO<Evento> dao = new HibernateDAO<Evento>(Evento.class,
				FacesContextUtil.getRequestSession());
		return dao.getEntities();
	} 
	
	@SuppressWarnings("unchecked")
	public List<Evento> getEventosPorLocal(Long idLocal) {

		InterfaceDAO<Evento> dao = new HibernateDAO<Evento>(Evento.class,
				FacesContextUtil.getRequestSession());
		
		Criteria criteria = dao.getCriteria();
		criteria.addOrder(Order.asc("nomeEvento"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("id.idLocal", idLocal));
		
		return criteria.list();
	}
	
	public List<Evento> getEventosPorContratante() {
		return eventoService.eventosPorContratante(bbUsuarioLogado.obterContratanteUsuarioLogado());
	}

	public List<Evento> getEventosPorContexto() {
		
		List<Evento> listaDeEventosPorContexto = new ArrayList<Evento>();
		listaDeEventosPorContexto.addAll(bbUsuarioLogado.getUserSession().getEventosUsuario());
		return listaDeEventosPorContexto;
		
	}
	
}

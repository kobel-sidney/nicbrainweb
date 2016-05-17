package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.TipoEquipamento;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbTipoEquipamento")
@Scope("request")
public class BbTipoEquipamento {
	
	public List<TipoEquipamento> getTipoEquipamentos() {
		InterfaceDAO<TipoEquipamento> tipoEquipamentoDAO = new HibernateDAO<TipoEquipamento>(
				TipoEquipamento.class, FacesContextUtil.getRequestSession());
		return tipoEquipamentoDAO.getEntities();
	}

}

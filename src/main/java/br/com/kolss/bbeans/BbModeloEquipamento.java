package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.ModeloEquipamento;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbModeloEquipamento")
@Scope("request")
public class BbModeloEquipamento {

	public List<ModeloEquipamento> getModeloEquipamentos() {
		InterfaceDAO<ModeloEquipamento> modeloEquipamentoDAO = new HibernateDAO<ModeloEquipamento>(
				ModeloEquipamento.class, FacesContextUtil.getRequestSession());
		return modeloEquipamentoDAO.getEntities();
	}

}
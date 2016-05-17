package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Fornecedor;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbFornecedor")
@Scope("request")
public class BbFornecedor {
	
	public List<Fornecedor> getFornecedores() {
		InterfaceDAO<Fornecedor> fornecedorDAO = new HibernateDAO<Fornecedor>(
				Fornecedor.class, FacesContextUtil.getRequestSession());
		return fornecedorDAO.getEntities();
	}

}

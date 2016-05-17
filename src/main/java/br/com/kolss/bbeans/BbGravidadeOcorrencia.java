package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.GravidadeOcorrencia;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbGravidadeOcorrencia")
@Scope("request")
public class BbGravidadeOcorrencia {
	
	public List<GravidadeOcorrencia> getGravidadeOcorrencias() {
		InterfaceDAO<GravidadeOcorrencia> dao = 
				new HibernateDAO<GravidadeOcorrencia>(
						GravidadeOcorrencia.class,
						FacesContextUtil.getRequestSession());
		
		return dao.getListByHQLQuery(
				"SELECT go FROM GravidadeOcorrencia go ORDER BY go.idGravidadeOcorrencia");
	}
	
}

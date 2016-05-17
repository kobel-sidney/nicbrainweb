package br.com.kolss.bbeans;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.util.FacesContextUtil;


@Controller(value = "bbChecklist")
@Scope("request")
public class BbChecklist {
    
    public List<Checklist> getChecklists() {
        InterfaceDAO<Checklist> dao = new HibernateDAO<Checklist>(
        		Checklist.class, FacesContextUtil.getRequestSession());
        return dao.getEntities();
    }
    
}
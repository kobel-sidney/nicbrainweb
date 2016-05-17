package br.com.kolss.bbeans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Menu;
import br.com.kolss.model.entities.Regra;
import br.com.kolss.model.entities.Usuario;
  

@Controller(value = "bbSubMenu")
@Scope("request")
public class BbSubMenu {  
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	private MenuModel model;
	
	private Long idMenuSuperior;	
	  
    public BbSubMenu() {	
            
    }  
    
    
    public MenuModel getModel(long idMenuSuperior) {
    	
    	setIdMenuSuperior (idMenuSuperior);
    	model = new DefaultMenuModel();   	
    	
    	List <Menu> listaDeMenus = getMenuItem();
    	
    	for(Menu m : listaDeMenus) {    		 
    		
    		String key = BbLocale.getI18nMessage(m.getNome());
    		
    		List<Menu> subItens = getMenuSubItems(m);
    		    		
    		if (subItens.isEmpty()) {
    			//cria o menu sem subItens
    			DefaultMenuItem item = new DefaultMenuItem();
    			   			
    			item.setValue(key==null ? "Sem Definição": key);
    	        item.setUrl(m.getUrlMenu());
    	        if (m.getUrlMenu().equals("/rest/ronda/online") || m.getUrlMenu().equals("/rest/ronda/detalhe") || m.getUrlMenu().equals("/rest/ocorrencias/form")) {
    	        	item.setTarget("_blank");
    	        }
    	        item.setAjax(true);    	        
    	        model.addElement(item);    	        
    		} else {
    			//cria o menu com subitens    			
    			DefaultSubMenu subMenu = new DefaultSubMenu(key==null ? "Sem Definição": key);
    			
    			// adiciona os subitens no submenu
    			for (Menu sm : subItens)  {    				
    				String subKey = BbLocale.getI18nMessage(sm.getNome());
    				
        			DefaultMenuItem item = new DefaultMenuItem();	
        	        item.setValue(subKey==null ? "Sem Definição": subKey);
        	        item.setUrl(sm.getUrlMenu());
        	        item.setAjax(true);
        	        subMenu.addElement(item);    				 
    			}
    			//adiciona o submenu no menu
    			model.addElement(subMenu);    			
    		}
	        
        }
    	
    	return getModel();    	
    }
  
    public MenuModel getModel() {  
        return model;   
    }     

       
    
	public List<Menu> getMenuItem() {
			
		Usuario user = bbUsuarioLogado.getUserSession();		
		
		List<Menu> listaDeMenus = new ArrayList<Menu>();
						
		Set<Menu> menusDasRegras = new HashSet<Menu>();
		Set<Menu> menus = new HashSet<Menu>();
		
		for (Regra regra : user.getRegras()) {
			
			menusDasRegras.addAll(regra.getMenus());
			
			for (Menu menu : menusDasRegras) {
				
				if (menu.getMenuSuperior() != null) {
					
					if (menu.getMenuSuperior().getId() == ((Long)getIdMenuSuperior())) {
						
						if (menu.isAtivo()) {
							menus.add(menu);
						}
						
					}
					
				}
				
			}
			
		}
		
		listaDeMenus.addAll(menus);
		
		Collections.sort(listaDeMenus);
		
		return listaDeMenus;

	}
	
	public List<Menu> getMenuSubItems(Menu menu) {
			
		Usuario user = bbUsuarioLogado.getUserSession();	
		
		List<Menu> listaDeMenus = new ArrayList<Menu>();
		
		Set<Menu> menusDasRegras = new HashSet<Menu>();
		Set<Menu> menus = new HashSet<Menu>();
		
		for (Regra regra : user.getRegras()) {
			
			menusDasRegras.addAll(regra.getMenus());
			
			for (Menu menuBuffer : menusDasRegras) {
				
				if (menuBuffer.getMenuSuperior() != null) {
					
					if (menuBuffer.getMenuSuperior().getId() == menu.getId()) {
						
						if (menuBuffer.isAtivo()) {
							menus.add(menuBuffer);
						}
						
					}
					
				}
				
			}
			
		}
		
		listaDeMenus.addAll(menus);
		
		Collections.sort(listaDeMenus);
		
		return listaDeMenus;
	}
	
	

	public Long getIdMenuSuperior() {
		return idMenuSuperior;
	}

	public void setIdMenuSuperior(Long idMenuSuperior) {
		this.idMenuSuperior = idMenuSuperior;
	}
	
	
	
     
}  
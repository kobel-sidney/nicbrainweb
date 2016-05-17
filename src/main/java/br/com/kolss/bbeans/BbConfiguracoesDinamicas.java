package br.com.kolss.bbeans;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Menu;
import br.com.kolss.model.entities.Regra;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.UsuarioRepository;
 
@Controller(value = "bbConfigDinamica")
@Scope("request")
public class BbConfiguracoesDinamicas {

	private String urlLogotipo   = "../images/cabecalho/logotipo.png";  //imagem default, caso não venha nada da base de dados
	private String urlBackground = "../images/background/logotipo.png"; //imagem default, caso não venha nada da base de dados
		
	@SuppressWarnings("unused")
	private List<Menu> menu;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	

	public BbConfiguracoesDinamicas() {
		
	}
	
	public void setImagensPorSegmento() {
		
		Usuario user = bbUsuarioLogado.getUserSession();
		/* FIX ME: Comentado para que o Login Funcionasse
		List<Integer> lstContratante = user.getIdContratantesPorContexto();
		
		// FIXME: Trocar depois para o DAO correto.
		// Usar a injeção!
		InterfaceDAO<Contratante> dao = new HibernateDAO<Contratante>(
				Contratante.class, FacesContextUtil.getRequestSession());
        
        Criteria criteria = dao.getCriteria(); 
        criteria.add(Restrictions.eq("idContratante", lstContratante.get(0)));
        
		// Obter apenas o Segmento do Contratante:
    	ProjectionList projection = Projections.projectionList();
    	projection.add(Projections.property("segmento"));
    	criteria.setProjection(Projections.distinct(projection));
        
        Segmento seg = (Segmento) criteria.uniqueResult();
             
        String _urlLogotipo   = seg.getUrlLogotipo();
        String _urlBackground = seg.getUrlBackground();        
        
        if (_urlLogotipo != null ) {
        	urlLogotipo = _urlLogotipo;
        }
        
        if (_urlBackground != null ) {
        	urlBackground = _urlBackground;
        }
        */
        
	}
	
	
	public String getUrlBackground() {				
		return this.urlBackground;
	}

	public String getUrlLogotipo() {
		return this.urlLogotipo;
	}	
	
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenu() {
		
		Usuario user = bbUsuarioLogado.getUserSession();
		
		List<Menu> listaDeMenus = new ArrayList<Menu>();
				
		List<Long> lstContratante = new ArrayList<Long>();
		lstContratante.add(user.getCliente().getContratante().getId());
		
		Set<Menu> menusDasRegras = new HashSet<Menu>();
		Set<Menu> menus = new HashSet<Menu>();
		
		for (Regra regra : user.getRegras()) {
			
			menusDasRegras.addAll(regra.getMenus());
			for (Menu menu : menusDasRegras) {
				
				if (menu.getMenuSuperior() == null) {
					if (menu.isAtivo()) {
						menus.add(menu);
					}
				}
			}
			
		}
		
		listaDeMenus.addAll(menus);
		
		Collections.sort(listaDeMenus);
		
		return listaDeMenus;
					
	}
	
	
	//Verifica se o modulo liberado para o cliente
	//tem itens de menu disponiveis para esse perfil de usuário	
	public List<Menu> getModulosComItems() {	
		
		
		Usuario user = bbUsuarioLogado.getUserSession();
		
		List<Menu> lstModulosMenu = getMenu();
		List<Menu> lstModulosLiberados =  new ArrayList<Menu>();
		
		for (Menu m : lstModulosMenu) {
			
			lstModulosLiberados.add(m);			
			
		}
		
		return lstModulosLiberados;	
		
		
	}
	

	public void setMenu(List<Menu> menu) {
		this.menu = menu;
	}
	

	
	public void afterPhase(PhaseEvent event) {
		
		if (event.getPhaseId().equals(PhaseId.RENDER_RESPONSE)){
			setImagensPorSegmento();
		}
	}
	
	
	
}

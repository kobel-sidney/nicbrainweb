	//FIXME: TABELA NÃO FUNCIONA MAIS COMO LISTAGEM

//package br.com.kolss.controller;
//
//import java.io.IOException;
//import java.io.Serializable;
//import java.util.List;
//
//import javax.faces.application.FacesMessage;
//import javax.faces.application.NavigationHandler;
//import javax.faces.bean.ManagedBean;
//import javax.faces.bean.SessionScoped;
//import javax.faces.context.FacesContext;
//import javax.faces.event.ActionEvent;
//
//import org.apache.log4j.Logger;
//import org.primefaces.event.SelectEvent;
//import org.primefaces.event.UnselectEvent;
//
//import br.com.kolss.bbeans.BbLocale;
//
//import br.com.kolss.datamodel.ModuloDataModel;
//
//import br.com.kolss.model.dao.HibernateDAO;
//import br.com.kolss.model.dao.InterfaceDAO;
//
//import br.com.kolss.model.entities.Modulo;
//
//import br.com.kolss.util.FacesContextUtil;
//
//@ManagedBean(name = "ModuloBean")
//@SessionScoped
//public class ModuloController implements Serializable {
//
//	private static final long serialVersionUID = 8460191268876448685L;
//
//	private Logger logger = Logger.getLogger(this.getClass());
//	private Modulo modulo = new Modulo();
//	private List<Modulo> modulos;
//
//	private ModuloDataModel listaModulos;
//
//	/** Metodo construtor padrao. */
//	public ModuloController() {
//	}
//
//	private InterfaceDAO<Modulo> getModuloDAO() {
//		logger.info("Obter DAO");
//		InterfaceDAO<Modulo> dao = new HibernateDAO<Modulo>(Modulo.class,
//				FacesContextUtil.getRequestSession());
//		return dao;
//	}
//
//	public String novoModulo() {
//		logger.info("Criando novo Modulo");
//		limparModulo();
//		avancaPagina();
//		return null;
//	}
//
//	public String limparModulo() {
//		logger.info("Limpar dados do Modulo");
//		modulo = new Modulo();
//		return null;
//	}
//
//	public String cancelModulo() {
//		logger.info("Cancela a operacao de adicao/edicao");
//		modulo = new Modulo();
//		try {
//			FacesContext.getCurrentInstance().getExternalContext()
//					.redirect("ListaModulo.nicbrain");
//		} catch (IOException e) {
//
//			e.printStackTrace();
//		}
//		return null;
//	}
//
//	public String addModulo(ActionEvent evento) {
//		logger.info("Salvar/Atualizar Modulo [ActionEvent]: " + evento);
//		return addModulo();
//	}
//
//	public String addModulo() {
//		logger.info("Salvar/Atualizar Modulo: " + this.modulo);
//		
//		//FIXME: REQUER ANALISA DA NOVA TELA;
////		if (modulo.getIdModulo() == null || modulo.getIdModulo() == 0) {
////			insertModulo();
////		} else {
////			updateModulo();
////		}
//
//		limparModulo();
//		return "/restrict/ListaModulo.nicbrain";
//	}
//
//	private void insertModulo() {
//		logger.info("Salvar Modulo: " + this.modulo);
//		getModuloDAO().save(modulo);
//
//		FacesContext.getCurrentInstance().addMessage(
//				null,
//				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
//						.getI18nMessage(BbLocale.SAVE_SUCCESSFULLY), ""));
//	}
//
//	private void updateModulo() {
//		logger.info("Atualizar Modulo: " + this.modulo);
//		getModuloDAO().update(modulo);
//
//		FacesContext.getCurrentInstance().addMessage(
//				null,
//				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
//						.getI18nMessage(BbLocale.UPDATE_SUCCESSFULLY), ""));
//	}
//
//	public void deleteModulo() {
//		logger.info("Excluir Modulo: " + this.modulo);
//		getModuloDAO().remove(modulo);
//
//		FacesContext.getCurrentInstance().addMessage(
//				null,
//				new FacesMessage(FacesMessage.SEVERITY_INFO, BbLocale
//						.getI18nMessage(BbLocale.DELETE_SUCCESSFULLY), ""));
//	}
//
//	public Modulo getModulo() {
//		logger.info("Obter Modulo: " + this.modulo);
//		return modulo;
//	}
//
//	public void setModulo(Modulo modulo) {
//		logger.info("Selecionar Modulo: " + modulo);
//		this.modulo = modulo;
//	}
//
//	public List<Modulo> getModulos() {
//		logger.info("Obter o(s) Modulo(s)");
//		modulos = getModuloDAO().getEntities();
//		return modulos;
//	}
//
//	public void setModulos(List<Modulo> modulos) {
//		logger.info("Selecionar Modulo(s): " + modulos);
//		this.modulos = modulos;
//	}
//
//	public ModuloDataModel getListaModulos() {
//		listaModulos = new ModuloDataModel(getModuloDAO().getEntities());
//		return listaModulos;
//	}
//
//	public void avancaPagina() {
//		logger.info("Avancando para a pagina de edicao/adicao");
//		FacesContext fc = FacesContext.getCurrentInstance();
//		NavigationHandler nh = fc.getApplication().getNavigationHandler();
//		nh.handleNavigation(fc, null, "/restrict/Modulo.nicbrain");
//
//	}
//
//	public void onRowSelect(SelectEvent event) {
//		logger.info("Seta o objeto selecionado na lista");
//		setModulo((Modulo) event.getObject());
//		avancaPagina();
//
//	}
//
//	public void onRowUnselect(UnselectEvent event) {
//		logger.info("Seta o objeto selecionado na lista");
//		setModulo((Modulo) event.getObject());
//		avancaPagina();
//	}
//
//}
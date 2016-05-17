package br.com.kolss.controller;

import java.io.Serializable;
import java.util.List;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.apache.log4j.Logger;
import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.Marker;
import org.primefaces.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbLocale;
import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Equipamento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.PostoServico;
import br.com.kolss.model.entities.TipoServico;
import br.com.kolss.service.EquipamentoService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.PessoaService;
import br.com.kolss.service.PostoServicoService;
import br.com.kolss.util.DataUtil;


@Controller(value = "mapaLocalDetalheBean")
@Scope("session")
public class MapaLocalDetalheController {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected OcorrenciaService ocorrenciaService;
	
	@Autowired
	protected PessoaService pessoaService;
	
	@Autowired
	protected PostoServicoService postoServicoService;
	
	@Autowired
	protected EquipamentoService equipamentoService;
	
	@Autowired
	private BbUsuarioLogado bbUsuarioLogado;
	
	private Local local;
	
	
	/**
	 * Recebe o local que deverá ser exibido via Google Maps
	 * 
	 * @param event
	 */
	public void onMarkerSelect(OverlaySelectEvent event) {
		logger.info("MapaLocalDetalheController.onMarkerSelect");

		Marker marker = (Marker) event.getOverlay();
		local = (Local) marker.getData();

		logger.info("Avancando para o proximo mapa do local selecionado'");
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null,
				"/restrict/MapaLocalDetalhePorOcorrencia.nicbrain?faces-redirect=true");
	}
	
	/**
	 * Retorna os dados para se exibir as Ocorrências no mapa.
	 * 
	 * @return
	 */
	public String getOcorrencias() {
		logger.info("MapaLocalDetalheController.getOcorrencias");
		
		Serializable idLocal = null;
		Serializable idCliente = null;
		Serializable idContratante = null;
		if (this.local != null && this.local.getId() != null) {
			idLocal = this.local.getId();
			idCliente = this.local.getCliente().getId();
			idContratante = this.local.getCliente().getContratante().getId();
		}
		
		List<Ocorrencia> lst = 
//				ocorrenciaService.getOcorrenciasEmAbertoPorContexto(idLocal, idCliente, idContratante, BbUsuarioLogado.getUserSession().getId());
				ocorrenciaService.getOcorrenciasEmAndamentoPorLocalPorContexto(
						idLocal,
						idCliente,
						idContratante,
						bbUsuarioLogado.getUserSession().getId());

		
		// TODO: Melhorar a forma de enviar estas informações:
		StringBuilder ocorrencias = new StringBuilder();
		for (Ocorrencia oc : lst) {
			
			// apenas na primeira iteracao não deve incluir:
			if (ocorrencias.length() > 0) {
				ocorrencias.append(",");
			}
			
			ocorrencias.append(
					oc.getClassificacaoOcorrencia().getNome());
			ocorrencias.append(",");
			ocorrencias.append(oc.getLatitude());
			ocorrencias.append(",");
			ocorrencias.append(oc.getLongitude());
			ocorrencias.append(",");
			ocorrencias.append(
					oc.getClassificacaoOcorrencia().getNome());
			ocorrencias.append(",");
			ocorrencias.append(DataUtil.formataData(oc.getDataInicio()));
			
			Pessoa pessoa = pessoaService.obter(
					oc.getUsuarioResponsavel().getPessoa().getId());
			ocorrencias.append(",");
			ocorrencias.append(pessoa.getNome());
			
			String imgBase64 = Base64.encodeToString(oc.getFoto(), true);
			ocorrencias.append(",");
			ocorrencias.append(imgBase64);
		}
		
		return ocorrencias.toString();
	}
	
	/**
	 * Retorna os dados para se exibir as Ambulâncias no mapa.
	 * 
	 * @return
	 */
	public String getAmbulancias() {
		logger.info("MapaLocalDetalheController.getAmbulancias");
		
		return this.getCoordenadasDePostosServicos(TipoServico.ID_TIPO_AMBULANCIA);
	}
	
	/**
	 * Retorna os dados para se exibir os Bombeiros no mapa.
	 * 
	 * @return
	 */
	public String getBombeiros() {
		logger.info("MapaLocalDetalheController.getBombeiros");
		
		return this.getCoordenadasDePostosServicos(TipoServico.ID_TIPO_BOMBEIRO);
	}
	
	/**
	 * Retorna os dados para se exibir os postos policiais no mapa.
	 * 
	 * @return
	 */
	public String getPolicias() {
		logger.info("MapaLocalDetalheController.getPolicias");
		
		return this.getCoordenadasDePostosServicos(TipoServico.ID_TIPO_POLICIA);
	}
	
	/**
	 * Retorna os dados para se exibir as cameras L0 no mapa.
	 * 
	 * @return
	 */
	public String getCamerasL0() {
		logger.info("MapaLocalDetalheController.getCamerasL0");
		
		return this.getCoordenadasDeCameras(4L);
	}
	
	/**
	 * Retorna os dados para se exibir as cameras L1 no mapa.
	 * 
	 * @return
	 */
	public String getCamerasL1() {
		logger.info("MapaLocalDetalheController.getCamerasL1");
		
		return this.getCoordenadasDeCameras(8L);
	}
	
	
	/**
	 * Retorna as coordenadas de um tipo de Equipamento
	 * 
	 * @tipoEquipamento
	 * 
	 * @return
	 */
	private String getCoordenadasDePostosServicos(Integer idTipoPostoServico) {
		logger.info("MapaLocalDetalheController.getCoordenadasDePostosServicos");
		
		Long _idTipoPostoServico = (idTipoPostoServico != null && Integer.valueOf(idTipoPostoServico) > 0)
				? Long.valueOf(idTipoPostoServico.toString())
				: Long.valueOf(0);
		
		Serializable idLocal = null;
		if (this.local != null && this.local.getId() != null) {
			idLocal = this.local.getId();
		}
		
		List<PostoServico> lst = postoServicoService.getPostoServicos(
				_idTipoPostoServico,
				null,
				idLocal,
				bbUsuarioLogado.getUserSession().getId());
		StringBuilder coordenadas = new StringBuilder();
		for (PostoServico entity : lst) {
			
			// apenas na primeira iteracao não deve incluir:
			if (coordenadas.length() > 0) {
				coordenadas.append(",");
			}
			
			coordenadas.append(
					BbLocale.getI18nMessage("label.responsible") + ": " + entity.getResponsavel() + '\n'
					+ BbLocale.getI18nMessage("label.contact") + ": " + entity.getCelularResponsavel() + '\n');
			
			String imgBase64 = Base64.encodeToString(
					entity.getTipoServico().getIcone(), true);
			coordenadas.append(",");
			coordenadas.append(imgBase64);
			
			coordenadas.append(",");
			coordenadas.append(entity.getLatitude());
			coordenadas.append(",");
			coordenadas.append(entity.getLongitude());
		}
		
		return coordenadas.toString();
	}

	/**
	 * Retorna as coordenadas de um tipo de Equipamento
	 * 
	 * @tipoEquipamento
	 * 
	 * @return
	 */
	private String getCoordenadasDeCameras(Long idSetor) {
		logger.info("MapaLocalDetalheController.getCoordenadasDeCameras");
		
		Long idModelEquipamentoCamera = Long.valueOf(1);
		List<Equipamento> lst = equipamentoService.getEquipamentosPorContexto(
				idModelEquipamentoCamera,
				idSetor,
				bbUsuarioLogado.getUserSession().getId());
		
		StringBuilder coordenadas = new StringBuilder();
		for (Equipamento entity : lst) {
			
			// apenas na primeira iteracao não deve incluir:
			if (coordenadas.length() > 0) {
				coordenadas.append(",");
			}
			coordenadas.append(entity.getId());
			
			coordenadas.append(",");
			coordenadas.append(entity.getNome());
			
			String imgBase64 = Base64.encodeToString(
					entity.getModeloEquipamento().getTipoEquipamento().getIcone(),
					true);
			coordenadas.append(",");
			coordenadas.append(imgBase64);
			
			coordenadas.append(",");
			coordenadas.append(entity.getLatitude());
			coordenadas.append(",");
			coordenadas.append(entity.getLongitude());
			
			coordenadas.append(",");
			coordenadas.append(entity.getNome());
			coordenadas.append(",");
			coordenadas.append(entity.getModeloEquipamento().getNome());
			
			coordenadas.append(",");
			coordenadas.append(entity.getIpEquipamento());
		}
		
		return coordenadas.toString();
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setOcorrencias(String str) {
		logger.info("MapaLocalDetalheController.setOcorrencias");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setAmbulancias(String str) {
		logger.info("MapaLocalDetalheController.setAmbulancias");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setBombeiros(String str) {
		logger.info("MapaLocalDetalheController.setBombeiros");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setPolicias(String str) {
		logger.info("MapaLocalDetalheController.setPolicias");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setCamerasL0(String str) {
		logger.info("MapaLocalDetalheController.setCamerasL0");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	/**
	 * Método <i>fake</i> apenas para que o primefaces possa funcionar 
	 * corretamente.
	 *  
	 * @param str
	 */
	@Deprecated
	public void setCamerasL1(String str) {
		logger.info("MapaLocalDetalheController.setCamerasL1");
		//FIXME: PESQUISAR COMO REMOVER
	}
	
	
	public Local getLocal() {
		return local;
	}
	
	public void setLocal(Local local) {
		this.local = local;
	}
	
}

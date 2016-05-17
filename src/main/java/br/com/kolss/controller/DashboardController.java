package br.com.kolss.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.dto.QuantidadeChecklistsPorLocalDTO;
import br.com.kolss.dto.QuantidadeStatusChecklistPorLocalDTO;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.DashboardService;
import br.com.kolss.service.LocalService;
import br.com.kolss.wrapper.PieChartWrapper;
import br.com.kolss.wrapper.DashboardOcorrenciaWrapper;


@Controller(value = "dashboardBean")
@Scope("session")
public class DashboardController {
	
	private final Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected LocalService localService;
	
	@Autowired
	protected DashboardService dashboardService;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	// Gráficos Dashboard do Checklist:
	private PieChartModel pieChartQuantidadeChecklistsPorLocais =
			new PieChartModel();
	private List<PieChartWrapper> pieChartsQuantidadeStatusChecklistsPorLocais =
			new ArrayList<PieChartWrapper>();
	
	//
	private Set<String> chavesPorLocal;
	private Date dateFrom;
	private Date dateTo;

	//

	private List<DashboardOcorrenciaWrapper> listaDashboardOcorrenciaWrapper =
			 new ArrayList<DashboardOcorrenciaWrapper>();
	private PieChartModel graficoPizzaTotalOcorrencia;
	private PieChartModel graficoOcorrencia;
	private List<PieChartModel> listaGraficosOcorrencia;
	private HashMap<String, String> mapaOcorrenciaTotal;
	private HashMap<String, String> mapaOcorrenciaPorLocal;

	ChartSeries briga = new ChartSeries();
	ChartSeries alarme = new ChartSeries();
	ChartSeries fogo = new ChartSeries();
	ChartSeries tumulto = new ChartSeries();
	ChartSeries roubo = new ChartSeries();
	ChartSeries agua = new ChartSeries();
	ChartSeries ferido = new ChartSeries();

	boolean existeBriga = false;
	boolean existeAlarme = false;
	boolean existeFogo = false;
	boolean existeTumulto = false;
	boolean existeRoubo = false;
	boolean existeAgua = false;
	boolean existeFerido = false;


	public DashboardController() {
//		criarGraficoOcorrencia(null, null);
	}
	
	/**
	 * Retorna o Gráfico Pizza da quantidade de Checklists por Locais.
	 * 
	 * @return
	 */
	public PieChartModel getPieChartQuantidadeChecklistsPorLocais() {
		
		this.pieChartQuantidadeChecklistsPorLocais.clear();
		
		List<QuantidadeChecklistsPorLocalDTO> dtos = 
				dashboardService.getQuantidadeChecklistsPorLocais(dateFrom,
						dateTo, bbUsuarioLogado.getUserSession().getId());
		
		for (QuantidadeChecklistsPorLocalDTO dto : dtos) {
			pieChartQuantidadeChecklistsPorLocais.set(
					dto.getNomeLocal() + " - " + dto.getQuantidade(),
					dto.getQuantidade());
		}
		
		return pieChartQuantidadeChecklistsPorLocais;
	}
	
	/**
	 * Retorna a lista de Checklists por Locais.
	 * 
	 * @return
	 */
	public List<PieChartWrapper> getPieChartsQuantidadeStatusChecklistsPorLocais() {
		
		this.pieChartsQuantidadeStatusChecklistsPorLocais.clear();
		
		List<Local> locais = localService.getLocais(
				bbUsuarioLogado.getUserSession().getId());
		for (Local local : locais) {
			
			List<QuantidadeStatusChecklistPorLocalDTO> dtos = 
					dashboardService.getQuantidadeStatusChecklistsPorLocal(
							local.getId(), dateFrom, dateTo,
							bbUsuarioLogado.getUserSession().getId());
			
			if (dtos != null && !dtos.isEmpty()) {
				PieChartModel pieChart = new PieChartModel();
				for (QuantidadeStatusChecklistPorLocalDTO dto : dtos) {
					pieChart.set(
							dto.getNomeStatus() + " - " + dto.getQuantidade(),
							dto.getQuantidade());
				}

				PieChartWrapper wrapper = new PieChartWrapper(local.getNome(),
						pieChart);
				pieChartsQuantidadeStatusChecklistsPorLocais.add(wrapper);
			}
		}
		
		return pieChartsQuantidadeStatusChecklistsPorLocais;
	}
	
	
	
	public List<DashboardOcorrenciaWrapper> getListaDashboardOcorrenciaWrapper() {
		return listaDashboardOcorrenciaWrapper;
	}

	public List<PieChartModel> getListaGraficosOcorrencia() {
		return listaGraficosOcorrencia;
	}

	public Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	public CartesianChartModel getGraficoBarraOcorrencias() {
		return graficoBarraOcorrencias;
	}

	
	private CartesianChartModel graficoBarraOcorrencias;
	
	/**
	 * Metodo responsável por inicializar os gráficos de ocorrencias
	 */
	public void criarGraficoOcorrencia(Date dateFrom, Date dateTo) {
		logger.debug("DashboardControllerV2.criarGraficoOcorrencia");
		
		if (bbUsuarioLogado.getUserSession() != null) {
		
			Serializable idUsuario = bbUsuarioLogado.getUserSession().getId();
			List<Local> local = localService.getLocais(idUsuario); 
			
			DashboardOcorrenciaWrapper dashboardOcorrenciaWrapper = new DashboardOcorrenciaWrapper();
	
			graficoPizzaTotalOcorrencia = new PieChartModel();
			mapaOcorrenciaTotal = dashboardService.mapaTotalOcorrenciaPorLocal(dateFrom, dateTo, idUsuario);
			for (String chave : mapaOcorrenciaTotal.keySet()) {
				if (chave != null) {
					int qtd = Integer.valueOf(mapaOcorrenciaTotal.get(chave));
					chave = chave + " " + qtd;
					graficoPizzaTotalOcorrencia.set(chave, qtd);
				}
			}
			
			dashboardOcorrenciaWrapper.setNomeChecklist("Total por Locais");
			dashboardOcorrenciaWrapper.setGrafico(graficoPizzaTotalOcorrencia);
			listaDashboardOcorrenciaWrapper.add(dashboardOcorrenciaWrapper);
	
			/**
			 * Cria gráfico por locais
			 */
			for (int i = 0; i < local.size(); i++) {
				mapaOcorrenciaPorLocal = dashboardService.mapaOcorrenciaPorLocal(
						local.get(i).getId(), dateFrom, dateTo, idUsuario);
				int qtd = 0;
				if (!mapaOcorrenciaPorLocal.isEmpty()) {
					chavesPorLocal = mapaOcorrenciaPorLocal.keySet();
					graficoOcorrencia = new PieChartModel();
					for (Iterator<String> iterator = chavesPorLocal.iterator();
							iterator.hasNext();) {
	
						dashboardOcorrenciaWrapper = new DashboardOcorrenciaWrapper();
						String chave = iterator.next();
						if (chave != null) {
							
							qtd = Integer
									.valueOf(mapaOcorrenciaPorLocal.get(chave));
							
							chave = chave + " " + qtd;
							graficoOcorrencia.set(chave, qtd);
						}
					}
					dashboardOcorrenciaWrapper.setNomeChecklist(local.get(i)
							.getNome());
					dashboardOcorrenciaWrapper.setGrafico(graficoOcorrencia);
					listaDashboardOcorrenciaWrapper.add(dashboardOcorrenciaWrapper);
				}
			}
			
		}

		briga.setLabel("Briga");
		alarme.setLabel("Alarme");
		fogo.setLabel("Fogo");
		tumulto.setLabel("Tumulto");
		roubo.setLabel("Roubo");
		agua.setLabel("Água");
		ferido.setLabel("Ferido");

		
		graficoBarraOcorrencias = new CartesianChartModel();
		
		/**
		 * 
		ChartSeries boys = new ChartSeries();
        boys.setLabel("Briga");
        boys.set("Maracana", 7);
        boys.set("Itaquerao", 4);
        boys.set("Mineirao", 9);
 
        ChartSeries girls = new ChartSeries();
        girls.setLabel("Ferido");
        girls.set("Maracana", 7);
        girls.set("Itaquerao", 4);
        girls.set("Mineirao", 9);
        
        ChartSeries gls = new ChartSeries();
        girls.setLabel("Alarme");
        girls.set("Maracana", 7);
        girls.set("Itaquerao", 4);
        girls.set("Mineirao", 9);
 
        graficoBarraOcorrencias.addSeries(boys);
        graficoBarraOcorrencias.addSeries(girls);
        graficoBarraOcorrencias.addSeries(gls);
		 */
		
		
		if (existeBriga) {
			graficoBarraOcorrencias.addSeries(briga);
		}
		if (existeAlarme) {
			graficoBarraOcorrencias.addSeries(alarme);
		}
		if (existeFogo) {
			graficoBarraOcorrencias.addSeries(fogo);
		}
		if (existeTumulto) {
			graficoBarraOcorrencias.addSeries(tumulto);
		}
		if (existeRoubo) {
			graficoBarraOcorrencias.addSeries(roubo);
		}
		if (existeAgua) {
			graficoBarraOcorrencias.addSeries(agua);
		}
		if (existeFerido) {
			graficoBarraOcorrencias.addSeries(ferido);
		}
	}

	/**
	 * Criar cartesianos do grafico de barras
	 */
	public void criaGraficoBarraOcorrencia(int qtd, String nomeLocal,
			String chave) {

		if ("BRIGA".equalsIgnoreCase(chave)) {
			existeBriga = true;
			briga.set(nomeLocal, qtd);
		}
		if ("ALARME".equalsIgnoreCase(chave)) {
			existeAlarme = true;
			alarme.set(nomeLocal, qtd);
		}
		if ("FOGO".equalsIgnoreCase(chave)) {
			existeFogo = true;
			fogo.set(nomeLocal, qtd);
		}
		if ("TUMULTO".equalsIgnoreCase(chave)) {
			existeTumulto = true;
			tumulto.set(nomeLocal, qtd);
		}
		if ("ROUBO".equalsIgnoreCase(chave)) {
			existeRoubo = true;
			roubo.set(nomeLocal, qtd);
		}
		if ("AGUA".equalsIgnoreCase(chave)) {
			existeAgua = true;
			agua.set(nomeLocal, qtd);
		}
		if ("FERIDO".equalsIgnoreCase(chave)) {
			existeFerido = true;
			ferido.set(nomeLocal, qtd);
		}

	}

	public void filtrar() {
		this.getPieChartQuantidadeChecklistsPorLocais();
		this.getPieChartsQuantidadeStatusChecklistsPorLocais();
		
//		criarGraficoChecklist(getDateFrom(), getDateTo());
		criarGraficoOcorrencia(getDateFrom(), getDateTo());
	}
	
	/** Realiza a atualização dos dados dos gráficos exibidos na tela. */
	public void refresh() {
		this.getPieChartQuantidadeChecklistsPorLocais();
		this.getPieChartsQuantidadeStatusChecklistsPorLocais();
//		
		criarGraficoOcorrencia(getDateFrom(), getDateTo());
	}
	
}

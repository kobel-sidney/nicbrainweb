package br.com.kolss.wrapper;

import org.primefaces.model.chart.PieChartModel;

public class DashboardOcorrenciaWrapper {
	
	private String nomeOcorrencia;
	private PieChartModel grafico;
	
	public String getNomeChecklist() {
		return nomeOcorrencia;
	}
	public void setNomeChecklist(String nomeChecklist) {
		this.nomeOcorrencia = nomeChecklist;
	}
	public PieChartModel getGrafico() {
		return grafico;
	}
	public void setGrafico(PieChartModel grafico) {
		this.grafico = grafico;
	}
	
}

package br.com.kolss.wrapper;

import org.primefaces.model.chart.PieChartModel;

/**
 * Classe Wrapper para exibir o PieChart com título.
 * 
 * @author developer
 *
 */
public class PieChartWrapper {

	private String titulo;
	private PieChartModel chart;

	public PieChartWrapper() {
		this(null, null);
	}

	public PieChartWrapper(String titulo, PieChartModel grafico) {
		this.titulo = titulo;
		this.chart = grafico;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setNomeChecklist(String nomeChecklist) {
		this.titulo = nomeChecklist;
	}

	public PieChartModel getChart() {
		return chart;
	}

	public void setGrafico(PieChartModel grafico) {
		this.chart = grafico;
	}

}

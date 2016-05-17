package br.com.kolss.util;


/** Enum com as cores de sinalização de "Status X Alerta".*/
public enum SinalizadorCorEnum {
	
	/** Quando não exibe cor - evitar <i>nullpointer</i>.*/
	SEM_COR("sem_cor", 0),
	
	// FIXME: TROCAR PARA BRANCO a partir da Sprint#10
	/** <b>Status</b>: "Em Aguardo" ou "Agendado" e <b>"Sem Alerta"</b>.*/
	AZUL("azul", 2),
	
	/**
	 * <b>Status</b>: "Em Andamento" ou "Finalizado" com <b>Alerta</b>: 
	 * "Sem Alerta".
	 */
	VERDE("verde", 3),
	
	/**
	 * <b>Status</b>: "Em Andamento" ou "Finalizado" com <b>Alerta</b>: 
	 * "Início Atrasado" e "Fim Atrasado".
	 */
	AMARELO("amarelo", 4),
	
	/**
	 * <b>Status</b>: "Em Aguardo" ou "Agendado" com <b>Alerta</b>: 
	 * "Não Iniciado" e "Não Finalizado";
	 * ou
	 * <b>Status</b>: "Em Andamento" com <b>Alerta</b>: "Não Finalizado";
	 */
	VERMELHO("vermelho", 5),
	
	/** <b>Status</b>: "Cancelado" com ou sem Alertas; */
	ROXO("roxo", 1);
	
	
	private String nomeCor;
	private int prioridade;
	
	private SinalizadorCorEnum(String nomeCor, int prioridade) {
		this.nomeCor = nomeCor;
		this.prioridade = prioridade;
	}
	
	
	/**
	 * Retorna o Enum associado com a prioridade desejada.
	 * 
	 * @param prioridade
	 * @return
	 */
	public static SinalizadorCorEnum getSinalizadorCor(int prioridade) {
		SinalizadorCorEnum sinalCor = null;
		for (SinalizadorCorEnum currentSinalCor : SinalizadorCorEnum.values()) {
			if (currentSinalCor.getPrioridade() == prioridade) {
				sinalCor = currentSinalCor;
			}
		}
		
		return sinalCor;
	}
	
	public String getNome() {
		return this.nomeCor;
	}
	
	public int getPrioridade() {
		return prioridade;
	}
	
}

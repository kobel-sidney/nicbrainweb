package br.com.kolss.model.enuns;


/** Indica os estados vigente de um Checklist ou Atividade */
public enum SituacaoEnum {
	
	ALERTA_VIGENTE("alerta_vigente", 5),
	ALERTA_OCORRIDO("alerta_ocorrido", 4),
	SEM_ALERTA("sem_alerta", 3),
	AGENDADO("agendado", 2),
	CANCELADA("cancelado", 1),
	SEM_INDICADOR("sem_indicacao", 0);
	
	private String nome;
	private int prioridade;
	
	
	public static SituacaoEnum getValue(int prioridade){
		SituacaoEnum indicador = SituacaoEnum.SEM_INDICADOR;
		
		for (SituacaoEnum situacao : values()){
			if(situacao.getPrioridade() == prioridade){
                 indicador = situacao;	
                 break;
			}
		}
		
		return indicador;
	}
	
	private SituacaoEnum(String nome, int prioridade) {
		this.nome = nome;
		this.prioridade = prioridade;
	}
	
	/** Retorna o nome de identificação desta situação. */
	public String getNome() {
		return this.nome;
	}
	
	/** 
	 * Retorna o número da prioridade da situação.<br>
	 * Quanto maior o número, maior a prioridade da Situação.
	 * 
	 * @return
	 */
	public int getPrioridade() {
		return this.prioridade;
	}
	
}

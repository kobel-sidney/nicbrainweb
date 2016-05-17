package br.com.kolss.model.enuns;


/** Indica os estados de uma Ocorrência */
public enum SituacaoOcorrenciaEnum {
	
	OCORRENCIA_VIGENTE("ocorrencia_vigente", 2),
	SEM_OCORRENCIA("ocorrencia", 1),
	SEM_INDICADOR("sem_indicacao", 0);
	
	private String nome;
	private int prioridade;
	
	private SituacaoOcorrenciaEnum(String nome, int prioridade) {
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

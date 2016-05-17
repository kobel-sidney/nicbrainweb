package br.com.kolss.model.enuns;


/** <i>Enuns</i> para mapear os <i>Status</i> da Regeneração da Senha. */
public enum RegeracaoSenhaStatusEnum {
	
	EM_ANDAMENTO(1),
	CONCLUIDO(2),
	EXPIRADO(3);
	
	private int idRegeracaoSenhaStatus;
	
	private RegeracaoSenhaStatusEnum(int idRegeracaoSenhaStatus) {
		this.idRegeracaoSenhaStatus = idRegeracaoSenhaStatus;
	}

	
	public int getIdRegeracaoSenhaStatus() {
		return idRegeracaoSenhaStatus;
	}
	
}

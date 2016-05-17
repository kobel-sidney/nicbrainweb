package br.com.kolss.util;

public enum PerfilEnum {
	
	ADMINISTRADOR(1),
	DIRETOR(5),
	GERENTE(2),
	SUPERVISOR(4),
	OPERADOR_MESTRE(6),
	OPERADOR(3);
	
	private int idPerfil = 0;

	private PerfilEnum(int idPerfil) {
		this.idPerfil = idPerfil;
	}

	public Integer getIdPerfil() {
		return idPerfil;
	}

	public void setIdPerfil(int idPerfil) {
		this.idPerfil = idPerfil;
	}

}

package br.com.kolss.model.enuns;


/** Constantes para o Lado do Menu da Tela. */
public enum LadoMenuEnum {
	
	ACIMA(1),
	ABAIXO(2),
	DIREITA(3),
	ESQUERDA(4);
	
	private int id;
	
	private LadoMenuEnum(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}
	
}

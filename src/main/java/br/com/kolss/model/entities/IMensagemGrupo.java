package br.com.kolss.model.entities;


/** Inteface que define o comportamento da MensagemGrupo. */
public interface IMensagemGrupo {

	/** Retorna o Tipo de Envio. */
	TipoEnvio getTipoEnvio();
	
	/** Define o Tipo de Envio. */
	void setTipoEnvio(TipoEnvio tipoEnvio);
	
	/** Retorna o Grupo. */
	Grupo getGrupo();
	
	/** Define o Grupo. */
	void setGrupo(Grupo grupoUsuario);
	
}

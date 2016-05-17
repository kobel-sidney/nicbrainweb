package br.com.kolss.model.entities;

import br.com.kolss.model.enuns.SituacaoEnum;


/** Define que uma entitade possui um Indicativo de Situação. */
public interface ISituacao {
	
	/** Retorna a Situação Atual do Entity. */
	SituacaoEnum getSituacao();
	
	/** Define o Situação Atual do Entity. */
	void setSituacao(SituacaoEnum situacao);
	
}

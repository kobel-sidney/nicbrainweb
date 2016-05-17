package br.com.kolss.model.entities;

import java.util.Date;
import java.util.Set;


/** Inteface que define o comportamento de uma Mensagem Associada. */
public interface IMensagemAssociada {
	
	/** Retorna a Data de Envio da Mensagem Associada. */
	Date getDataEnvio();
	
	/** Define a Data de Envio da Mensagem Associada. */
	void setDataEnvio(Date dataEnvio);
	
	/** Retorna o Tempo de Escala para envio de nova Mensagem Associada. */
	Integer getTempoEscala();
	
	/** Define o Tempo de Escala para envio de nova Mensagem Associada. */
	void setTempoEscala(Integer tempoEscala);
	
	/** Retorna se esta Mensagem Associada esta ativa. */
	boolean isAtivo();
	
	/** Define se esta Mensagem Associada esta ativa. */
	void setAtivo(boolean ativo);
	
	/** Retorna os detalhes da Mensagem Associada. */
	Mensagem getMensagem();
	
	/** Define os detalhes da Mensagem Associada. */
	void setMensagem(Mensagem mensagem);
	
	/** Retorna os Grupos de Mensagens. */
	Set<IMensagemGrupo> getMensagensGrupos();
	
	/** Define os Grupos de Mensagens. */
	void setIMensagensGrupos(Set<IMensagemGrupo> iMensagensGrupos);
}

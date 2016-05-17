package br.com.kolss.service.regras;

import java.io.Serializable;

import br.com.kolss.exception.SemPermissaoPorPerfilException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Ocorrencia;


public interface PermissaoPerfilService {
	
	/**
	 * Verifica se o Usuário solicitante possui permissão para executar a
	 * Operação em uma Atividade.
	 * 
	 * @param idUsuario
	 * @param atividade
	 * 
	 * @throws SemPermissaoPorPerfilException
	 */
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,
			Atividade atividade) throws SemPermissaoPorPerfilException;
	
	/**
	 * Verifica se o Usuário solicitante possui permissão para executar a
	 * Operação em um Checklist.
	 * 
	 * @param idUsuario
	 * @param checklist
	 * 
	 * @throws SemPermissaoPorPerfilException
	 */
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,
			Checklist checklist) throws SemPermissaoPorPerfilException;
	
	/**
	 * Verifica se o Usuário solicitante possui permissão para executar a
	 * Operação em uma Ocorrência.
	 * 
	 * @param idUsuario
	 * @param ocorrencia
	 * 
	 * @throws SemPermissaoPorPerfilException
	 */
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,
			Ocorrencia ocorrencia) throws SemPermissaoPorPerfilException;
	
}

package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Equipamento;


public interface EquipamentoService {
	
	/**
	 * Obtém todos os Equipamentos de um Setor filtrado e autorizadas para o
	 * Usuário selecionado (via contexto).
	 * 
	 * @param idTipoEquipamento
	 * @param idSetor
	 * @param idLocal
	 * @param idCliente
	 * @param idContratante
	 * @param idUsuario
	 * 
	 * @return
	 * 
	 * @throws ServiceException
	 */
	public List<Equipamento> getEquipamentosPorContexto(
			Serializable idTipoEquipamento, Serializable idSetor,
			Serializable idUsuario) throws ServiceException;
	
}

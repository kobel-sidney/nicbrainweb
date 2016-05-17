package br.com.kolss.service;

import java.util.List;

import br.com.kolss.dto.CercaVirtualDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Usuario;

public interface CercaVirtualService {

	/**
	 * Salva pontos dos vértices da cerca virtual
	 * 
	 * @param pontosCercaVirtual
	 */
	void salvar(CercaVirtualDTO pontosCercaVirtualDTO) throws ServiceException;

	/**
	 * Exclui cerca virtual pelo id
	 * 
	 * @param idLocal
	 * @throws ServiceException
	 */
	void excluir(Integer idCercaVirtual) throws ServiceException;

	List<CercaVirtualDTO> listarCercasVirtuais(Usuario usuario) throws ServiceException;

	CercaVirtualDTO buscarCercaVirtual(Integer idCercaVirtual) throws ServiceException;

	/**
	 * 
	 * @param email
	 * @return
	 */
	List<CercaVirtualDTO> obterCercasVirtuaisPorEmail(String email);

	/**
	 * 
	 * @param id
	 * @return
	 * @throws ServiceException
	 */
	CercaVirtual obterCercaVirtualPorId(Integer id) throws ServiceException;
}

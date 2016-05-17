package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Local;

public interface CercaVirtualRepository {

	/**
	 * Salva pontos dos vértices da cerca virtual
	 * 
	 * @param pontosCercaVirtual
	 */
	void salvar(CercaVirtual cercaVirtual);

	/**
	 * Atualiza uma cerca virtual
	 * 
	 * @param cercaVirtual
	 */
	void atualizar(CercaVirtual cercaVirtual);

	/**
	 * Exclui pontos dos vértices da cerca virtual
	 * 
	 * @param pontosCercaVirtual
	 */
	void excluir(CercaVirtual cercaVirtual);

	/**
	 * Busca uma cerca virtual de acordo com o local passado.
	 * 
	 * @param local
	 * @return
	 */
	List<CercaVirtual> buscarPorLocal(Local local);
	
	/**
	 * Busca cerca virtual pelo id fornecido
	 * 
	 * @param idCercaVirtual
	 * @return
	 */
	CercaVirtual buscarPorId(Integer idCercaVirtual);
}

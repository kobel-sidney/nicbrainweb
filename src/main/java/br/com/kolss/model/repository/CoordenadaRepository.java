package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Coordenada;

public interface CoordenadaRepository {

	/**
	 * Salva uma coordenada
	 * 
	 * @param coordenada
	 */
	void salvar(Coordenada coordenada);
	
	/**
	 * Exclui coordenada
	 * 
	 * @param coordenada
	 */
	void excluir(Coordenada coordenada);
	
	/**
	 * Listar coordenadas pela cerca virtual
	 * 
	 * @param cercaVirtual
	 * @return
	 */
	List<Coordenada> obterCoordenadas(CercaVirtual cercaVirtual);
}

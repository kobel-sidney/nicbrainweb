package br.com.kolss.model.repository;

import java.util.Date;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.entities.Veiculo;

public interface RondaRepository {

	/**
	 * 
	 * @param ronda
	 */
	void salvar(Ronda ronda);

	/**
	 * 
	 * @param cliente
	 * @return
	 */
	List<Ronda> obterRondasFinalizadas(Cliente cliente);

	/**
	 * 
	 * @param idRonda
	 * @return
	 */
	Ronda obterRonda(Long idRonda);

	/**
	 * 
	 * @return
	 */
	List<Ronda> obterEmAndamentoPorContexto(Usuario usuario);

	/**
	 * 
	 * @param veiculo
	 * @return
	 */
	Ronda obterEmAndamentoPorVeiculo(Veiculo veiculo);
	
	/**
	 * 
	 * @param idUsuario
	 * @return
	 */
	Ronda obterEmAndamentoPorUsuario(Usuario idUsuario);

	/**
	 *
	 * @param idRonda
	 * @return
     */
	Ronda obterRondaEmAndamento(Long idRonda);

	/**
	 * 
	 * @param usuario
	 * @param inicio
	 * @param fim
	 * @return
	 */
	List<Ronda> obterFinalizadasRecentes(Usuario usuario, Date inicio, Date fim);
}

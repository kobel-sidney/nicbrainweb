package br.com.kolss.service;

import java.util.List;

import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.Usuario;

/**
 *
 * @author weverton
 */
public interface RondaService {

    /**
     *
     * @param filtro
     * @return Viaturas de acordo com o filtro
     */
    String obterRondas(FiltroRonda filtro);

    /**
     *
     * @param ronda
     * @throws ServiceException
     */
    void salvar(Ronda ronda) throws ServiceException;

    Ronda obterRonda(Long idRonda) throws ServiceException;

    /**
     * 
     * @return 
     */
    List<Ronda> obterEmAndamento(Usuario usuario);

    /**
     *
     * @param idRonda
     * @return
     */
    Ronda obterEmAndamento(Long idRonda);

    /**
     * 
     * @param idVeiculo
     * @return
     * @throws ServiceException
     */
    List<GuarnicaoDTO> buscarGuarnicoes(Long idVeiculo) throws ServiceException;

    
    /**
     * 
     * @param idUsuarioLong
     * @return
     * @throws ServiceException
     */
	RondaDTO obterEmAndamentoPorUsuario(Long idUsuarioLong) throws ServiceException;

	/**
	 * 
	 * @param usuario
	 * @return
	 */
	List<Ronda> obterFinalizadasRecentes(Usuario usuario);
}

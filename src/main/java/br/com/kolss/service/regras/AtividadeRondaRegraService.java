package br.com.kolss.service.regras;

import java.io.Serializable;

import br.com.kolss.exception.ServiceException;

public interface AtividadeRondaRegraService {

	void validarDistanciaLimite(Serializable idAtividade,
			String latitudeUsuario, String longitudeUsuario,
			Serializable idUsuarioResponsavel) throws ServiceException;

}

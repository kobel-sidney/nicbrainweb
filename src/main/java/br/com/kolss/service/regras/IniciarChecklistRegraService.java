package br.com.kolss.service.regras;

import java.io.Serializable;

import br.com.kolss.exception.ServiceException;

public interface IniciarChecklistRegraService {

	void statusAtividadeAlterado(Serializable idAtividade,Serializable idUsuario) throws ServiceException;

	void statusAtividadeAlteradoMobile(Integer idAtividade, Integer idUsuario)throws ServiceException;

}

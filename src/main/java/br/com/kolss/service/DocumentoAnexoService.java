package br.com.kolss.service;

import java.util.List;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.DocumentoAnexo;
import br.com.kolss.model.entities.Local;

public interface DocumentoAnexoService {

	List<DocumentoAnexo> listarPorLocal(Local local) throws ServiceException;

	void excluir(DocumentoAnexo documentoAnexo);

	void salvar(DocumentoAnexo documentoAnexo);
}

package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.DocumentoAnexo;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.repository.DocumentoAnexoRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class DocumentoAnexoServiceImpl implements DocumentoAnexoService {

	@Autowired
	private DocumentoAnexoRepository documentoAnexoRepository;

	@Override
	public List<DocumentoAnexo> listarPorLocal(Local local) throws ServiceException {
		return documentoAnexoRepository.listarPorLocal(local);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(DocumentoAnexo documentoAnexo) {
		documentoAnexoRepository.excluir(documentoAnexo);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(DocumentoAnexo documentoAnexo) {
		documentoAnexoRepository.salvar(documentoAnexo);
	}

}

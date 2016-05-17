package br.com.kolss.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.ContratanteRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class ContratanteServiceImpl implements ContratanteService {

	@Autowired
	private ContratanteRepository contratanteRepository;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(Contratante contratante) throws ServiceException {
		contratante.setDataCadastro(new Date());
		contratanteRepository.salvar(contratante);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(Contratante contratante) throws ServiceException {
		contratanteRepository.atualizar(contratante);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(Contratante contratante) throws ServiceException {
		contratanteRepository.remover(contratante);

	}

	@Override
	public Contratante obter(Long id) throws ServiceException {
		return (Contratante) contratanteRepository.find(id);
	}

	@Override
	public List<Contratante> obterTodos() throws ServiceException {
		return contratanteRepository.listar();
	}
	
	@Override
	public Contratante obterPorUsuario(Usuario usuario) throws ServiceException {
		return (Contratante) contratanteRepository.obterPorUsuario(usuario);
	}
	

}

package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.RetornoStatusDTO;
import br.com.kolss.dto.StatusDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Status;
import br.com.kolss.model.repository.StatusRepository;


@Service
@Transactional(readOnly = true)
public class StatusServiceImpl implements StatusService {

	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected StatusRepository statusRepository;
	
	@Autowired
	protected UsuarioService usuarioService;
	
	
	@Override
	public Status obter(Serializable idStatus) {
		logger.debug("StatusServiceImpl.find");
		
		return statusRepository.obter(idStatus);
	}
	
	@Override
	public List<Status> getStatusAlteraveis() throws ServiceException {
		logger.debug("StatusServiceImpl.getStatusAlteraveis");
		
		return statusRepository.obterStatusAlteraveis();
	}
	
	@Override
	public List<Status> getAllChecklistStatus() throws ServiceException {
		logger.debug("StatusServiceImpl.getAllChecklistStatus");
		return statusRepository.obterChecklistStatus();
	}

	@Override
	public List<Status> obterTodos() {
		logger.debug("StatusServiceImpl.obterTodos");
		return statusRepository.obterTodos();
	}

	@Override
	public void remover(Status status) {
		logger.debug("StatusServiceImpl.remover");
		statusRepository.remover(status);
		
	}

	@Override
	public void atualizar(Status status) {
		logger.debug("StatusServiceImpl.atualizar");
		statusRepository.atualizar(status);
	}

	@Override
	public void salvar(Status status) {
		logger.debug("StatusServiceImpl.salvar");
		statusRepository.salvar(status);
	}

	@Override
	public RetornoStatusDTO obterTodosMobile(String idUsuario) {
		
		logger.debug("StatusServiceImpl.obterTodosMobile");
		RetornoStatusDTO retornoStatusDTO = new RetornoStatusDTO();
		
		if(idUsuario==null || usuarioService.obter(idUsuario)==null){
			throw new ServiceException("Usuário Inválido");
		}
		List<StatusDTO> list = converterStatus(statusRepository.obterTodos());
		retornoStatusDTO.setStatusDtos(list);
		retornoStatusDTO.setRetornoEnum(RetornoEnum.SUCESSSO);
		
		return retornoStatusDTO;
	}

	private List<StatusDTO> converterStatus(List<Status> statuss) {
		
		List<StatusDTO> dtos = new ArrayList<>();
		
		for (Status status : statuss) {
			StatusDTO dto = new StatusDTO();
			dto.setId(status.getId());
			dto.setNome(status.getNome());
			dtos.addAll(dtos);
		}
		
		return dtos;
	}
	
}

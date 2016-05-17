package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Equipamento;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.repository.EquipamentoRepository;
import br.com.kolss.model.repository.SetorRepository;


@Service
public class EquipamentoServiceImpl implements EquipamentoService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected EquipamentoRepository equipamentoRepository;
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected SetorRepository setorRepository;
	
	
	@Override
	public List<Equipamento> getEquipamentosPorContexto(
			Serializable idTipoEquipamento, Serializable idSetor,
			Serializable idUsuario) throws ServiceException {
		logger.debug("EquipamentoServiceImpl.getEquipamentos");
		
		Setor setor = setorRepository.find(idSetor);
		return equipamentoRepository.getEquipamentos(
				idTipoEquipamento,
				setor,
				usuarioService.obter(idUsuario));
	}
	
}

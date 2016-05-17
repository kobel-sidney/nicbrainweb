package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;
import br.com.kolss.model.repository.RelacionamentoPerflFormularioRepository;

@Service("RelacionamentoPerfilFormularioService")
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class RelacionamentoPerflFormularioServiceImpl implements
		RelacionamentoPerflFormularioService {

	@Autowired
	RelacionamentoPerflFormularioRepository repository;

	@Override
	public List<RelacionamentoPerfilFormulario> listarRelacionamentoPerfilFormulario() {
		return repository.listarRelacionamentoPerfilFormulario();
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void salvar(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		repository.salvar(relacionamentoPerfilFormulario);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void atualizar(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		repository.atualizar(relacionamentoPerfilFormulario);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public void remover(
			RelacionamentoPerfilFormulario relacionamentoPerfilFormulario) {
		repository.remover(relacionamentoPerfilFormulario);
	}

}

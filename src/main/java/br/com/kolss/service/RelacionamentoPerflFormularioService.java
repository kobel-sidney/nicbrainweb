package br.com.kolss.service;

import java.util.List;

import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;

public interface RelacionamentoPerflFormularioService {

	List<RelacionamentoPerfilFormulario> listarRelacionamentoPerfilFormulario();

	void salvar(RelacionamentoPerfilFormulario relacionamentoPerfilFormulario);

	void atualizar(RelacionamentoPerfilFormulario relacionamentoPerfilFormulario);

	void remover(RelacionamentoPerfilFormulario relacionamentoPerfilFormulario);
}

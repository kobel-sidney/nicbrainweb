package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import br.com.kolss.model.entities.AbstractEntity;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Usuario;

public interface FuncionarioRepository {

	Funcionario buscar(Serializable idFuncionario);

	Funcionario find(Usuario usuario);

	List<Funcionario> find(Collection<Serializable> idFuncionarios);

	Funcionario getResponsavelPorAtividade(Serializable idAtividade);

	Funcionario getResponsavelPorChecklist(Serializable idChecklist);

	Funcionario getResponsavelSuperiorPorAtividade(Serializable idAtividade);

	Funcionario getResponsavelSuperiorPorChecklist(Serializable idChecklist);

	Funcionario getFuncionarioSuperior(Serializable id, @SuppressWarnings("rawtypes") Class<? extends AbstractEntity> classe);

	List<Funcionario> getFuncionariosResponsaveisPorAtividade(Usuario user);

	List<Funcionario> getFuncionariosResponsaveisPorChecklist(Usuario user);

	List<String> getPorEvento(Usuario usuario);

	List<Funcionario> listarTodosFuncionarios();

	void salvarOuAtualizar(Funcionario funcionario);

	void atualizar(Funcionario funcionario);

	void excluir(Funcionario funcionario);

	List<Funcionario> getFuncionarios();

}

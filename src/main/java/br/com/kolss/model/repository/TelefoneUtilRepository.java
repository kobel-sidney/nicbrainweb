package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TelefoneUtil;

public interface TelefoneUtilRepository {
	
	List<TelefoneUtil> obterTodos(Contratante contratante);
	void remover(TelefoneUtil telefoneUtil);
	void atualizar(TelefoneUtil telefoneUtil);
	void salvar(TelefoneUtil telefoneUtil);

}

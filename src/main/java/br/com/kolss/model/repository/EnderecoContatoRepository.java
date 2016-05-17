package br.com.kolss.model.repository;

import java.util.List;

import br.com.kolss.model.entities.Contato;
import br.com.kolss.model.entities.EnderecoContato;

public interface EnderecoContatoRepository {

	void adicionar(EnderecoContato enderecoContato);

	void remover(EnderecoContato enderecoContato);

	List<EnderecoContato> listarPorContato(Contato contato);
}

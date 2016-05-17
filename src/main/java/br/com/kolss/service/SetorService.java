package br.com.kolss.service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Setor;

import java.io.Serializable;
import java.util.List;

public interface SetorService {

    /**
     * Lista todos os setores
     * 
     * @return
     * @throws ServiceException 
     */
    List<Setor> obterTodos() throws ServiceException;
     
    List<Setor> obterPorContratante(Contratante contratante) throws ServiceException;

    List<Setor> obterPorCliente(Cliente cliente);
    /**
     * Exclui um setor
     * 
     * @param setor
     * @throws ServiceException 
     */
    void excluir(Setor setor) throws ServiceException;
    
    Setor find(Serializable idSetor);

	void salvar(Setor setor) throws ServiceException;
}

package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.repository.SetorRepository;

@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class SetorServiceImpl implements SetorService {

    private Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    SetorRepository setorRepository;

    @Override
    public List<Setor> obterTodos() {
        return setorRepository.obterTodos();
    }
    
    @Override
    public List<Setor> obterPorContratante(Contratante contratante) throws ServiceException {
        if (contratante == null) {
			throw new ServiceException("Contratante nulo");
		}
        
        return setorRepository.obterPorContratante(contratante);
    }

    @Override
    public List<Setor> obterPorCliente(Cliente cliente) {
        if (cliente == null) {
            throw new ServiceException("Cliente nulo");
        }

        return setorRepository.obterPorCliente(cliente);
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void excluir(Setor setor) throws ServiceException {
        if (setor == null) {
            throw new ServiceException("Setor inválido");
        }

        setorRepository.excluir(setor);
    }
    
    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void salvar(Setor setor) throws ServiceException {
        if (setor == null) {
            throw new ServiceException("Setor inválido");
        }

        setorRepository.salvar(setor);
    }

    @Override
    public Setor find(Serializable idSetor) {
    	return setorRepository.find(idSetor);
    }
}

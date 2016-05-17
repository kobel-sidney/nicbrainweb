package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.TrocaVeiculo;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.model.repository.TrocaVeiculoRepository;

@Service
@Transactional
public class TrocaVeiculoServiceImpl  implements TrocaVeiculoService{
	
	@Autowired
	private TrocaVeiculoRepository trocaVeiculoRepository;
        
        @Autowired
        private VeiculoService veiculoService;

	@Override
	public void inserir(TrocaVeiculo trocaVeiculo) {
		antesInserir(trocaVeiculo);
		trocaVeiculoRepository.inserir(trocaVeiculo);
	}

	private void antesInserir(TrocaVeiculo trocaVeiculo) {
		trocaVeiculo.setDataCadastro(new Date());
	}

	@Override
	public void atualizar(TrocaVeiculo trocaVeiculo) {
		 trocaVeiculoRepository.atualizar(trocaVeiculo);		
	}

	@Override
	public void deletar(TrocaVeiculo trocaVeiculo) {
		trocaVeiculoRepository.deletar(trocaVeiculo);	
	}

	@Override
	public List<TrocaVeiculo> obterTodos(Contratante contratante) {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return trocaVeiculoRepository.obterTodos(contratante);
	}

	@Override
	public TrocaVeiculo obter(Serializable id,Contratante contratante) {
		
		if(contratante==null || contratante.getId()==null){
			throw new ServiceException("Contratante inválido");
		}
		
		return trocaVeiculoRepository.obter(id,contratante);
	}

    @Override
    public List<GuarnicaoDTO> buscarGuarnicoes(Long idVeiculo) throws ServiceException {
        if (idVeiculo == null) {
            throw new ServiceException("ID do veículo inválido");
        }
        
        Veiculo veiculo = veiculoService.obter(idVeiculo);
        if (veiculo == null) {
            throw new ServiceException("Veículo nulo");
        }
        
        TrocaVeiculo trocaVeiculo = trocaVeiculoRepository.buscarComStatusSaida(veiculo);
        Set<Pessoa> pessoas;
        List<GuarnicaoDTO> guarnicoes = new ArrayList<>();
        
        if (trocaVeiculo != null) {
            pessoas = trocaVeiculo.getPessoas();
            
            for (Pessoa pessoa : pessoas) {
                GuarnicaoDTO guarnicao = new GuarnicaoDTO();
                guarnicao.setId(pessoa.getId());
                guarnicao.setNome(pessoa.getNome());
                guarnicao.setIdVeiculo(veiculo.getId());
                guarnicoes.add(guarnicao);
            }
        }
        
        return guarnicoes;
    }

}

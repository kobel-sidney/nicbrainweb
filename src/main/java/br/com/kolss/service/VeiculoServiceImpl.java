package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import br.com.kolss.model.entities.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.model.entities.TipoVeiculo;
import br.com.kolss.model.repository.VeiculoRepository;

@Service
public class VeiculoServiceImpl implements VeiculoService {
	
	@Autowired
	private VeiculoRepository veiculoRepository;
	
	@Autowired
	private TipoVeiculoService tipoVeiculoService;

	@Override
	public void inserir(Veiculo veiculo) {
		
		if(veiculo==null){
			throw new ServiceException("Inserir Veículo Inválido!");
		}
		
		antesInserir(veiculo);
		veiculoRepository.inserir(veiculo);
		
	}

	private void antesInserir(Veiculo veiculo) {
		
		if(veiculo==null){
			throw new ServiceException("Atualizar Veículo Inválido!");
		}
		TipoVeiculo tipo = tipoVeiculoService.obter(veiculo.getVeiculoTipo().getId());
		veiculo.setVeiculoTipo(tipo);
		veiculo.setDataCadastro(new Date());
	}

	@Override
	public void atualizar(Veiculo veiculo) {
		
		if(veiculo==null){
			throw new ServiceException("Atualizar Veículo Inválido!");
		}
		veiculoRepository.atualizar(veiculo);
	}

	@Override
	public void deletar(Veiculo veiculo) {
		if(veiculo==null){
			throw new ServiceException("Deletar Veículo Inválido!");
		}
		veiculoRepository.deletar(veiculo);
	}

	@Override
	public List<Veiculo> obterTodos(Contratante contratante) {
		return veiculoRepository.obterTodos(contratante);
	}

	@Override
	public List<Veiculo> obterPorCliente(Cliente cliente) {
		return veiculoRepository.obterPorCliente(cliente);
	}

	@Override
	public Veiculo obter(Serializable id) {
		try {
			Long idVeiculo = (Long)id;
			return veiculoRepository.obter(idVeiculo);
		} catch (Exception e) {
			throw new ServiceException("ID veículo inválido!");
		}
	}
	


}

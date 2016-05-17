package br.com.kolss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.TipoRonda;
import br.com.kolss.model.repository.TipoRondaRepository;

@Service
@Transactional
public class TipoRondaServiceImpl implements TipoRondaService {

	@Autowired
	private TipoRondaRepository tipoRondaRepository;

	@Override
	public void salvar(TipoRonda tipoRonda) throws ServiceException {
		if (tipoRonda == null) {
			throw new ServiceException("Tipo de ronda nulo");
		}

		tipoRondaRepository.salvar(tipoRonda);
	}

	@Override
	public void excluir(TipoRonda tipoRonda) throws ServiceException {
		if (tipoRonda == null) {
			throw new ServiceException("Tipo de ronda nulo");
		}

		tipoRondaRepository.excluir(tipoRonda);
	}

	@Override
	public List<TipoRonda> obterRondas() {
		return tipoRondaRepository.obterRondas();
	}

}

package br.com.kolss.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.repository.AgendamentoRastreamentoUsuarioRepository;


@Service
public class AgendamentoRastreamentoUsuarioServiceImpl implements AgendamentoRastreamentoUsuarioService {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected AgendamentoRastreamentoUsuarioRepository rastreamentoRepository;

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosPorUsuario(Serializable idDoUsuario) {
		return rastreamentoRepository.getRastreamentosPorUsuario(idDoUsuario);
	}
	
	@Override
	public void salvar(AgendamentoRastreamentoUsuario rastreamento){
		rastreamentoRepository.salvar(rastreamento);
	}

	@Override
	public void alterar(AgendamentoRastreamentoUsuario rastreamento) {
		rastreamentoRepository.alterar(rastreamento);
	}

	@Override
	public void excluir(AgendamentoRastreamentoUsuario rastreamento) {
		rastreamentoRepository.excluir(rastreamento);
	}

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorVigencia(Date vigenciaDeRastreamento) {
		return rastreamentoRepository.getRastreamentosAtivosPorVigencia(vigenciaDeRastreamento);
	}

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivos() {
		return rastreamentoRepository.getRastreamentosAtivos();
	}

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorPeriodo(Date dataInicial, Date dataFinal) {
		return rastreamentoRepository.getRastreamentosAtivosPorPeriodo(dataInicial, dataFinal);
	}

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuario(String nomeDoUsuario) {
		return rastreamentoRepository.getRastreamentosAtivosPeloNomeDoUsuario(nomeDoUsuario);
	}

	@Override
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(String nomeDoUsuario, Date dataInicial, Date dataFinal) {
		return rastreamentoRepository.getRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(nomeDoUsuario,dataInicial, dataFinal);
	}
	
	@Override
	public AgendamentoRastreamentoUsuario getRastreamentoPorId(Serializable idRastreamento){
		return rastreamentoRepository.getRastreamentoPorId(idRastreamento);
	}
	
	
}

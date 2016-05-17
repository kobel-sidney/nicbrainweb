package br.com.kolss.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.entities.RastreamentoUsuario;
import br.com.kolss.model.repository.RastreamentoUsuarioRepository;


@Service
public class RastreamentoUsuarioServiceImpl implements RastreamentoUsuarioService {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	RastreamentoUsuarioRepository rastreamentoUsuarioRepository;
	
	@Override
	public void salvar(RastreamentoUsuario rastreamentoUsuario){
		rastreamentoUsuarioRepository.salvar(rastreamentoUsuario);
	}

	@Override
	public void alterar(RastreamentoUsuario rastreamentoUsuario) {
		rastreamentoUsuarioRepository.alterar(rastreamentoUsuario);
	}

	@Override
	public void excluir(RastreamentoUsuario rastreamentoUsuario) {
		rastreamentoUsuarioRepository.excluir(rastreamentoUsuario);
	}

	@Override
	public List<RastreamentoUsuario> getPontosDeRastreamentoPorRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		return rastreamentoUsuarioRepository.getPontosDeRastreamentoPorRastreamento(agendamentoRastreamentoUsuario);
	}
	
	@Override
	public RastreamentoUsuario getPrimeiroPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		return rastreamentoUsuarioRepository.getPrimeiroPontoRastreadoDoRastreamento(agendamentoRastreamentoUsuario);
	}
	
	@Override
	public RastreamentoUsuario getUltimoPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		return rastreamentoUsuarioRepository.getUltimoPontoRastreadoDoRastreamento(agendamentoRastreamentoUsuario);
	}
	
}

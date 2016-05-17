package br.com.kolss.service;

import java.util.List;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.entities.RastreamentoUsuario;


public interface RastreamentoUsuarioService {
	
	public void salvar(RastreamentoUsuario rastreamentoUsuario);
	
	public void alterar(RastreamentoUsuario rastreamentoUsuario);
	
	public void excluir(RastreamentoUsuario rastreamentoUsuario);
	
	public List<RastreamentoUsuario> getPontosDeRastreamentoPorRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario);
	
	public RastreamentoUsuario getPrimeiroPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario);
	
	public RastreamentoUsuario getUltimoPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario);
	
}

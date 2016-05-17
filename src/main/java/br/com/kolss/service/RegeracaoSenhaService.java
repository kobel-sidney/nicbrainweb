package br.com.kolss.service;

import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Usuario;


public interface RegeracaoSenhaService {
	
	void salvar(RegeracaoSenha regeracaoSenha);
	
	void atualizar(RegeracaoSenha regeracaoSenha);
	
	public RegeracaoSenha getPorHashDeValidacacaoNaoExpirado(String hashDeValidacacao);
	
	public RegeracaoSenha getEmAndamentoPorUsuario(Usuario usuario);
	
	public void expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario(Usuario usuario);
	
}

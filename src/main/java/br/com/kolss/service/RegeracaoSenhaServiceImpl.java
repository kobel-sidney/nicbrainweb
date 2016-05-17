package br.com.kolss.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.RegeracaoSenhaRepository;


@Service
public class RegeracaoSenhaServiceImpl implements RegeracaoSenhaService {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected RegeracaoSenhaRepository regeracaoDeSenhaRepository;
	
	
	public RegeracaoSenhaServiceImpl() {
	}
	
	
	@Override
	public void salvar(RegeracaoSenha regeracaoSenha) {
		logger.debug("RegeracaoDaSenhaServiceImpl.salvar");
		regeracaoDeSenhaRepository.salvar(regeracaoSenha);
	}
	
	@Override
	public void atualizar(RegeracaoSenha regeracaoSenha) {
		regeracaoDeSenhaRepository.atualizar(regeracaoSenha);
	}

	@Override
	public RegeracaoSenha getPorHashDeValidacacaoNaoExpirado(String hashDeValidacacao) {
		return regeracaoDeSenhaRepository.getPorHashDeValidacacaoNaoExpirado(hashDeValidacacao);
	}
	
	@Override
	public RegeracaoSenha getEmAndamentoPorUsuario(Usuario usuario) {
		return regeracaoDeSenhaRepository.getEmAndamentoPorUsuario(usuario);
	}
	
	@Override
	public void expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario(Usuario usuario) {
		regeracaoDeSenhaRepository.expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario(usuario);
	}
	
}
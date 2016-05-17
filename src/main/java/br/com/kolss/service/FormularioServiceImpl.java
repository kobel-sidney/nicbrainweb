package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.kolss.dto.FormularioDTO;
import br.com.kolss.dto.PerguntaDTO;
import br.com.kolss.dto.RespostaAlternativaDTO;
import br.com.kolss.dto.TopicoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Formulario;
import br.com.kolss.model.entities.Pergunta;
import br.com.kolss.model.entities.RespostaAlternativa;
import br.com.kolss.model.entities.Topico;
import br.com.kolss.model.repository.FormularioRepository;

@Service
public class FormularioServiceImpl implements FormularioService {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private FormularioRepository formularioRepository;
	
	
	@Override
	public Formulario getFormulario(Serializable idFormulario)
			throws ServiceException {
		logger.debug("FormularioServiceImpl.getFormulario");
		
		if (idFormulario == null) {
			throw new ServiceException("Formulário inválido");
		}
		
		return formularioRepository.find(idFormulario);
	}

	@Override
	public boolean responderPergunta(Integer idPergunta, Integer idUsuario,
			String resposta) throws ServiceException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean cancelarPergunta(Integer idPergunta, Integer idUsuario)
			throws ServiceException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean sincronizarMobileWeb() throws ServiceException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public FormularioDTO buscarFormulario(Serializable idFormulario)
			throws ServiceException {
		
        Formulario formulario = formularioRepository.find(idFormulario);
        FormularioDTO formularioDTO = preencherFormularioDTO(formulario);
        
		return formularioDTO;
	}

	@Override
	public FormularioDTO preencherFormularioDTO(Formulario formulario)
			throws ServiceException {
		
		FormularioDTO formularioDTO = new FormularioDTO();
		//List<TopicoDTO> listaDeTopicos = new ArrayList<TopicoDTO>(formulario.getTopicos());
		
		formularioDTO.setNomeFormulario(formulario.getNome());
		formularioDTO.setIdFormulario(formulario.getId().toString());
		List<Topico> topicos = formularioRepository.listarTopicosDoFormulario(formulario.getId());
		
		formularioDTO.setListaDeTopicosDTO(preencherTopicosDoFormulario(topicos));
		
		return formularioDTO;
		
	}

	@SuppressWarnings("unused")
	@Override
	public List<TopicoDTO> preencherTopicosDoFormulario(List<Topico> topicos)
			throws ServiceException {
		
		List<TopicoDTO> listaDeTopicos = new ArrayList<TopicoDTO>();
		List<PerguntaDTO> listaDePerguntas = new ArrayList<PerguntaDTO>();
		
		for (Topico topico : topicos) {
			TopicoDTO topicoDTO = new TopicoDTO();
			
			topicoDTO.setIdTopico(topico.getId().toString());
			topicoDTO.setNome(topico.getNome());
			
//			for (Pergunta pergunta : topico.getPerguntas()) {
//				
//				PerguntaDTO perguntaDTO = new PerguntaDTO();
//				
//				perguntaDTO.setIdPergunta(pergunta.getId().toString());
//				perguntaDTO.setNome(pergunta.getDescricao());
//				perguntaDTO.setObrigatorio(pergunta.isRespostaObrigatoria());
//				perguntaDTO.setQtdVezes(pergunta.getQuantidadeVezes());
//				perguntaDTO.setRespostaMultipla(pergunta.isRespostaMultipla());
//				perguntaDTO.setTipoPontuacao(pergunta.isTipoPontuacao());
//				
//				listaDePerguntas.add(perguntaDTO);
//			}
			//topicoDTO.setListaDePerguntas(listaDePerguntas);
			listaDeTopicos.add(topicoDTO);
		}
		
		return listaDeTopicos;
	}
	
	@Override
	public List<Formulario> obterTodos() throws ServiceException {
		logger.debug("FormularioServiceImpl.getFormularios");
		
		return formularioRepository.getFormularios();
	}

	@SuppressWarnings("unused")
	@Override
	public List<PerguntaDTO> buscarPerguntas(Serializable idTopico)
			throws ServiceException {
		// TODO Auto-generated method stub
		
		List<Pergunta> listaDePerguntas = formularioRepository.listarPerguntasDoTopico(idTopico);
		List<PerguntaDTO> listaDePerguntasDTO =  new ArrayList<PerguntaDTO>();
		
		
		for (Pergunta pergunta : listaDePerguntas) {
			PerguntaDTO perguntaDTO = new PerguntaDTO();
			Set<RespostaAlternativa> listaDeRespostasAlternativas = new HashSet<RespostaAlternativa>();
			
			perguntaDTO.setIdPergunta(pergunta.getId().toString());
			perguntaDTO.setNome(pergunta.getDescricao());
			listaDeRespostasAlternativas = pergunta.getRespostasAlternativas();
			List<RespostaAlternativaDTO> listaRespostaAlternativaDTO = new ArrayList<RespostaAlternativaDTO>();
			
			for (RespostaAlternativa respostaAlternativa : listaDeRespostasAlternativas) {
				RespostaAlternativaDTO respostaAlternativaDTO = new RespostaAlternativaDTO();
				respostaAlternativaDTO.setIdRespostaAlternativa(respostaAlternativa.getId().toString());
				respostaAlternativaDTO.setDescricaoRespostaAlternativa(respostaAlternativa.getDescricao());
				listaRespostaAlternativaDTO.add(respostaAlternativaDTO);
			}
			
			perguntaDTO.setListaDeRespostasAlternativas(listaRespostaAlternativaDTO);
			
		}
		
		
		return null;
	}

	@Override
	public void salvar(Formulario formulario) {
		formularioRepository.salvar(formulario);
	}

	@Override
	public void atualizar(Formulario formulario) {
		formularioRepository.atualizar(formulario);
	}

	@Override
	public void remover(Formulario formulario) {
		formularioRepository.remover(formulario);
	}
	
}

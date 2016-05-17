package br.com.kolss.service;

import br.com.kolss.dto.PostoServicoDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.PostoServico;
import br.com.kolss.model.repository.PostoServicoRepository;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PostoServicoServiceImp implements PostoServicoService {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected UsuarioService usuarioService;

	@Autowired
	protected PostoServicoRepository postoServicoRepository;

	@Override
	public List<PostoServico> getPostoServicos(
			Serializable filtroIdTipoServico, Serializable filtroIdSetor,
			Serializable filtroIdLocal, Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("PostoServicoServiceImp.getPostoServicosPorContexto");

		return postoServicoRepository.getPostoServicos(filtroIdTipoServico,
				filtroIdSetor, filtroIdLocal,
				usuarioService.obter(idUsuarioContexto));
	}
	
	@Override
	public List<PostoServico> obterPostoServicos(Contratante contratante) {
		return postoServicoRepository.obterPostoServicos(contratante);
	}

	@Override
	public List<PostoServico> obterTodos() {
		return postoServicoRepository.obterTodos();
	}
        
        @Override
	public List<PostoServicoDTO> obterTodosDTO() {
            List<PostoServico> postos = postoServicoRepository.obterTodos();
            List<PostoServicoDTO> postosDTO = new ArrayList<>();
            
            if (postos != null) {
                for (PostoServico posto : postos) {
                    PostoServicoDTO dto = new PostoServicoDTO();
                    dto.setIdPosto(posto.getId());
                    dto.setNome(posto.getNome());
                    dto.setObservacao(posto.getObservacao());
                    dto.setLatitude(posto.getLatitude());
                    dto.setLongitude(posto.getLongitude());
                    
                    postosDTO.add(dto);
                }
            }
            
            return postosDTO;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void remover(PostoServico postoServico) {
		postoServicoRepository.remover(postoServico);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(PostoServico postoServico) {
		postoServicoRepository.salvar(postoServico);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void atualizar(PostoServico postoServico) {
		postoServicoRepository.atualizar(postoServico);
	}
	
	@Override
	public PostoServico obter(Long id) {
		return postoServicoRepository.obter(id);
	}
}

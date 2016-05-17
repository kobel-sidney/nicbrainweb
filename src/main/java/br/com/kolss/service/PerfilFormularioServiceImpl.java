package br.com.kolss.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import br.com.kolss.dto.EnvioFormularioDTO;
import br.com.kolss.dto.GrupoQuestaoDTO;
import br.com.kolss.dto.PerfilFormularioDTO;
import br.com.kolss.dto.QuestaoDTO;
import br.com.kolss.dto.RespostaDTO;
import br.com.kolss.dto.RespostaQuestaoDTO;
import br.com.kolss.dto.RetornoDTO;
import br.com.kolss.dto.SubQuestaoDTO;
import br.com.kolss.dto.SubRespostaQuestaoDTO;
import br.com.kolss.dto.TipoQuestaoDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.RelacionamentoPerfilFormularioDao;
import br.com.kolss.model.dao.SubQuestaoDao;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.RelacionamentoPerfilFormulario;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.model.entities.RespostaQuestao;
import br.com.kolss.model.entities.SubQuestao;
import br.com.kolss.model.entities.SubRespostaQuestao;
import br.com.kolss.model.enuns.TipoQuestaoEnum;
import br.com.kolss.model.repository.PerfilFormularioRepository;
import br.com.kolss.model.repository.RespostaQuestaoRepository;
import br.com.kolss.model.repository.SubRespostaQuestaoRepository;

@Service("PerfilFormularioService")
public class PerfilFormularioServiceImpl implements PerfilFormularioService {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private PerfilFormularioRepository repository;

	@Autowired
	private RelacionamentoPerfilFormularioDao relacionamentoPerfilFormularioDao;
	
    @Autowired
    private RespostaQuestaoRepository respostaQuestaoRepository;
    
    @Autowired
    private SubRespostaQuestaoRepository subRespostaQuestaoRepository;
	
	@Autowired
	private SubQuestaoDao subQuestaoDao;

	private static final SimpleDateFormat SIMPLE = new SimpleDateFormat(
			"dd/MM/yyyy");

	@Override
	public PerfilFormularioDTO obterPerfilFormulario(final Long id) {

		PerfilFormularioDTO perfilFormularioDTO = null;
		final List<RelacionamentoPerfilFormulario> listRelacionamento = relacionamentoPerfilFormularioDao
				.obterRelacionamentoPorPerfil(id);

		if (!CollectionUtils.isEmpty(listRelacionamento)) {

			Long codigoGrupo = null;
			GrupoQuestaoDTO grupoQuestao = null;

			Long codigoQuestao = null;
			QuestaoDTO questaoDto = null;

			for (RelacionamentoPerfilFormulario relacionamentoPerflFormulario : listRelacionamento) {

				if (perfilFormularioDTO == null) {
					perfilFormularioDTO = criarPerfilFormularioDTO(relacionamentoPerflFormulario
							.getPerfilFormulario());
				}

				final GrupoQuestao grupo = relacionamentoPerflFormulario
						.getGrupoQuestao();

				if (codigoGrupo == null || !grupo.getId().equals(codigoGrupo)) {

					codigoGrupo = grupo.getId();
					grupoQuestao = new GrupoQuestaoDTO();
					grupoQuestao.setId(codigoGrupo);
					grupoQuestao.setDescricao(grupo.getNome());
					grupoQuestao.setOrder(relacionamentoPerflFormulario
							.getOrdemGrupo());

					perfilFormularioDTO.getListGrupoPerguntas().add(
							grupoQuestao);
					codigoQuestao = null;
				}

				final Questao questao = relacionamentoPerflFormulario
						.getQuestao();

				if (codigoQuestao == null
						|| !questao.getId().equals(codigoQuestao)) {

					codigoQuestao = questao.getId();

					questaoDto = new QuestaoDTO();
					questaoDto.setId(codigoQuestao);
					questaoDto.setDescricao(questao.getDescricao());
					questaoDto.setOrdem(relacionamentoPerflFormulario
							.getOrdemPergunta());

					questaoDto.setTipoQuestaoDTO(criarTipoQuestao(questao));
					
					grupoQuestao.getListQuestao().add(questaoDto);
				}

				if (relacionamentoPerflFormulario.getResposta() != null) {
					questaoDto.getListResposta().add(
							criarRespostaDto(relacionamentoPerflFormulario,
									TipoQuestaoEnum.getValue(
											questaoDto.getTipoQuestaoDTO().getId().intValue())));
				}
			}
		}

		return perfilFormularioDTO;
	}

	private TipoQuestaoDTO criarTipoQuestao(final Questao questao) {
		TipoQuestaoDTO tipoQuestaoDTO = new TipoQuestaoDTO();
		tipoQuestaoDTO.setId(questao.getTipoQuestao().getId());
		tipoQuestaoDTO.setDescricao(questao.getTipoQuestao()
				.getDescricao());
		tipoQuestaoDTO.setFormatacao(questao.getTipoQuestao()
				.getFormatacao());
		return tipoQuestaoDTO;
	}
	
    /**
     * 
     * @param relacionamentoPerflFormulario
     * @return
     */
	private RespostaDTO criarRespostaDto(
			final RelacionamentoPerfilFormulario relacionamentoPerflFormulario,
			final TipoQuestaoEnum tipoQuestaoEnum) {
		
		final Resposta resposta = relacionamentoPerflFormulario.getResposta();
		final RespostaDTO respostaDTO = new RespostaDTO();

		respostaDTO.setId(resposta.getId());
		respostaDTO.setDescricao(resposta.getDescricao());
		respostaDTO.setOrdem(relacionamentoPerflFormulario.getOrdemResposta());
		
		respostaDTO.setListSubQuestao(criarSubQuestoes(tipoQuestaoEnum, relacionamentoPerflFormulario.getId()));
		return respostaDTO;
	}
	
	/**
	 * 
	 * @param tipoQuestaoEnum
	 * @param idRelacionamento
	 * @return
	 */
	private List<SubQuestaoDTO> criarSubQuestoes(final TipoQuestaoEnum tipoQuestaoEnum,
			final Long idRelacionamento){
		
		final List<SubQuestaoDTO> listSubQuestao = new ArrayList<SubQuestaoDTO>();
		
		if(TipoQuestaoEnum.TABLE.equals(tipoQuestaoEnum)){
			final List<SubQuestao> listSub = subQuestaoDao.obterSubQuestao(idRelacionamento);
			
			for (SubQuestao subQuestao : listSub) {
				final SubQuestaoDTO subQuestaoDTO = new SubQuestaoDTO();
				subQuestaoDTO.setId(subQuestao.getId());
				subQuestaoDTO.setDescricao(subQuestao.getQuestao().getDescricao());
				subQuestaoDTO.setIdQuestao(subQuestao.getQuestao().getId());
				subQuestaoDTO.setTipoQuestaoDTO(criarTipoQuestao(subQuestao.getQuestao()));;
				subQuestaoDTO.setOrdemPergunta(subQuestao.getOrdemPergunta());
				subQuestaoDTO.setOrdemResposta(subQuestao.getOrdemResposta());
				
				listSubQuestao.add(subQuestaoDTO);
			}
		}
		
		return listSubQuestao;
	}
	

	/**
	 * 
	 * @param idPerfilFormulario
	 * @return
	 */
	private PerfilFormularioDTO criarPerfilFormularioDTO(
			final PerfilFormulario perfilFormulario) {
		final PerfilFormularioDTO perfilFormularioDTO = new PerfilFormularioDTO();
		perfilFormularioDTO.setRetornoEnum(RetornoEnum.SUCESSSO);
		perfilFormularioDTO.setId(Long.valueOf(perfilFormulario.getId()
				.toString()));
		perfilFormularioDTO.setDescricao(perfilFormulario.getDescricao());
		perfilFormularioDTO.setDataCriacao(SIMPLE.format(perfilFormulario
				.getDataCriacao()));

		return perfilFormularioDTO;
	}

	public List<PerfilFormulario> obterTodos(Contratante contratante) {
		return repository.obterTodos(contratante);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void remover(PerfilFormulario perfilFormulario) {
		repository.remover(perfilFormulario);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void atualizar(PerfilFormulario perfilFormulario) {
		repository.atualizar(perfilFormulario);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void salvar(PerfilFormulario perfilFormulario) {
		repository.salvar(perfilFormulario);
	}
	
	@Override
	public PerfilFormulario find(Serializable idPerfilFormulario)
			throws ServiceException {
		logger.debug("PerfilFormularioServiceImpl.find");
		
		if (idPerfilFormulario == null) {
			throw new ServiceException("Usuário inválido!");
		}
		
		return repository.find(idPerfilFormulario);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public RetornoDTO salvarEnvioPerfilFormulario(final EnvioFormularioDTO envio) {
		
		final RetornoDTO retornoDto = new RetornoDTO();
		retornoDto.setRetornoEnum(RetornoEnum.ERRO_SALVAR_ENVIO_FORMULARIO);
		
		if(!CollectionUtils.isEmpty(envio.getListRespostaQuestao())){
			for (RespostaQuestaoDTO respostaQuestaoDTO : envio.getListRespostaQuestao()) {
				if(validaRespostaQuestao(respostaQuestaoDTO)){
					respostaQuestaoRepository.saveOrUpdate(criarRespostaQuestao(respostaQuestaoDTO));
				}
			}
		}
		
		if(!CollectionUtils.isEmpty(envio.getListSubRespostaQuestao())){
			
			for (SubRespostaQuestaoDTO subRespostaQuestaoDTO : envio.getListSubRespostaQuestao()) {
				if(validaSubRespostaQuestao(subRespostaQuestaoDTO)){
					subRespostaQuestaoRepository.saveOrUpdate(criarSubRespostaQuestao(subRespostaQuestaoDTO));
				}
			}
		}
		
		retornoDto.setRetornoEnum(RetornoEnum.SUCESSSO);
		
		return retornoDto;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public RetornoDTO salvarAssinatura(final List<RespostaQuestaoDTO> listResposta) {
		
		for (RespostaQuestaoDTO respostaQuestaoDTO : listResposta) {
			final RespostaQuestao respostaQuestao = criarRespostaQuestao(respostaQuestaoDTO);
			respostaQuestao.setAssinatura(respostaQuestaoDTO.getAssinatura());
			
			respostaQuestaoRepository.saveOrUpdate(respostaQuestao);
		}
		
		return new RetornoDTO(RetornoEnum.SUCESSSO);
	}
	
	
	/**
	 * 
	 * @param respostaQuestao
	 * @return
	 */
	private RespostaQuestao criarRespostaQuestao(final RespostaQuestaoDTO respostaQuestaoDTO){
		
		RespostaQuestao respostaQuestao = respostaQuestaoRepository.obterRespostaQuestao(respostaQuestaoDTO);
		
		if(respostaQuestao == null){
			respostaQuestao = new RespostaQuestao();
		}
		respostaQuestao.setComentario(respostaQuestaoDTO.getComentario());
		respostaQuestao.setIdAtividade(respostaQuestaoDTO.getIdAtividade());
		respostaQuestao.setIdGrupoQuestao(respostaQuestaoDTO.getIdGrupo());
		respostaQuestao.setIdPerfilFormulario(respostaQuestaoDTO.getIdPerfilFormulario());
		respostaQuestao.setIdQuestao(respostaQuestaoDTO.getIdQuestao());
		respostaQuestao.setIdResposta(respostaQuestaoDTO.getIdResposta());
		
		if(respostaQuestaoDTO.getOrdemGrupo() != null){
			respostaQuestao.setOrdemGrupo(respostaQuestaoDTO.getOrdemGrupo());
		}
		
		if(respostaQuestaoDTO.getOrdemPergunta() != null){
			respostaQuestao.setOrdemPergunta(respostaQuestaoDTO.getOrdemPergunta());
		}
		
		if(respostaQuestaoDTO.getOrdemResposta() != null){
			respostaQuestao.setOrdemResposta(respostaQuestaoDTO.getOrdemResposta());
		}
		
		return respostaQuestao;
	}
	
	/**
	 * 
	 * @param subRespostaQuestaoDTO
	 * @return
	 */
	private SubRespostaQuestao criarSubRespostaQuestao(final SubRespostaQuestaoDTO subRespostaQuestaoDTO){
		
		SubRespostaQuestao subRespostaQuestao = subRespostaQuestaoRepository.obterRespostaQuestao(subRespostaQuestaoDTO);
		
		if(subRespostaQuestao == null){
			
			subRespostaQuestao = new SubRespostaQuestao();
			
			subRespostaQuestao.setIdAtividade(subRespostaQuestaoDTO.getIdAtividade());
			subRespostaQuestao.setIdGrupoQuestao(subRespostaQuestaoDTO.getIdGrupo());
			subRespostaQuestao.setIdPerfilFormulario(subRespostaQuestaoDTO.getIdPerfil());
			subRespostaQuestao.setIdQuestao(subRespostaQuestaoDTO.getIdQuestao());
			subRespostaQuestao.setIdResposta(subRespostaQuestaoDTO.getIdResposta());
			subRespostaQuestao.setIdSubQuestao(subRespostaQuestaoDTO.getIdSubQuestao());
			subRespostaQuestao.setIdSubResposta(subRespostaQuestaoDTO.getIdSubResposta());
			subRespostaQuestao.setLinha(subRespostaQuestaoDTO.getLinha());
			subRespostaQuestao.setOrdemQuestao(subRespostaQuestao.getOrdemQuestao());
			subRespostaQuestao.setOrdemSubQuestao(subRespostaQuestao.getOrdemSubQuestao());
			subRespostaQuestao.setOrdemSubResposta(subRespostaQuestaoDTO.getOrdemSubResposta());
		}
		
		subRespostaQuestao.setComentario(subRespostaQuestaoDTO.getComentario());
		
		return subRespostaQuestao;
	}
	
	/**
	 * 
	 * @param respostaQuestaoDTO
	 * @return
	 */
	private Boolean validaRespostaQuestao(final RespostaQuestaoDTO respostaQuestaoDTO){
		return respostaQuestaoDTO.getIdAtividade() != null 
				&& respostaQuestaoDTO.getIdGrupo() != null
				&& respostaQuestaoDTO.getIdPerfilFormulario() != null
				&& respostaQuestaoDTO.getIdQuestao() != null;
	}
	
	/**
	 * 
	 * @param subRespostaQuestaoDTO
	 * @return
	 */
	private Boolean validaSubRespostaQuestao(final SubRespostaQuestaoDTO subRespostaQuestaoDTO){
		return subRespostaQuestaoDTO.getIdAtividade() != null 
				&& subRespostaQuestaoDTO.getIdGrupo() != null
				&& subRespostaQuestaoDTO.getIdPerfil() != null
				&& subRespostaQuestaoDTO.getIdQuestao() != null
				&& subRespostaQuestaoDTO.getIdResposta() != null
				&& subRespostaQuestaoDTO.getLinha() != null
				&& subRespostaQuestaoDTO.getOrdemQuestao() != null;
	}
	
}

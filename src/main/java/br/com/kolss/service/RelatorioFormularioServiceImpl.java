package br.com.kolss.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import br.com.kolss.dto.AssinaturaDTO;
import br.com.kolss.dto.GrupoQuestaoDTO;
import br.com.kolss.dto.QuestaoDTO;
import br.com.kolss.dto.RelatorioFormularioDTO;
import br.com.kolss.dto.RespostaDTO;
import br.com.kolss.dto.SubRespostaQuestaoDTO;
import br.com.kolss.model.dao.PerfilFormularioDao;
import br.com.kolss.model.entities.GrupoQuestao;
import br.com.kolss.model.entities.PerfilFormulario;
import br.com.kolss.model.entities.Questao;
import br.com.kolss.model.entities.Resposta;
import br.com.kolss.model.entities.RespostaQuestao;
import br.com.kolss.model.entities.SubRespostaQuestao;
import br.com.kolss.model.repository.GrupoQuestaoRepository;
import br.com.kolss.model.repository.QuestaoRepository;
import br.com.kolss.model.repository.RespostaQuestaoRepository;
import br.com.kolss.model.repository.RespostaRespository;
import br.com.kolss.model.repository.SubRespostaQuestaoRepository;

@Service("relatorioFormularioService")
public class RelatorioFormularioServiceImpl implements
		RelatorioFormularioService {
	
	@Autowired
	private RespostaQuestaoRepository respostaQuestaoRepository;
	
	@Autowired
	private PerfilFormularioDao perfilFormularioDao;
	
	@Autowired
	private GrupoQuestaoRepository grupoQuestaoRepository;
	
	@Autowired
	private QuestaoRepository questaoRepository;
	
	@Autowired
	private RespostaRespository respostaRespository;
	
	@Autowired
	private SubRespostaQuestaoRepository subRespostaQuestaoRepository;
	
	@Override
	public RelatorioFormularioDTO gerarRelatorio(Long idAtividade) {
		
		Assert.notNull(idAtividade, "INFORME UM ID DE UMA ATIVIDAE");
		
		final List<RespostaQuestao> listResposta = respostaQuestaoRepository.obterRespostaQuestaoPorAtividade(idAtividade);
		
		RelatorioFormularioDTO relatorioFormularioDTO = null;
		GrupoQuestaoDTO grupoQuestaoDTO = null;
		Long idGrupo = null;
		
		if(!CollectionUtils.isEmpty(listResposta)){
			for (RespostaQuestao respostaQuestao : listResposta) {
				relatorioFormularioDTO = criarRelatorio(relatorioFormularioDTO, respostaQuestao.getIdPerfilFormulario());
				
				if(!respostaQuestao.getIdGrupoQuestao().equals(idGrupo)){
					grupoQuestaoDTO = criarGrupo(respostaQuestao.getIdGrupoQuestao());
					relatorioFormularioDTO.getGrupo().add(grupoQuestaoDTO);
				}
				
				idGrupo = respostaQuestao.getIdGrupoQuestao();
				
				final QuestaoDTO questaoDTO = criarQuestaoDTO(respostaQuestao.getIdQuestao());
				grupoQuestaoDTO.getListQuestao().add(questaoDTO);
				
				questaoDTO.getListResposta().add(criarResposta(respostaQuestao));
				
				
			}
		}
		
		return relatorioFormularioDTO;
	}
	
    /**
     * 
     * @param relatorioFormularioDTO
     * @param idPerfilFormulario
     * @return
     */
	private RelatorioFormularioDTO criarRelatorio(final RelatorioFormularioDTO relatorioFormularioDTO,
			final Long idPerfilFormulario){
		
		RelatorioFormularioDTO relatorio = relatorioFormularioDTO;
		
		if(relatorio == null){
			final PerfilFormulario perfilFormulario = perfilFormularioDao.findById(idPerfilFormulario);
			relatorio = new RelatorioFormularioDTO();
			relatorio.setDescricaoFormulario(perfilFormulario.getDescricao());
		}
		
		return relatorio;
	}
	
	/**
	 * 
	 * @param idGrupoQuestao
	 * @return
	 */
	private GrupoQuestaoDTO criarGrupo(final Long idGrupoQuestao){
		final GrupoQuestao grupoQuestao = grupoQuestaoRepository.obter(idGrupoQuestao);
		GrupoQuestaoDTO grupoQuestaoDTO = null;
		
		if(grupoQuestao != null){
			grupoQuestaoDTO = new GrupoQuestaoDTO();
			grupoQuestaoDTO.setDescricao(grupoQuestao.getNome());
			grupoQuestaoDTO.setListQuestao(new ArrayList<QuestaoDTO>());
		}
		
		return grupoQuestaoDTO;
	}
	
	/**
	 * 
	 * @param idQuestao
	 * @return
	 */
	private QuestaoDTO criarQuestaoDTO(final Long idQuestao){
		final Questao questao = questaoRepository.find(idQuestao);
		QuestaoDTO questaoDTO = null;
		
		if(questao != null){
			questaoDTO = new QuestaoDTO();
			questaoDTO.setDescricao(questao.getDescricao());
			questaoDTO.setListResposta(new ArrayList<RespostaDTO>());
		}
		
		return questaoDTO;
	}
	
	/**
	 * 
	 * @param respostaQuestaoDTO
	 * @return
	 */
	private RespostaDTO criarResposta(final RespostaQuestao respostaQuestao){
		final RespostaDTO respostaDTO = new RespostaDTO();
		
		if((respostaQuestao.getIdResposta() == null 
				|| respostaQuestao.getIdResposta().equals(BigDecimal.ZERO.longValue()))
				&& StringUtils.isNotEmpty(respostaQuestao.getComentario())){
			
			respostaDTO.setDescricao(respostaQuestao.getComentario());
			
		}else if(respostaQuestao.getIdResposta() != null
				&& !respostaQuestao.getIdResposta().equals(BigDecimal.ZERO.longValue())){
			
			final Resposta resposta = respostaRespository.obter(respostaQuestao.getIdResposta());
			respostaDTO.setDescricao(resposta.getDescricao());
			
			respostaDTO.getListaSubRespostaQuestaoDTO().addAll(criarSubQuestao(respostaQuestao));
			
		}else if(respostaQuestao.getAssinatura() != null){
			respostaDTO.getListAssinatura().add(new AssinaturaDTO(respostaQuestao.getAssinatura()));
		}
		
		return respostaDTO;
	}
	
	/**
	 * 
	 * @param respostaQuestao
	 * @return
	 */
	private List<SubRespostaQuestaoDTO> criarSubQuestao(final RespostaQuestao respostaQuestao){
		final SubRespostaQuestaoDTO subRespostaQuestaoDTO = new SubRespostaQuestaoDTO();
		
		subRespostaQuestaoDTO.setIdAtividade(respostaQuestao.getIdAtividade());
		subRespostaQuestaoDTO.setIdPerfil(respostaQuestao.getIdPerfilFormulario());
		subRespostaQuestaoDTO.setIdGrupo(respostaQuestao.getIdGrupoQuestao());
		subRespostaQuestaoDTO.setIdQuestao(respostaQuestao.getIdQuestao());
		subRespostaQuestaoDTO.setIdResposta(respostaQuestao.getIdResposta());
		
		final List<SubRespostaQuestao> listSub = subRespostaQuestaoRepository.obter(subRespostaQuestaoDTO);
		final List<SubRespostaQuestaoDTO> listSubResposta = new ArrayList<SubRespostaQuestaoDTO>();
		
		if(!CollectionUtils.isEmpty(listSub)){
			for (SubRespostaQuestao subRespostaQuestao : listSub) {
				final SubRespostaQuestaoDTO subResposta = new SubRespostaQuestaoDTO();
				
				if(subRespostaQuestao.getIdSubQuestao()!= null
						&& !subRespostaQuestao.getIdSubQuestao().equals(BigDecimal.ZERO.longValue())
						&& subRespostaQuestao.getIdSubResposta()!= null
								&& !subRespostaQuestao.getIdSubResposta().equals(BigDecimal.ZERO.longValue())){
					
					subResposta.setDescricaoSubQuestao(questaoRepository.obterDescricao(
							subRespostaQuestao.getIdSubQuestao()));
					subResposta.setDescricaoSubQuestao(respostaRespository.obterDescricao(
							subRespostaQuestao.getIdSubResposta()));
				}
				
				
				if(StringUtils.isNotEmpty(subRespostaQuestao.getComentario())){
					subResposta.setComentario(subRespostaQuestao.getComentario());
				}
				
				listSubResposta.add(subResposta);
			}
		}
		
		
		return listSubResposta;
	}

	/**
	 */
	public void setRespostaQuestaoRepository(
			RespostaQuestaoRepository respostaQuestaoRepository) {
		this.respostaQuestaoRepository = respostaQuestaoRepository;
	}

	/**
	 * @param perfilFormularioDao the perfilFormularioDao to set
	 */
	public void setPerfilFormularioDao(PerfilFormularioDao perfilFormularioDao) {
		this.perfilFormularioDao = perfilFormularioDao;
	}

	/**
	 * @param grupoQuestaoRepository the grupoQuestaoRepository to set
	 */
	public void setGrupoQuestaoRepository(
			GrupoQuestaoRepository grupoQuestaoRepository) {
		this.grupoQuestaoRepository = grupoQuestaoRepository;
	}

	/**
	 * @param questaoRepository the questaoRepository to set
	 */
	public void setQuestaoRepository(QuestaoRepository questaoRepository) {
		this.questaoRepository = questaoRepository;
	}

	/**
	 * @param respostaRespository the respostaRespository to set
	 */
	public void setRespostaRespository(RespostaRespository respostaRespository) {
		this.respostaRespository = respostaRespository;
	}

	/**
	 * @param subRespostaQuestaoRepository the subRespostaQuestaoRepository to set
	 */
	public void setSubRespostaQuestaoRepository(
			SubRespostaQuestaoRepository subRespostaQuestaoRepository) {
		this.subRespostaQuestaoRepository = subRespostaQuestaoRepository;
	}
}
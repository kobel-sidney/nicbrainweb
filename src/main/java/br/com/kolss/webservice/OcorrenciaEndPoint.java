package br.com.kolss.webservice;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.kolss.dto.AtividadeOcorrenciaDTO;
import br.com.kolss.dto.ClassificacaoOcorrenciaDTO;
import br.com.kolss.dto.FalhaOcorrenciaDTO;
import br.com.kolss.dto.OcorrenciaDTO;
import br.com.kolss.dto.PendenciaOcorrenciaDTO;
import br.com.kolss.dto.RetornoAberturaOcorrenciaDTO;
import br.com.kolss.dto.RetornoClassificacaoDTO;
import br.com.kolss.dto.RetornoOcorrenciaDTO;
import br.com.kolss.dto.TipoClassificacaoOcorrenciaDTO;
import br.com.kolss.dto.UploadPhotoDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.ClassificacaoOcorrenciaService;
import br.com.kolss.service.ContratanteService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.DataUtil;
import br.com.kolss.util.HTTPStatusCodeEnum;

@Controller
@RequestMapping("/ocorrencia")
public class OcorrenciaEndPoint {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private OcorrenciaService ocorrenciaService;
	@Autowired
	private ClassificacaoOcorrenciaService classificacaoOcorrenciaService;
	@Autowired
	private ContratanteService contratanteService;
	@Autowired
	private UsuarioService usuarioService;

	@RequestMapping(value = "/listar_classificacao/{idUsuario}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody RetornoClassificacaoDTO listarClassificacao(@PathVariable String idUsuario) {

		logger.debug("OcorrenciaEndPoint.listarClassificacao(" + idUsuario + ")");

		RetornoClassificacaoDTO retornoClassificacaoDTO = new RetornoClassificacaoDTO();
		try {
			final Usuario usuario = usuarioService.obter(Long.valueOf(idUsuario));
			final Contratante contratante = contratanteService.obterPorUsuario(usuario);
			retornoClassificacaoDTO = new RetornoClassificacaoDTO(
					classificacaoOcorrenciaService.getClassificacoesOcorrenciasDTO(contratante));
		} catch (Exception ex) {
			logger.error("ERRO AO OBTER CLASSIFICACAO", ex);
		}
		return retornoClassificacaoDTO;
	}

	@RequestMapping(value = "/listar_tipo_classificacao/{idClassificacao}/{idUsuario}",	method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody ClassificacaoOcorrenciaDTO listarTiposClassificacao(@PathVariable String idClassificacao,@PathVariable String idUsuario) {
		logger.info("OcorrenciaEndPoint.listarTiposClassificacao("+idClassificacao+"/"+ idUsuario+ ")");
		final Usuario usuario = usuarioService.obter(Long.valueOf(idUsuario));
		final Contratante contratante = contratanteService.obterPorUsuario(usuario);
		final List<TipoClassificacaoOcorrenciaDTO> tipos = classificacaoOcorrenciaService.obterTipoClassificacoesOcorrenciasDTO(Long.valueOf(idClassificacao),contratante);
		final ClassificacaoOcorrenciaDTO classificacaoOcorrenciaDTO = new ClassificacaoOcorrenciaDTO();
		classificacaoOcorrenciaDTO.setListaDeTipoDeClassificacaoOcorrencia(tipos);
		return classificacaoOcorrenciaDTO;
	}

	@RequestMapping(value = "/listar/{idUsuario}/{idEvento}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody RetornoOcorrenciaDTO listaPendenciaOcorrencia(@PathVariable String idUsuario,
			@PathVariable String idEvento) {

		logger.info("PendenciaOcorrenciaEndPoint.listaPendenciaOcorrencia(" + idUsuario + "/" + idEvento + ")");
		RetornoOcorrenciaDTO retorno = new RetornoOcorrenciaDTO();

		List<Ocorrencia> lstOcorrencia = ocorrenciaService.getOcorrenciasEmAndamento(Long.valueOf(idEvento), null, null,
				null, null, null, null, null, Long.valueOf(idUsuario));

		// final Session session =
		// HibernateUtil.getSessionFactory().openSession();
		// final Transaction tx = session.beginTransaction();

		// final List<Ocorrencia> lstOcorrencia = session
		// .createCriteria(Ocorrencia.class)
		// .add(Restrictions.not(Restrictions.in("status.idStatus",
		// new Integer[] { 5 })))
		// .add(Restrictions.not(Restrictions.in("status.idStatus",
		// new Integer[] { 6 })))
		// .add(Restrictions.eq("contexto.id.idEvento",
		// Integer.valueOf(idEvento)))
		// .addOrder(Order.desc("dtInicioOcorrencia")).list();

		final List<PendenciaOcorrenciaDTO> lstPendenciaOcorrenciaREST = new ArrayList<PendenciaOcorrenciaDTO>();
		logger.info("Carregando lista de retorno...");

		for (final Ocorrencia model : lstOcorrencia) {
			PendenciaOcorrenciaDTO rest = new PendenciaOcorrenciaDTO();
			rest.setIdOcorrencia(model.getId().toString());
			rest.setNomeClassificacaoOcorrencia(model.getClassificacaoOcorrencia().getNome());
			rest.setNomeTipoClassificacao(model.getTipoClassificacao().getNome());
			rest.setNivelGravidade(model.getGravidadeOcorrencia().getNome());
			rest.setDescricao(model.getDescricaoOcorrencia());
			rest.setDtInicio(model.getDataInicio().toString());
			rest.setDescricaoStatus(model.getStatus().getNome());
			lstPendenciaOcorrenciaREST.add(rest);
		}

		logger.info("Termino da transacao, fechando sessao...");
		// tx.commit();
		// session.close();

		logger.info("Retornando lista...");
		retorno.setPendenciaOcorrenciaDTOs(lstPendenciaOcorrenciaREST);
		return retorno;
	}

	@RequestMapping(value = "/abrir", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody RetornoAberturaOcorrenciaDTO abrirOcorrencia(@RequestBody OcorrenciaDTO ocorrenciaDTO) {
		RetornoAberturaOcorrenciaDTO retornoDTO = new RetornoAberturaOcorrenciaDTO(RetornoEnum.SUCESSSO);

		try {
			logger.debug("OcorrenciaEndPoint.abrirOcorrencia");
			retornoDTO = ocorrenciaService.abrirNovaOcorrencia(ocorrenciaDTO);
		} catch (Exception ex) {
			logger.error("ERRO AO ABRIR OCORRENCIA", ex);
			retornoDTO = new RetornoAberturaOcorrenciaDTO(RetornoEnum.ERRO_NEGOCIO);

		}

		return retornoDTO;
	}

	@RequestMapping(value = "/iniciar_atividade/{idUsuario}/{idEvento}/{idAtividade}/{latitude}/{longitude}/"
			+ "{classificacaoOcorrencia}/{tipoClassificacaoOcorrencia}/{dataOcorrencia}/{descricaoOcorrencia}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody RetornoOcorrenciaDTO IniciarAtividadeOcorrencia(String idUsuario, String idEvento,
			String idAtividade, String latitude, String longitude, String classificacaoOcorrencia,
			String tipoClassificacaoOcorrencia, String dataOcorrencia, String descricaoOcorrencia) {

		return null;
	}

	@RequestMapping(value = "/concluir_atividade/{idUsuario}/{idEvento}/{idAtividade}/{latitude}/{longitude}/"
			+ "{classificacaoOcorrencia}/{tipoClassificacaoOcorrencia}/{dataOcorrencia}/{descricaoOcorrencia}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody RetornoOcorrenciaDTO ConcluirAtividadeOcorrencia(String idUsuario, String idEvento,
			String idAtividade, String latitude, String longitude, String classificacaoOcorrencia,
			String tipoClassificacaoOcorrencia, String dataOcorrencia, String descricaoOcorrencia) {

		// ocorrenciaService.concluirAtividadeOcorrencia(idAtividadeOcorrencia,
		// latitude, longitude, observacao, idUsuarioResponsavel);

		return null;
	}

	@RequestMapping(value = "/cancelar_atividade/{idUsuario}/{idEvento}/{idAtividade}/{latitude}/{longitude}/"
			+ "{classificacaoOcorrencia}/{tipoClassificacaoOcorrencia}/{dataOcorrencia}/{descricaoOcorrencia}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody RetornoOcorrenciaDTO CancelarAtividadeOcorrencia(String idUsuario, String idEvento,
			String idAtividade, String latitude, String longitude, String classificacaoOcorrencia,
			String tipoClassificacaoOcorrencia, String dataOcorrencia, String descricaoOcorrencia) {

		// ocorrenciaService.cancelarAtividadeOcorrencia(idAtividadeOcorrencia,
		// latitude, longitude, observacao, idUsuarioResponsavel)

		return null;
	}

	@RequestMapping(value = "/executar/{idAtividadeOcorrencia}/{idPessoaResponsavel}", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public RetornoOcorrenciaDTO executarAtividadeOcorrencia(@PathVariable("idAtividadeOcorrencia") String idAtividadeOcorrencia,
			@PathVariable("idPessoaResponsavel") String idPessoaResponsavel) {
		logger.debug("AtividadeOcorrenciaEndPoint.executarAtividadeOcorrencia");
		RetornoOcorrenciaDTO retornoOcorrenciaDTO = new RetornoOcorrenciaDTO();

		// @RequestMapping(value = "/abrir", method = RequestMethod.POST,
		// produces = "text/plain")
		// @ResponseBody
		// public String abrirOcorrencia(String idUsuario,
		// String idEvento, String idAtividade, String latitude,
		// String longitude, String idClassificacaoOcorrencia,
		// String idGravidadeOcorrencia, String idTipoClassificacaoOcorrencia,
		// String dataOcorrencia, String descricaoOcorrencia) {
		// logger.debug("OcorrenciaEndPoint.abrirOcorrencia");

		ocorrenciaService.concluirAtividadeOcorrencia(Long.valueOf(idAtividadeOcorrencia), null, null, null,
				Long.valueOf(idPessoaResponsavel));

		AtividadeOcorrencia ao = ocorrenciaService.getAtividadeOcorrencia(Long.valueOf(idAtividadeOcorrencia));

		List<AtividadeOcorrenciaDTO> list = this.getAtividadesOcorrencias(ao.getOcorrencia().getId());
		retornoOcorrenciaDTO.setAtividadeOcorrenciaDTOs(list);

		return retornoOcorrenciaDTO;
	}

	@RequestMapping(value = "/listar_atividade/{idOcorrencia}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody RetornoOcorrenciaDTO listaAtividadeOcorrencia(@PathVariable("idOcorrencia") String idOcorrencia) {
		logger.debug("AtividadeOcorrenciaEndPoint.listaAtividadeOcorrencia");
		RetornoOcorrenciaDTO retornoOcorrenciaDTO = new RetornoOcorrenciaDTO();
		List<AtividadeOcorrenciaDTO> list = ocorrenciaService.obterAtividadeOcorrenciaPorIdOcorrencia((Long.valueOf(idOcorrencia)));
		retornoOcorrenciaDTO.setAtividadeOcorrenciaDTOs(list);
		return retornoOcorrenciaDTO;
	}

	/**
	 * Pesquisa todas as Atividades Ocorrencias em aberto e transforma em DTO.
	 * 
	 * @param idOcorrencia
	 * @return
	 */
	private List<AtividadeOcorrenciaDTO> getAtividadesOcorrencias(Serializable idOcorrencia) {

		List<AtividadeOcorrencia> atvsOcs = ocorrenciaService.getAtividadesOcorrencias(idOcorrencia);

		List<AtividadeOcorrenciaDTO> lst = new ArrayList<AtividadeOcorrenciaDTO>();
		for (AtividadeOcorrencia atvOc : atvsOcs) {
			AtividadeOcorrenciaDTO atividadeOcorrenciaREST = new AtividadeOcorrenciaDTO(atvOc.getId().toString(),
					atvOc.getId(), DataUtil.formataData(atvOc.getDataInicio()).toString(),
					atvOc.getDataFim().toString(), atvOc.getObservacao(), atvOc.getStatus().getNome(),
					atvOc.getNumeroItem().toString() + " - " + atvOc.getNome(), atvOc.getUsuarioResponsavel().getId().toString());

			lst.add(atividadeOcorrenciaREST);
		}

		return lst;
	}

	@RequestMapping(value = "/falhar", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public RetornoOcorrenciaDTO falharAtividadeOcorrenciaMobile(@RequestBody FalhaOcorrenciaDTO falhaOcorrenciaDTO) {
		logger.debug("AtividadeOcorrenciaEndPoint.falharAtividadeOcorrencia");
		RetornoOcorrenciaDTO retornoOcorrenciaDTO = new RetornoOcorrenciaDTO();
		Long _idAtividadeOcorrencia = Long.valueOf(falhaOcorrenciaDTO.getIdAtividadeOcorrencia());
		ocorrenciaService.cancelarAtividadeOcorrencia(_idAtividadeOcorrencia, null, null, falhaOcorrenciaDTO.getComentario(),
				Long.valueOf(falhaOcorrenciaDTO.getIdPessoaResponsavel()));

		AtividadeOcorrencia ao = ocorrenciaService.getAtividadeOcorrencia(_idAtividadeOcorrencia);

		List<AtividadeOcorrenciaDTO> list = this.listaAtividadeOcorrencia(ao.getOcorrencia().getId().toString())
				.getAtividadeOcorrenciaDTOs();
		retornoOcorrenciaDTO.setAtividadeOcorrenciaDTOs(list);
		return retornoOcorrenciaDTO;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public String addImagem(@RequestBody UploadPhotoDTO uploadPhotoDTO) {
		logger.debug("OcorrenciaEndPoint.addImagem");
		Long _idOcorrencia = Long.valueOf(uploadPhotoDTO.getIdOcorrencia());
		ocorrenciaService.salvarImagem(_idOcorrencia, uploadPhotoDTO.getFotoOcorrencia());

		return HTTPStatusCodeEnum.STATUS_200.getStatusCode();
	}
	

	@RequestMapping(value = "/listar_atividade_usuario/{idUsuario}", method = RequestMethod.GET, produces = "application/json")
	public RetornoOcorrenciaDTO listarAtividadeOcorrenciaPorUsuario(@PathVariable("idUsuario") String idUsuario){
		logger.debug("OcorrenciaEndPoint.listarAtividadeOcorrenciaPorUsuario");
		List<AtividadeOcorrenciaDTO> list = ocorrenciaService.listarAtividadeOcorrenciaPorUsuario(idUsuario);
		RetornoOcorrenciaDTO retorno = new RetornoOcorrenciaDTO();
		retorno.setAtividadeOcorrenciaDTOs(list);
		return retorno;
	}

}

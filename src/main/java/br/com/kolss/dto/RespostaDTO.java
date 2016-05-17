package br.com.kolss.dto;

import java.util.ArrayList;
import java.util.List;

public class RespostaDTO {
	
	private Long id;
	private String descricao;
	private Integer ordem;
	private List<SubQuestaoDTO> listSubQuestao = new ArrayList<SubQuestaoDTO>(0);
	private byte[] assinatura;
	private List<AssinaturaDTO> listAssinatura = new ArrayList<AssinaturaDTO>(0);
	private List<SubRespostaQuestaoDTO> listaSubRespostaQuestaoDTO = new ArrayList<SubRespostaQuestaoDTO>(0);
	
	public RespostaDTO(){}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the descricao
	 */
	public String getDescricao() {
		return descricao;
	}

	/**
	 * @param descricao the descricao to set
	 */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	/**
	 * @return the ordem
	 */
	public Integer getOrdem() {
		return ordem;
	}

	/**
	 * @param ordem the ordem to set
	 */
	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}

	/**
	 * @return the listSubQuestao
	 */
	public List<SubQuestaoDTO> getListSubQuestao() {
		return listSubQuestao;
	}

	/**
	 * @param listSubQuestao the listSubQuestao to set
	 */
	public void setListSubQuestao(List<SubQuestaoDTO> listSubQuestao) {
		this.listSubQuestao = listSubQuestao;
	}

	/**
	 * @return the assinatura
	 */
	public byte[] getAssinatura() {
		return assinatura;
	}

	/**
	 * @param assinatura the assinatura to set
	 */
	public void setAssinatura(byte[] assinatura) {
		this.assinatura = assinatura;
	}

	/**
	 * @return the listAssinatura
	 */
	public List<AssinaturaDTO> getListAssinatura() {
		if(listAssinatura == null){
			listAssinatura = new ArrayList<AssinaturaDTO>();
		}
		return listAssinatura;
	}

	/**
	 * @param listAssinatura the listAssinatura to set
	 */
	public void setListAssinatura(List<AssinaturaDTO> listAssinatura) {
		this.listAssinatura = listAssinatura;
	}

	/**
	 * @return the listaSubRespostaQuestaoDTO
	 */
	public List<SubRespostaQuestaoDTO> getListaSubRespostaQuestaoDTO() {
		if(listaSubRespostaQuestaoDTO == null){
			listaSubRespostaQuestaoDTO = new ArrayList<SubRespostaQuestaoDTO>();
		}
		return listaSubRespostaQuestaoDTO;
	}

	/**
	 * @param listaSubRespostaQuestaoDTO the listaSubRespostaQuestaoDTO to set
	 */
	public void setListaSubRespostaQuestaoDTO(
			List<SubRespostaQuestaoDTO> listaSubRespostaQuestaoDTO) {
		this.listaSubRespostaQuestaoDTO = listaSubRespostaQuestaoDTO;
	}
	
}

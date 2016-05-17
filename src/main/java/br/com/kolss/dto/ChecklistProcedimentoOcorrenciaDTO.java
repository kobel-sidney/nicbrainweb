package br.com.kolss.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "checklist_procedimento_ocorrencia")
public class ChecklistProcedimentoOcorrenciaDTO {
	
	@Id
	@GeneratedValue
	private Long id;
	
	@Column(name = "IdClassificacaoOcorrencia")
	private int idClassificacaoOcorrencia;
	
	@Column(name = "IdProcedimento")
	private int idProcedimento;
	
	@Column(name = "NrItem")
	private int nrItem;
	
	
}

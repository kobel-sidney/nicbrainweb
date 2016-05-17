package br.com.kolss.model.entities;

public enum StatusEnum {

	AGENDADO(1L),
	EM_ANDAMENTO(2L),
	AGUARDANDO(3L),
	PAUSADA(4L),
	CANCELADA(5L),
	FINALIZADA(6L);
	
	private StatusEnum(Long id) {
		this.id=id;
	}
	private Long id;

	public Long getId() {
		return id;
	}
	
	
	
	public int getIdInt() {
		return Integer.parseInt(getId().toString());
	}
	
	public static StatusEnum find(final Long idStatus) {
		for(StatusEnum StatusEnum :values()){
			if(StatusEnum.getId().equals(idStatus)){
				return StatusEnum;
			}
		}
		return null;
	}
	
	public static boolean contains(final Long id) {
		for(StatusEnum StatusEnum :values()){
			if(StatusEnum.getId().equals(id)){
				return true;
			}
		}
		return false;
	}

	
	 
}
package br.com.kolss.service.regras;

import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Local;
import br.com.kolss.util.SinalizadorCorEnum;


public interface SinalizadorCorService {

	/**
	 * Retorna a cor de sinalização para uma Atividade.
	 * 
	 * @param atividade
	 * 
	 * @return
	 */
	public SinalizadorCorEnum getSinalizadorCor(Atividade atividade);
	
	/**
	 * Retorna a cor de sinalização para um Checklist.
	 * 
	 * @param checklist
	 * 
	 * @return
	 */
	public SinalizadorCorEnum getSinalizadorCor(Checklist checklist);
	
	/**
	 * Retorna a cor de sinalização para um Local.
	 * 
	 * @param local
	 * 
	 * @return
	 */
	public SinalizadorCorEnum getSinalizadorCor(Local local);
	
}

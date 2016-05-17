package br.com.kolss.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.util.FacesUtil;

@Controller
@Scope("request")
public class MensagensRonda {

	public void notificarRotaVazia() {
		FacesUtil.addErrorMessage("Nenhum ponto encontrado para essa rota.");
	}
	
	public void notificarDatasObrigatorias() {
		FacesUtil.addErrorMessage("As datas de inicio e fim são obrigatórias.");
	}
	
	public void notificarDataInconforme() {
		FacesUtil.addErrorMessage("A data de inicio não pode ser maior que a data de fim.");
	}
}

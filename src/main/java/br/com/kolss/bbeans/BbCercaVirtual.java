package br.com.kolss.bbeans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.faces.model.SelectItem;
import javax.faces.model.SelectItemGroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;

import br.com.kolss.dto.CoordenadaDTO;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.CoordenadaGeografica;
import br.com.kolss.model.entities.Local;
import br.com.kolss.service.LocalService;

@Controller(value = "bbCercaVirtual")
@Scope("request")
public class BbCercaVirtual {

	@Autowired
	protected LocalService localService;
	
	@Autowired
	protected BbUsuarioLogado bbUsuarioLogado;
	
	public List<SelectItem> getCercasVirtuais() {
		List<SelectItem> cercas = new ArrayList<>();
		List<Local> locais = localService.getLocaisRonda(bbUsuarioLogado.getUserSession().getId());
		SelectItem[] itens = new SelectItem[0];
		if (locais != null) {
			for (Local local : locais) {
				SelectItemGroup itemGroup = new SelectItemGroup(local.getNome());
				
				for (CercaVirtual cercaVirtual : local.getCercaVirtual()) {
					itens = Arrays.copyOf(itens, itens.length+1);
					CoordenadaGeografica coord = cercaVirtual.getCoordenadas().get(0).getCoordenada();
					CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
					coordenadaDTO.setLatitude(coord.getLatitude());
					coordenadaDTO.setLongitude(coord.getLongitude());
					
					String valor = new Gson().toJson(coordenadaDTO);
					itens[itens.length-1] = new SelectItem(valor , cercaVirtual.getDescricao());
				}
				
				itemGroup.setSelectItems(itens);
				cercas.add(itemGroup);
			}
		}
		
		return cercas;
	}
}

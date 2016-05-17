package br.com.kolss.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.RetornoRondaDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.service.RondaService;

/**
 *
 * @author weverton
 */
@Controller
@RequestMapping(value = "/rondaDetalhada")
public class RondaDetalhadaController {

    @Autowired
    private RondaService rondaService;
    
    protected Logger logger = Logger.getLogger(getClass());
    
    @RequestMapping(value = "/obterPontos",method = RequestMethod.POST,produces = "application/json")
    public @ResponseBody RetornoRondaDTO obterPontos(@RequestBody final FiltroRonda filtroRonda) throws ParseException{

    	final SimpleDateFormat dateFormatPrimario = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        
        
        Date dataInicio = dateFormatPrimario.parse(filtroRonda.getInicio());
        Date dataFim = null;
        if (filtroRonda.getFim().equals("")) {
			Calendar c = Calendar.getInstance();
			c.setTime(dataInicio);
			c.add(Calendar.HOUR, 24);
			dataFim = c.getTime();
		} else {
			dataFim = dateFormatPrimario.parse(filtroRonda.getFim());
		}
        
        filtroRonda.setInicio(dateFormat.format(dataInicio));
        filtroRonda.setFim(dateFormat.format(dataFim));
        
        Long maxResult = (((dataFim.getTime() - dataInicio.getTime()) / 1000) / 10); 
        if (maxResult == 0) {
			maxResult = 1L;
		}
   
        filtroRonda.setMaxResult(maxResult.intValue());

        Gson gson = new Gson();
        RetornoRondaDTO retornoRondaDTO = gson.fromJson(rondaService.obterRondas(filtroRonda), RetornoRondaDTO.class);
        
        if(retornoRondaDTO != null){
            Collections.sort(retornoRondaDTO.getListRonda(), new Comparator<RondaDTO>() {

                @Override
                public int compare(RondaDTO o1, RondaDTO o2) {
                    return o1.getDate().compareTo(o2.getDate());
                }
            });
        }
        
        logger.debug("RondaDetalhadaController.obterPontos " + gson.toJson(filtroRonda));
        
        return retornoRondaDTO;
    }
}

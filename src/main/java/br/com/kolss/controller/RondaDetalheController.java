package br.com.kolss.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import br.com.kolss.model.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.RetornoRondaDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.service.LocalService;
import br.com.kolss.service.RondaService;
import br.com.kolss.service.SetorService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.service.VeiculoService;
import br.com.kolss.view.SelectHtml;
import br.com.kolss.view.SelectOptionHtml;

@Controller
@RequestMapping("/ronda/detalhe")
public class RondaDetalheController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private LocalService localService;

    @Autowired
    private VeiculoService veiculoService;

    @Autowired
    private SetorService setorService;

    @Autowired
    private RondaService rondaService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView form() {
    	String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Usuario usuario = usuarioService.getUsuarioPorEmail(username);

        List<Ronda> rondas = rondaService.obterEmAndamento(usuario);
        SelectHtml selectRondas = montarSelectRondas(rondas);

        ModelAndView mv = new ModelAndView("mapa-detalhe");
        mv.addObject("selectRondas", selectRondas);
        mv.addObject("userName", usuario.getNome());
        return mv;
    }

    @RequestMapping(value = "/coordenadas", method = RequestMethod.POST, produces = "application/json")
    public @ResponseBody
    RetornoRondaDTO obterPontos(@RequestBody final FiltroRonda filtroRonda) throws ParseException {

        Ronda rondaEmAndamento = rondaService.obterEmAndamento(filtroRonda.getIdRonda());
        filtroRonda.setIdUsuario(rondaEmAndamento.getResponsavelRonda().getId().intValue());
        filtroRonda.setIdVeiculo(rondaEmAndamento.getVeiculo().getId().intValue());
        filtroRonda.setIdSetor(rondaEmAndamento.getSetor().getId().intValue());
        filtroRonda.setIdLocal(rondaEmAndamento.getLocal().getId().intValue());

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

        if (retornoRondaDTO != null) {
            Collections.sort(retornoRondaDTO.getListRonda(), new Comparator<RondaDTO>() {

                @Override
                public int compare(RondaDTO o1, RondaDTO o2) {
                    return o1.getDate().compareTo(o2.getDate());
                }
            });
        }

        if (retornoRondaDTO.getListRonda().isEmpty()) {
            retornoRondaDTO.setRetornoEnum(RetornoEnum.VAZIO);
        }

        return retornoRondaDTO;
    }

    private SelectHtml montarSelectRondas(List<Ronda> rondas) {
        SelectHtml selectRondas = new SelectHtml();

        if (rondas != null) {
            Set<SelectOptionHtml> options = new HashSet<>(0);
            for (Ronda rondaDaLista : rondas) {
                SelectOptionHtml option = new SelectOptionHtml();
                option.setLabel(rondaDaLista.getDescricao());
                option.setValue(rondaDaLista.getId().toString());
                option.setSubText(rondaDaLista.getResponsavelRonda().getNome());

                options.add(option);
            }
            selectRondas.setOptions(options);
        }
        return selectRondas;
    }
}

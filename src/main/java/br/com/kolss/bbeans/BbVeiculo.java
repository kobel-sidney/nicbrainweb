package br.com.kolss.bbeans;

import java.util.List;

import com.sun.org.apache.bcel.internal.classfile.PMGClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.service.VeiculoService;

@Controller(value = "bbVeiculo")
@Scope("request")
public class BbVeiculo {

    @Autowired
    protected BbUsuarioLogado bbUsuarioLogado;

    @Autowired
    private VeiculoService veiculoService;

    public List<Veiculo> getVeiculosPorContratante() {

        return veiculoService.obterTodos(bbUsuarioLogado.obterContratanteUsuarioLogado());
    }

    public List<Veiculo> getVeiculosPorCliente() {
        return veiculoService.obterPorCliente(bbUsuarioLogado.getUserSession().getCliente());
    }
}

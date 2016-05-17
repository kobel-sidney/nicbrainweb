package br.com.kolss.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;

import org.primefaces.event.SelectEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import br.com.kolss.bbeans.BbUsuarioLogado;
import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Departamento;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Turno;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.service.FuncionarioService;
import br.com.kolss.service.UsuarioService;
import br.com.kolss.util.FacesUtil;

/**
 * @author weverton
 *
 */
@Controller(value = "funcionarioBean")
@Scope("session")
public class FuncionarioController {

	private List<Funcionario> funcionarios;
	private Funcionario funcionarioSuperior;
	private Funcionario funcionario;
	private Usuario usuario;
	private Turno turno;
	private Cargo cargo;
	private Departamento departamento;

	@Autowired
	private FuncionarioService funcionarioService;

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private BbUsuarioLogado usuarioLogado;

	@PostConstruct
	public void init() {
		this.funcionarioSuperior = new Funcionario();
		this.funcionario = new Funcionario();
		this.usuario = new Usuario();
		this.turno = new Turno();
		this.cargo = new Cargo();
		this.departamento = new Departamento();
	}


	public void salvarOuAtualizar() {
		try {
			funcionario.setUsuario(usuario);
			funcionario.setTurno(turno);
			funcionario.setCargo(cargo);
			funcionario.setDepartamento(departamento);
			funcionario.setFuncionarioSuperior(funcionarioSuperior);
			funcionarioService.salvarOuAtualizar(funcionario);
		} catch (Exception e) {
			FacesUtil.addErrorMessage("Não foi possível salvar ou atualizar: " + e.getMessage());
		}
		irParaLista();
	}

	public void excluir() {
		try {
			funcionarioService.excluir(funcionario);
		} catch (Exception e) {
			FacesUtil.addErrorMessage("Não foi possível excluir: " + e.getMessage());
		}
	}

	public void cancelar() {
		irParaLista();
	}

	public void criarNovo() {
		limparCampos();

		irParaCadastro();
	}

	private void irParaCadastro() {
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/Funcionario.nicbrain?faces-redirect=true");
	}

	private void irParaLista() {
		limparCampos();
		FacesContext fc = FacesContext.getCurrentInstance();
		NavigationHandler nh = fc.getApplication().getNavigationHandler();
		nh.handleNavigation(fc, null, "/restrict/ListaFuncionario.nicbrain?faces-redirect=true");
	}

	private void limparCampos() {
		this.funcionarioSuperior = new Funcionario();
		this.funcionario = new Funcionario();
		this.usuario = new Usuario();
		this.turno = new Turno();
		this.cargo = new Cargo();
		this.departamento = new Departamento();
	}

	public boolean isCampoAtivoHabilitado() {
		return !funcionario.isNew();
	}

	public void rowSelect(SelectEvent event) {
		this.funcionario = (Funcionario) event.getObject();
		funcionario = funcionarioService.find(funcionario.getId());
		this.usuario = funcionario.getUsuario();
		if (funcionario.getTurno() != null) {
			this.turno = funcionario.getTurno();
		}
		this.cargo = funcionario.getCargo();
		this.departamento = funcionario.getDepartamento();
		if (funcionario.getFuncionarioSuperior() != null) {
			this.funcionarioSuperior = funcionario.getFuncionarioSuperior();
		}
		irParaCadastro();
	}

	public List<Funcionario> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<Funcionario> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public Funcionario getFuncionarioSuperior() {
		return funcionarioSuperior;
	}

	public void setFuncionarioSuperior(Funcionario funcionario) {
		this.funcionarioSuperior = funcionario;
	}

	public Funcionario getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Turno getTurno() {
		return turno;
	}

	public void setTurno(Turno turno) {
		this.turno = turno;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

}

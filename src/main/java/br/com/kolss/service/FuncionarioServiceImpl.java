package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.DaoException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.FuncionarioDao;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Cargo;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Departamento;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Turno;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.FuncionarioRepository;

@Service
@Transactional(readOnly = true)
public class FuncionarioServiceImpl implements FuncionarioService {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private FuncionarioDao funcionarioDao;

	@Autowired
	private FuncionarioRepository funcionarioRepository;

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private TurnoService turnoService;
	
	@Autowired
	private CargoService cargoService;
	
	@Autowired
	private DepartamentoService departamentoService;
	

	@Override
	public Funcionario find(Long idFuncionario) throws ServiceException {
		logger.debug("FuncionarioServiceImpl.find()");

		return funcionarioRepository.buscar(idFuncionario);
	}

	@Override
	public List<Funcionario> getFuncionariosResponsaveisPorChecklist(
			Usuario usuario) {

		return funcionarioRepository
				.getFuncionariosResponsaveisPorChecklist(usuario);

	}

	@Override
	public List<Funcionario> getFuncionariosResponsaveisPorAtividade(
			Usuario usuario) {

		return funcionarioRepository
				.getFuncionariosResponsaveisPorAtividade(usuario);
	}

	@Override
	public List<Funcionario> getFuncionariosSubordinados(
			Integer idFuncionarioSuperior) throws DaoException {
		return funcionarioDao
				.listarFuncionarioSubordinados(idFuncionarioSuperior);
	}

	@Override
	public List<Funcionario> getFuncionariosPorContratante(Long idContratante)
			throws DaoException {
		return funcionarioDao.listarFuncionariosPorContratante(idContratante);
	}

	@Override
	public Funcionario getFuncionario(Usuario usuario) throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getFuncionario");

		if (usuario == null || usuario.getId() == null) {
			throw new ServiceException("Usuário inválido");
		}

		return funcionarioRepository.find(usuario);
	}

	/**
	 * Obtém o Funcionário Superior Responsável pela Atividade.
	 *
	 * @param idAtividade
	 *
	 * @return
	 */
	public Funcionario getResponsavelSuperiorPorAtividade(
			Serializable idAtividade) throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getResponsavelSuperiorPorAtividade");

		if (idAtividade == null) {
			throw new ServiceException("Atividade inválida!");
		}

		return funcionarioRepository.getResponsavelPorAtividade(idAtividade);
	}

	/**
	 * Obtém o Funcionário Superior Responsável pelo Checklist.
	 *
	 * @param idChecklist
	 *
	 * @return
	 */
	public Funcionario getResponsavelSuperiorPorChecklist(
			Serializable idChecklist) throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getResponsavelSuperiorPorChecklist");

		if (idChecklist == null) {
			throw new ServiceException("Checklist inválido!");
		}

		return funcionarioRepository.getResponsavelPorChecklist(idChecklist);
	}

	@Override
	public Funcionario getFuncionarioSuperior(Ocorrencia ocorrencia)
			throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getFuncionarioSuperior(Ocorrencia)");

		if (ocorrencia == null || ocorrencia.getId() == null) {
			throw new ServiceException("Ocorrencia inválida");
		}

		return funcionarioRepository.getFuncionarioSuperior(ocorrencia.getId(),
				Ocorrencia.class);
	}

	@Override
	public Funcionario getFuncionarioSuperior(Checklist checklist)
			throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getFuncionarioSuperior(Checklist)");

		if (checklist == null || checklist.getId() == null) {
			throw new ServiceException("Checklist inválido");
		}

		return funcionarioRepository.getFuncionarioSuperior(checklist.getId(),
				Checklist.class);
	}

	@Override
	public Funcionario getFuncionarioSuperior(Atividade atividade)
			throws ServiceException {
		logger.debug("FuncionarioServiceImpl.getFuncionarioSupeFuncionarioServiceImplrior(Atividade)");

		if (atividade == null || atividade.getId() == null) {
			throw new ServiceException("Atividade inválida");
		}

		return funcionarioRepository.getFuncionarioSuperior(atividade.getId(),
				Atividade.class);
	}

	@Override
	public List<String> getPorEvento(Usuario usuario) {

		return funcionarioRepository.getPorEvento(usuario);
	}

	/*
	 * Lista todos funcionários ativos
	 *
	 * @see br.com.kolss.service.FuncionarioService#listarTodos()
	 */
	@Override
	public List<Funcionario> listarTodosFuncionarios() {

		return funcionarioRepository.listarTodosFuncionarios();
	}

	/*
	 * Salva ou atualiza funcionário
	 *
	 * @see
	 * br.com.kolss.service.FuncionarioService#salvarOuAtualizar(br.com.kolss
	 * .model.entities.Funcionario)
	 *
	 * @param funcionario
	 */
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarOuAtualizar(Funcionario funcionario)	throws ServiceException {
		
		if (funcionario == null) {
			throw new ServiceException("Funcionário inválido");
		}

		Usuario usuario = usuarioService.obter(funcionario.getUsuario().getId());
		Turno turno = turnoService.obter(funcionario.getTurno().getId());
		Cargo cargo = cargoService.obter(funcionario.getCargo().getId());
		Departamento departamento = departamentoService.obter(funcionario.getDepartamento().getId(),usuario.getCliente().getContratante());
		Funcionario funcionarioSuperior = funcionarioRepository.buscar(funcionario.getFuncionarioSuperior().getId());

		Funcionario func = new Funcionario();
		if (!funcionario.isNew()) {
			func = funcionarioRepository.buscar(funcionario.getId());
			func.setAtivo(funcionario.getAtivo());
		} else {
			func.setAtivo(true);
		}

		if (usuario != null && !usuario.isNew()) {
			func.setUsuario(usuario);
		} else {
			func.setUsuario(null);
		}

		if (turno != null && !turno.isNew()) {
			func.setTurno(turno);
		} else  {
			func.setTurno(null);
		}

		if (cargo != null && !cargo.isNew()) {
			func.setCargo(cargo);
		} else {
			func.setCargo(null);
		}

		if (departamento != null && !departamento.isNew()) {
			func.setDepartamento(departamento);
		} else {
			func.setDepartamento(null);
		}

		if (funcionarioSuperior != null && !funcionarioSuperior.isNew()) {
			func.setFuncionarioSuperior(funcionarioSuperior);
		} else {
			func.setFuncionarioSuperior(null);
		}

		funcionarioRepository.salvarOuAtualizar(func);
	}

	/**
	 * Exclusão lógica de funcionario
	 *
	 * @param funcionario
	 * @throws ServiceException
	 */
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(Funcionario funcionario) throws ServiceException {
		if (funcionario == null) {
			throw new ServiceException("Funcionário inválido");
		}

		funcionarioRepository.excluir(funcionario);
	}

	@Override
	public List<Funcionario> getFuncionarios() {
		return funcionarioRepository.getFuncionarios();
	}

}

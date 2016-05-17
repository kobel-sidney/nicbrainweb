package br.com.kolss.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.EventoDTO;
import br.com.kolss.dto.LocalDTO;
import br.com.kolss.dto.RetornoAlterarSenhaDTO;
import br.com.kolss.dto.UsuarioDTO;
import br.com.kolss.enums.RetornoEnum;
import br.com.kolss.exception.DaoException;
import br.com.kolss.exception.LoginException;
import br.com.kolss.exception.SenhaDoUsuarioInvalidaException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.exception.UsuarioNaoEstaAtivoException;
import br.com.kolss.exception.UsuarioNaoExisteException;
import br.com.kolss.model.dao.UsuarioDao;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Perfil;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Regra;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.entities.TipoUsuario;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.enuns.RegeracaoSenhaStatusEnum;
import br.com.kolss.model.repository.ClienteRepository;
import br.com.kolss.model.repository.PerfilRepository;
import br.com.kolss.model.repository.PessoaRepository;
import br.com.kolss.model.repository.RegraRepository;
import br.com.kolss.model.repository.TipoUsuarioRepository;
import br.com.kolss.model.repository.UsuarioRepository;
import br.com.kolss.util.NicBrainUtil;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

	private Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private UsuarioDao usuarioDao;

	@Autowired
	private UsuarioRepository usuarioRepository;

	@Autowired
	private PerfilRepository perfilRepository;

	@Autowired
	private TipoUsuarioRepository tipoUsuarioRepository;

	@Autowired
	private PessoaRepository pessoaRepository;

	@Autowired
	private ClienteRepository clienteRepository;

	@Autowired
	private RegraRepository regraRepository;

	@Autowired
	private RegeracaoSenhaService regeracaoSenhaService;

	@Autowired
	private EventoService eventoService;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public UsuarioDTO getUsuarioDTO(final String userID, final String password)
			throws ServiceException, LoginException {

		logger.info("UsuarioServiceImpl.getUsuario");

		UsuarioDTO usuarioDTO = null;
		Usuario usuario = null;

		try {

			usuario = obterUsuarioValido(userID, password);
			usuarioDTO = criarUsuarioDto(usuario);

		} catch (Exception e) {

			usuarioDTO = new UsuarioDTO();
			usuarioDTO.setRetornoEnum(RetornoEnum.ERRO_OBTER_USUARIO);
			throw e;

		}

		return usuarioDTO;
	}

	/**
	 * 
	 * @param userID
	 * @param password
	 * @return
	 * @throws DaoException
	 * @throws LoginException
	 */
	private Usuario obterUsuarioValido(final String userID, final String password) throws DaoException, LoginException {
		Usuario usuario = null;

		if (userID.contains("@")) {
			usuario = usuarioDao.obterUsuarioPorEmail(userID);
		} else {
			usuario = usuarioDao.obterUsuarioPorNome(userID);
		}

		return validarUsuario(usuario, password);
	}

	/**
	 * 
	 * @param usuario
	 * @param password
	 * @return
	 * @throws DaoException
	 * @throws LoginException
	 */
	private Usuario validarUsuario(final Usuario usuario, final String password) throws DaoException, LoginException {
		if (usuario == null) {
			throw new UsuarioNaoExisteException();
		} else if (!usuario.isAtivo()) {
			throw new UsuarioNaoEstaAtivoException();
		} else if (!usuario.getSenha().equals(NicBrainUtil.criptografarSenha(password))) {
			throw new SenhaDoUsuarioInvalidaException();
		}

		return usuario;
	}

	/**
	 * 
	 * @param usuario
	 * @return
	 */
	private UsuarioDTO criarUsuarioDto(final Usuario usuario) {
		UsuarioDTO usuarioDTO;
		usuarioDTO = new UsuarioDTO();

		if (usuario != null) {

			usuarioDTO.setIdPessoa(usuario.getId());
			usuarioDTO.setIdPerfil(usuario.getPerfil().getId());
			usuarioDTO.setIdCliente(usuario.getCliente().getId());

			EventoDTO eventoDTO = null;
			LocalDTO localDTO = null;

			final List<EventoDTO> lstEventoDTO = new ArrayList<EventoDTO>();

			Set<Evento> eventosUsuario = usuario.getEventosUsuario();

			for (Evento evento : eventosUsuario) {

				if (evento.isAtivo()) {

					eventoDTO = new EventoDTO();
					localDTO = new LocalDTO();
					eventoDTO.setIdEvento(evento.getId().toString());
					eventoDTO.setNomeEvento(evento.getNome());
					eventoDTO.setDataInicioPrevisto(evento.getDataInicio().getTime());

					localDTO.setIdLocal(evento.getLocal().getId().toString());
					localDTO.setNomeLocal(evento.getLocal().getNome());
					eventoDTO.setLocalDTO(localDTO);
					lstEventoDTO.add(eventoDTO);
				}

			}

			usuarioDTO.setLstEventoDTO(lstEventoDTO);

		}
		return usuarioDTO;
	}

	@Override
	public void removerAssociacaoDevice(String idRegistro, String idProjeto, Long idPessoa) throws ServiceException {

		logger.debug("UsuarioServiceImpl.removerAssociacaoDevice");

		if (idPessoa != null && !idPessoa.equals(0l)) {
			usuarioRepository.removerAssociacaoDevice(idRegistro, idPessoa);
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void associarDevice(String idRegistro, String idProjeto, Long idPessoa) throws ServiceException {
		logger.debug("UsuarioServiceImpl.associarDevice");

		Usuario usuario = usuarioRepository.find(idPessoa);
		usuarioRepository.associarDevice(idRegistro, idProjeto, usuario);
	}

	@Override
	public void salvar(Usuario usuario) throws ServiceException {
		usuarioRepository.salvar(usuario);
	}

	@Override
	public void atualizar(Usuario usuario) throws ServiceException {
		usuarioRepository.atualizar(usuario);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarOuAtualizar(UsuarioDTO usuarioDTO) throws ServiceException {
		if (usuarioDTO == null) {
			throw new ServiceException("Usuário inválido.");
		}

		Usuario usuario = null;
		if (usuarioDTO.getIdUsuario() == null) {
			usuario = new Usuario();
			usuario.setTentativasLogin(0);
		} else {
			usuario = usuarioRepository.find(usuarioDTO.getIdUsuario());
		}

		Perfil perfil = perfilRepository.find(usuarioDTO.getIdPerfil());
		TipoUsuario tipoUsuario = tipoUsuarioRepository.find(usuarioDTO.getIdTipoUsuario());
		Pessoa pessoa = pessoaRepository.obter(usuarioDTO.getIdPessoa());
		Cliente cliente = clienteRepository.find(usuarioDTO.getIdCliente());

		usuario.setId(usuarioDTO.getIdUsuario());
		usuario.setNome(usuarioDTO.getNome());
		usuario.setSenha(usuarioDTO.getSenha());
		usuario.setEmail(usuarioDTO.getEmail());
		usuario.setBloqueado(usuarioDTO.isBloqueado());
		usuario.setDataValidadeConta(usuarioDTO.getDataValidadeConta());
		usuario.setDataValidadeSenha(usuarioDTO.getDataValidadeSenha());
		usuario.setPerfil(perfil);
		usuario.setTipoUsuario(tipoUsuario);
		usuario.setPessoa(pessoa);
		usuario.setCliente(cliente);
		usuario.setAtivo(usuarioDTO.isAtivo());

		Set<Regra> regras = new HashSet<>(0);
		List<Regra> regrasDTO = usuarioDTO.getRegras();

		if (regrasDTO != null)
			for (Regra regra : regrasDTO) {
				Regra r = regraRepository.obterRegras(regra.getId());
				if (r != null) {
					regras.add(r);
				}
			}

		usuario.setRegras(regras);

		Set<Evento> eventos = new HashSet<>(0);
		List<EventoDTO> eventosDTO = usuarioDTO.getLstEventoDTO();

		if (regrasDTO != null)
			for (EventoDTO evento : eventosDTO) {
				Evento e = eventoService.obter(Long.valueOf(evento.getIdEvento()));
				if (e != null) {
					eventos.add(e);
				}
			}

		usuario.setEventosUsuario(eventos);

		if (usuario.isNew()) {
			usuario.setDataCadastro(new Date());
			usuario.setAtivo(true);
			usuarioRepository.salvar(usuario);
		} else {
			usuarioRepository.atualizar(usuario);
		}
	}

	@Override
	public Usuario obter(Serializable idUsuario) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuario");

		return usuarioRepository.find(idUsuario);
	}

	@Override
	public List<Usuario> getUsuariosPorContexto(Long idUsuario) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuariosPorContexto");

		return usuarioRepository.getUsuariosPorContexto(idUsuario);
	}

	@Override
	public List<Usuario> getUsuariosSuperioresPorContexto(Serializable idUsuario) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuariosSuperioresPorContexto");

		return usuarioRepository.getUsuariosSuperioresPorContexto(idUsuario);
	}

	@Override
	public List<Usuario> getUsuariosAtivos() throws ServiceException {
		return usuarioRepository.getUsuariosAtivos();
	}

	@Override
	public List<UsuarioDTO> listarUsuariosDTO(Contratante contratante) throws ServiceException {

		List<Usuario> usuarios = usuarioRepository.obterTodos(contratante);
		List<UsuarioDTO> usuarioDTOs = new ArrayList<>();

		if (!usuarios.isEmpty()) {
			for (Usuario usuario : usuarios) {
				UsuarioDTO usuarioDTO = new UsuarioDTO();
				usuarioDTO.setIdUsuario(usuario.getId());
				usuarioDTO.setNome(usuario.getNome());
				usuarioDTO.setSenha(usuario.getSenha());
				usuarioDTO.setEmail(usuario.getEmail());
				usuarioDTO.setBloqueado(usuario.isBloqueado());
				usuarioDTO.setDataValidadeConta(usuario.getDataValidadeConta());
				usuarioDTO.setDataValidadeSenha(usuario.getDataValidadeSenha());
				usuarioDTO.setIdPerfil(usuario.getPerfil().getId());
				usuarioDTO.setIdTipoUsuario(usuario.getTipoUsuario().getId());
				usuarioDTO.setIdPessoa(usuario.getPessoa().getId());
				usuarioDTO.setIdCliente(usuario.getCliente().getId());
				usuarioDTO.setNomeCliente(usuario.getCliente().getNomeFantasia());
				usuarioDTO.getRegras().addAll(usuario.getRegras());

				List<EventoDTO> eventoDTOs = new ArrayList<>();
				for (Evento evento : usuario.getEventosUsuario()) {
					EventoDTO dto = new EventoDTO();
					dto.setIdEvento(evento.getId().toString());
					dto.setNomeEvento(evento.getNome());
					eventoDTOs.add(dto);
				}

				usuarioDTO.getLstEventoDTO().addAll(eventoDTOs);
				usuarioDTO.setAtivo(usuario.isAtivo());
				usuarioDTOs.add(usuarioDTO);
			}
		}
		return usuarioDTOs;
	}

	@Override
	public List<Usuario> getUsuariosAtivosPorNome(String nome) throws ServiceException {
		return usuarioRepository.getUsuariosAtivosPorNome(nome);
	}

	@Override
	public Usuario getUsuarioPorEmail(String emailDoUsuario) {
		return usuarioRepository.getUsuarioPorEmail(emailDoUsuario);
	}

	@Override
	public Usuario getUsuarioPorPessoa(Pessoa pessoa) throws ServiceException {
		return usuarioRepository.getUsuarioPorPessoa(pessoa);
	}

	@Override
	public List<Usuario> getUsuariosPorEventosPorContexto(Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuariosPorEventosPorContexto");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Contexto inválido!");
		}

		return usuarioRepository.getUsuariosResponsavelPorEventos(idUsuarioContexto);
	}

	@Override
	public List<Usuario> getUsuariosPorChecklistsPorContexto(Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuariosPorChecklistsPorContexto");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Contexto inválido!");
		}

		return usuarioRepository.getUsuariosResponsavelPorChecklists(idUsuarioContexto);
	}

	@Override
	public List<Usuario> getUsuariosPorAtividadesPorContexto(Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("UsuarioServiceImpl.getUsuariosPorAtividadesPorContexto");

		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário Contexto inválido!");
		}

		return usuarioRepository.getUsuariosResponsavelPorAtividades(idUsuarioContexto);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public RetornoAlterarSenhaDTO alterarSenhaMobile(String idUsuario, String senhaUsuario,String novaSenha, String confirmaNovaSenha) throws LoginException{
	
		RetornoAlterarSenhaDTO retornoAlterarSenhaDTO = new RetornoAlterarSenhaDTO();
		retornoAlterarSenhaDTO.setMensagem("Falha ao alterar senha");
		Usuario usuario = obterUsuarioValido(idUsuario, senhaUsuario);
		
		if (!novaSenha.equals(confirmaNovaSenha)) {
			throw new SenhaDoUsuarioInvalidaException();
		}

		usuario.setSenha(NicBrainUtil.criptografarSenha(novaSenha));
		usuario.setDataUltimoLogin(new Date());
		usuarioRepository.atualizar(usuario);
		RegeracaoSenha regeracaoSenha = regeracaoSenhaService.getEmAndamentoPorUsuario(usuario);
		retornoAlterarSenhaDTO.setMensagem("Sucesso");

		if (regeracaoSenha != null) {
			regeracaoSenha.setDataEncerramento(new Date());
			regeracaoSenha.setStatus(RegeracaoSenhaStatusEnum.CONCLUIDO);
			regeracaoSenhaService.salvar(regeracaoSenha);
		}

		return retornoAlterarSenhaDTO;	
	

	}

	/**
	 * Exclusão lógica de usuario
	 */
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(UsuarioDTO usuarioDTO) throws ServiceException {
		if (usuarioDTO == null) {
			throw new ServiceException("Usuário inválido.");
		}

		Usuario usuario = usuarioRepository.find(usuarioDTO.getIdUsuario());
		if (usuario == null) {
			throw new ServiceException("Erro ao buscar usuário para excluir.");
		}

		usuarioRepository.excluir(usuario);
		;
	}

	@Override
	public List<Usuario> getUsuariosAtivosComDeviceRegistrado() throws ServiceException {

		return usuarioRepository.getUsuariosAtivosComDeviceRegistrado();

	}

	@Override
	public List<Usuario> getUsuariosAtivosComDeviceRegistradoPorNome(String nome) throws ServiceException {

		return usuarioRepository.getUsuariosAtivosComDeviceRegistradoPorNome(nome);
	}

	@Override
	public List<Usuario> getUsuariosAtivosPorCliente(Cliente cliente) throws ServiceException {
		return usuarioRepository.getUsuariosAtivosPorCliente(cliente);
	}

	public void setUsuarioRepository(UsuarioRepository usuarioRepository) {
		this.usuarioRepository = usuarioRepository;
	}

	@Override
	public List<Usuario> obterTodos(Contratante contratante) {
		return this.usuarioRepository.obterTodos(contratante);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public UsuarioDTO getUsuarioDTOMobile(final String userID, final String password)
			throws ServiceException, LoginException {

		logger.info("UsuarioServiceImpl.getUsuario");

		UsuarioDTO usuarioDTO = null;
		Usuario usuario = null;

		try {

			usuario = obterUsuarioValido(userID, password);

		} catch (Exception e) {

			usuarioDTO = new UsuarioDTO();
			usuarioDTO.setRetornoEnum(RetornoEnum.ERRO_OBTER_USUARIO);
			throw e;

		}

		usuarioDTO = criarUsuarioDtoMobile(usuario);
		return usuarioDTO;
	}

	private UsuarioDTO criarUsuarioDtoMobile(final Usuario usuario) {

		UsuarioDTO usuarioDTO = new UsuarioDTO();
		if (usuario != null) {

			usuarioDTO.setIdPessoa(usuario.getPessoa().getId());
			usuarioDTO.setIdPerfil(usuario.getPerfil().getId());
			usuarioDTO.setIdUsuario(usuario.getId());
			usuarioDTO.setSenha(usuario.getSenha());
			usuarioDTO.setIdCliente(usuario.getCliente().getId());
			EventoDTO eventoDTO = null;
			LocalDTO localDTO = null;

			final List<EventoDTO> lstEventoDTO = new ArrayList<EventoDTO>();

			Set<Evento> eventosUsuario = usuario.getEventosUsuario();

			for (Evento evento : eventosUsuario) {

				if (evento.isAtivo() && !evento.getChecklists().isEmpty()) {

					List<Checklist> checklists = new ArrayList<Checklist>();
					for (Checklist checklist : evento.getChecklists()) {
						if (checklist.getStatus().getId() == StatusEnum.AGENDADO.getIdInt()
								|| checklist.getStatus().getId() == StatusEnum.EM_ANDAMENTO.getIdInt()) {
							checklists.add(checklist);
						}
					}
					eventoDTO = new EventoDTO();
					localDTO = new LocalDTO();
					eventoDTO.setIdEvento(evento.getId().toString());
					eventoDTO.setNomeEvento(evento.getNome());
					eventoDTO.setDataInicioPrevisto(evento.getDataInicio().getTime());

					localDTO.setIdLocal(evento.getLocal().getId().toString());
					localDTO.setNomeLocal(evento.getLocal().getNome());
					eventoDTO.setLocalDTO(localDTO);
					lstEventoDTO.add(eventoDTO);
				}

			}

			usuarioDTO.setLstEventoDTO(lstEventoDTO);

		}
		return usuarioDTO;
	}

	@Override
	public byte[] obterAvatarUsuarioPorEmail(String email) throws ServiceException {
		if (email == null) {
			throw new ServiceException("Email inválido. Não é possível buscar o avatar do usuário");
		}

		byte[] avatar = usuarioRepository.obterAvatarUsuarioPorEmail(email);

		return avatar;
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public UsuarioDTO alteraSenha(String emailUsuario, String senhaUsuario, String novaSenhaUsuario) {

		UsuarioDTO usuarioDTO;
		Usuario usuario;
		usuarioDTO = getUsuarioDTO(emailUsuario, senhaUsuario);
		usuario = usuarioRepository.find(usuarioDTO.getIdUsuario());

		usuario.setSenha(NicBrainUtil.criptografarSenha(novaSenhaUsuario));
		usuario.setDataUltimoLogin(new Date());
		usuarioRepository.atualizar(usuario);
		RegeracaoSenha regeracaoSenha = regeracaoSenhaService.getEmAndamentoPorUsuario(usuario);

		if (regeracaoSenha != null) {
			regeracaoSenha.setDataEncerramento(new Date());
			regeracaoSenha.setStatus(RegeracaoSenhaStatusEnum.CONCLUIDO);
			regeracaoSenhaService.salvar(regeracaoSenha);
		}

		return usuarioDTO;
	}

	@Override
	public Long obterContrantePor(Ocorrencia ocorrencia) {
		
		if(ocorrencia==null && ocorrencia.getId()==null){
			throw new ServiceException("Ocorrencia inválida");
		}
		
		return usuarioRepository.obterContrantePor(ocorrencia);
	}

}

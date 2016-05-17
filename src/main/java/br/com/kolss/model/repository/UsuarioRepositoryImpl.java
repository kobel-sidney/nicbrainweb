package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Device;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.util.NicBrainUtil;

@Repository
public class UsuarioRepositoryImpl implements UsuarioRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Obtém o Usuario pelo seu email.
	 *
	 * @param email
	 * @return
	 */
	@Override
	public Usuario getUsuarioPorEmail(String email) {

		logger.debug("UsuarioRepository.getUsuarioPorEmail");

		try {

			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Usuario.class);

			criteria.add(Restrictions.ilike("email", email, MatchMode.EXACT));
			criteria.add(Restrictions.eq("ativo", true));
			criteria.setFetchMode("cliente", FetchMode.JOIN);

			return (Usuario) criteria.uniqueResult();

		} catch (Exception e) {
			// TODO: handl exception
			return null;
		}

	}

	/**
	 * Salva o momento do último login do usuário.
	 *
	 * @param idUsuario
	 * @param ultimoIp
	 * @param dtUltimoLogin
	 *
	 * @throws DaoException
	 */
	@Transactional(readOnly=false)
	@Override
	public void atualizar(Usuario usuario) throws DaoException {

		try {
			logger.debug("UsuarioRepository.atualizar");
			Session session = sessionFactory.getCurrentSession();
			session.update(usuario);
			session.flush();
		
		} catch (Exception e) {
			throw new DaoException(e.getMessage());
		}
	}

	/**
	 *
	 * @param usuario
	 */
	@Override
	public void salvar(Usuario usuario) throws DaoException {
		logger.debug("UsuarioRepository.salvarUsuario");

		String cryptPassword = NicBrainUtil.criptografarSenha(usuario.getSenha());
		usuario.setSenha(cryptPassword);
		// usuario.setPermissao("ROLE_ADMIN");

		Session session = sessionFactory.getCurrentSession();
		session.save(usuario);
	}

	/**
	 * Exclui usuario
	 *
	 * @param usuario
	 */
	@Override
	public void excluir(Usuario usuario) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(usuario);
	}

	/**
	 * Obtém o Usuario pelo seu ID.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	@Override
	public Usuario find(Serializable idUsuario) {
		logger.debug("UsuarioRepository.find(UsuarioId)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("id", idUsuario));

		return (Usuario) criteria.uniqueResult();
	}

	/**
	 * Retorna todos os Usuários que estão no mesmo Contexto.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosPorContexto(Serializable idUsuario) {
		logger.debug("UsuarioRepository.getUsuariosPorContexto");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);

		criteria.createAlias("eventosUsuario", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usr");
		criteria.add(Restrictions.eq("usr.id", idUsuario));

		// Ordena pelo nome:
		criteria.createAlias("pessoa", "pss");
		criteria.addOrder(Order.asc("pss.nome"));

		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}

	/**
	 * Lista os Usuários Superiores de um Responsável.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosSuperioresPorContexto(Serializable idUsuario) {
		logger.debug("UsuarioRepository.getUsuariosSuperioresPorContexto");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Funcionario.class);

		// Obtem apenas os Usuários Superior:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Funcionario.class);
		List<Usuario> usuarios = getUsuariosPorContexto(idUsuario);
		dCriteria.add(Restrictions.in("usuario", usuarios));
		dCriteria.setProjection(Projections.property("funcionarioSuperior.id"));
		criteria.add(Property.forName("id").in(dCriteria));

		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuario"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Verifica se existe um Usuário associado a um aparelho cadastrado.
	 *
	 * @param idRegistro
	 *
	 * @return true: Existe atualmente um Usuário associado a um aparelho;<br>
	 *         false: Não existe Usuário associado ou aparelho não esta
	 *         cadastrado;
	 */
	@Override
	public boolean hasUsuarioPorDevice(String idRegistro) {
		logger.debug("UsuarioRepository.hasUsuarioPorDevice");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Device.class);
		criteria.add(Restrictions.eq("idRegistro", idRegistro));
		Device device = null;
		if (criteria.list().size() > 0) {
			@SuppressWarnings("unchecked")
			List<Device> lst = criteria.list();
			device = lst.get(0);
		}

		return (device != null && device.getId() != null);
	}

	/**
	 * Remove a associação do Aparelho com o Usuário.
	 *
	 * @param idRegistro
	 */
	@Override
	public void removerAssociacaoDevice(String idRegistro, Long idPessoa) {

		logger.debug("UsuarioRepository.removerAssociacaoDevice");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Device.class);
		Criterion resgistro = Restrictions.eq("idRegistro", idRegistro);
		Criterion pessoa = Restrictions.eq("usuarioResponsavel.id", idPessoa);
		criteria.add(Restrictions.or(resgistro, pessoa));

		@SuppressWarnings("unchecked")
		List<Device> devices = criteria.list();

		for (Device device : devices) {
			session.delete(device);
		}
		session.flush();
	}

	/**
	 * Associa o Usuário Logado ao Device.
	 *
	 * @param idRegistro
	 * @param idProjeto
	 * @param usuario
	 *
	 * @return
	 */
	@Override
	public Device associarDevice(String idRegistro, String idProjeto, Usuario usuario) {
		logger.debug("UsuarioRepository.associarDevice");

		/*
		 * FIX ME: Comentado para que o Login Funcionasse * @param id
		 * 
		 * @param idRegistro
		 * 
		 * @param idProjeto
		 * 
		 * @param dataUltimoLogin
		 * 
		 * @param usuarioResponsavel
		 */
		Device device = new Device(null, idRegistro, idProjeto, new Date(), usuario);

		Session session = sessionFactory.getCurrentSession();
		session.save(device);
		// return device;

		return null;
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	@Override
	public Usuario getUsuarioPorPessoa(Pessoa pessoa) {
		logger.debug("UsuarioRepository.getUsuarioPorPessoa");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("pessoa", pessoa));

		return (Usuario) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosAtivos() {
		logger.debug("UsuarioRepository.getUsuariosAtivos");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("ativo", true));

		criteria.addOrder(Order.asc("nome"));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuarios() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class, "usuario");
		criteria.createAlias("usuario.tipoUsuario", "tipoUsuario");
		criteria.createAlias("usuario.pessoa", "pessoa");
		criteria.createAlias("usuario.cliente", "cliente");

		criteria.addOrder(Order.asc("nome"));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosAtivosComDeviceRegistrado() {
		logger.debug("UsuarioRepository.getUsuariosAtivosComDevicesRegistrados");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);

		criteria.createAlias("devices", "d");
		criteria.add(Restrictions.eq("ativo", true));

		// criteria.add(Restrictions.ne("devices", null ));
		criteria.addOrder(Order.asc("nome"));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosAtivosComDeviceRegistradoPorNome(String nome) {
		logger.debug("UsuarioRepository.getUsuariosAtivosComDeviceRegistradoPorNome");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);

		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.like("nome", nome, MatchMode.START));

		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosAtivosPorNome(String nome) {
		logger.debug("UsuarioRepository.getUsuariosAtivosPorNome");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);

		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.like("nome", nome, MatchMode.START));

		return criteria.list();
	}

	@Override
	public Usuario getUsuarioAtivoPorNome(String nome) {
		logger.debug("UsuarioRepository.getUsuarioAtivoPorNome");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);

		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.like("nome", nome, MatchMode.START));

		return (Usuario) criteria.uniqueResult();

	}

	///
	/**
	 * Lista todos os Usuários Responsáveis pelos Eventos visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosResponsavelPorEventos(Serializable idUsuarioContexto) {
		logger.debug("UsuarioRepository.getUsuariosResponsavelPorEventos");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Evento.class);
		criteria.createAlias("usuarioResponsavel", "usr");
		criteria.addOrder(Order.asc("usr.nome"));

		// Filtra por Contexto:
		criteria.createAlias("usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Retorna apenas o Usuário Responsável:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Lista todos os Usuários Responsáveis pelos Checklists visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosResponsavelPorChecklists(Serializable idUsuarioContexto) {
		logger.debug("UsuarioRepository.getUsuariosResponsavelPorChecklists");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Checklist.class);
		criteria.createAlias("usuarioResponsavel", "usr");
		criteria.addOrder(Order.asc("usr.nome"));

		// Filtra por Contexto:
		criteria.createAlias("evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Retorna apenas o Usuário Responsável:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Lista todos os Usuários Responsáveis pelas Atividades visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosResponsavelPorAtividades(Serializable idUsuarioContexto) {
		logger.debug("UsuarioRepository.getUsuariosResponsavelPorAtividades");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Atividade.class);
		criteria.createAlias("usuarioResponsavel", "usr");
		criteria.addOrder(Order.asc("usr.nome"));

		// Filtra por Contexto:
		criteria.createAlias("checklist", "chk");
		criteria.createAlias("chk.evento", "evt");
		criteria.createAlias("evt.usuariosNoEvento", "usuarioContexto");
		criteria.add(Restrictions.eq("usuarioContexto.id", idUsuarioContexto));

		// Retorna apenas o Usuário Responsável:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("usuarioResponsavel"));
		criteria.setProjection(Projections.distinct(projection));

		return criteria.list();
	}

	/**
	 * Obtém o Device do Usuário selecionado.
	 *
	 * @param usuario
	 *
	 * @return
	 */
	@Override
	public Device getDevice(Usuario usuario) {
		logger.debug("UsuarioRepository.getDevice");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Device.class);
		criteria.add(Restrictions.eq("usuarioResponsavel.id", usuario.getId()));

		@SuppressWarnings("unchecked")
		List<Device> lst = criteria.list();
		return lst.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> getUsuariosAtivosPorCliente(Cliente cliente) {
		logger.debug("UsuarioRepository.getUsuariosAtivosPorCliente");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class, "usr");
		criteria.add(Restrictions.eq("ativo", Boolean.TRUE));
		criteria.add(Restrictions.eq("cliente", cliente));
		criteria.addOrder(Order.asc("usr.nome"));

		return criteria.list();
	}

	@Override
	public List<Usuario> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("ativo", Boolean.TRUE));
		criteria.createAlias("cliente", "c");
		criteria.createAlias("regras", "regras", JoinType.NONE);
		criteria.createAlias("eventosUsuario", "eventosUsuario", JoinType.NONE);
		criteria.add(Restrictions.eq("c.contratante", contratante));

		criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

		@SuppressWarnings("unchecked")
		List<Usuario> list = criteria.list();

		return list;
	}

	@Override
	public byte[] obterAvatarUsuarioPorEmail(String email) {
		logger.debug("UsuarioRepository.find(UsuarioId)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("email", email));

		Usuario usuario = (Usuario) criteria.uniqueResult();

		return usuario.getPessoa().getFoto();
	}

	@Override
	public Long obterContrantePor(Ocorrencia ocorrencia) {
		
		logger.debug("UsuarioRepository.obterContrantePor");
		
		Long id = null;

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Contratante.class);
		criteria.createAlias("clientes", "cliente");
		criteria.createAlias("cliente.locais", "local");
		criteria.createAlias("local.eventos", "evento");
		criteria.createAlias("evento.ocorrencias", "ocorrencia");
		criteria.add(Restrictions.eq("ocorrencia.id", ocorrencia.getId()));
		Contratante contratante = (Contratante) criteria.uniqueResult();
		
		if(contratante!=null && contratante.getId()!=null){
			id=contratante.getId();
		}
		
		return id;
	}
}

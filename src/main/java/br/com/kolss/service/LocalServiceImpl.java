package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.dao.HibernateDAO;
import br.com.kolss.model.dao.InterfaceDAO;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.enuns.SituacaoEnum;
import br.com.kolss.model.enuns.SituacaoOcorrenciaEnum;
import br.com.kolss.model.repository.LocalRepository;
import br.com.kolss.util.FacesContextUtil;


@Service
@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
public class LocalServiceImpl implements LocalService {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected LocalRepository localRepository;
	
	@Autowired
	protected SituacaoService situacaoService;
	
	
	@Override
	public Local getLocal(Serializable idLocal) throws ServiceException {
		logger.debug("LocalServiceImpl.getLocal");
		
		if (idLocal == null) {
			throw new ServiceException("Local inválido");
		}
		
		Local loc = localRepository.find(idLocal);
		
		SituacaoEnum situacao = situacaoService.obterSituacaoPorLocal(loc);
		loc.setSituacao(situacao);
		
		return loc;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Local> getLocaisPorCliente(Cliente cliente) {
		logger.debug("LocalServiceImpl.getLocaisPorCliente");
		
		// FIXME: Trocar depois para o DAO correto.
		// Usar a injeção!
		InterfaceDAO<Local> dao = new HibernateDAO<Local>(Local.class,FacesContextUtil.getRequestSession());
		
		Criteria criteria = dao.getCriteria();
		criteria.addOrder(Order.asc("nomeLocal"));
		criteria.add(Restrictions.eq("id.idCliente", cliente.getId()));
		
		return criteria.list();
	}
	
	@Override
	public List<Local> getLocaisPorEventosAtivosPorContexto()
			throws ServiceException {
		logger.debug("LocalServiceImpl.getLocaisPorEventosAtivosPorContexto");
		
		// FIXME: Trocar depois para o DAO correto.
		// Usar a injeção!
		InterfaceDAO<Evento> dao = new HibernateDAO<Evento>(Evento.class,
				FacesContextUtil.getRequestSession());
		Criteria criteria = dao.getCriteria();
		criteria.add(Restrictions.eq("ativo", true));
		/* FIX ME: Comentado para que o Login Funcionasse
		// Filtros por contexto:
		Usuario user = BbUsuarioLogado.getUserSession();
		criteria.add(Restrictions.in("id.idEvento",
				user.getIdEventosPorContexto()));
		criteria.add(Restrictions.in("id.idLocal",
				user.getIdLocaisPorContexto()));
		criteria.add(Restrictions.in("id.idCliente",
				user.getIdClientesPorContexto()));
		criteria.add(Restrictions.in("id.idContratante",
				user.getIdContratantesPorContexto()));
		
		// Obter apena o Local:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("local"));
		criteria.setProjection(Projections.distinct(projection));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		// Obtem a cor de sinalização:
		SinalizadorCorServiceImpl sinalizadorCorService = new SinalizadorCorServiceImpl();
		sinalizadorCorService.setSessionFactory(FacesContextUtil.getRequestSession().getSessionFactory());
		List<Local> lst = criteria.list();
		for (Local local : lst) {
			local.toString();
			SinalizadorCorEnum cor = sinalizadorCorService.getSinalizadorCor(
					local.getId());
			local.setSinalCor(cor);
		}
		
		return lst;
		*/
		return null;
	}
	
	@Override
	public List<Local> getLocais() {
		logger.debug("LocalServiceImpl.getLocais");
		
		List<Local> lst = localRepository.getLocais();
		
		// FIXME: REFACTORING
		for (Local loc : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorLocal(loc);
			loc.setSituacao(situacao);
		}
		
		return lst;
	}
	
	@Override
	public List<Local> getLocais(Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("LocalServiceImpl.getLocais");
		
		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}
		
		List<Local> lst = localRepository.getLocais(idUsuarioContexto);
		// FIXME: REFACTORING
		for (Local loc : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorLocal(loc);
			loc.setSituacao(situacao);
			
			SituacaoOcorrenciaEnum situacaoOcorrencia =
					situacaoService.obterSituacaoOcorrencia(loc, idUsuarioContexto);
			loc.setSituacaoOcorrencia(situacaoOcorrencia);
		}
		
		return lst;
	}
	
	@Override
	public List<Local> getLocais(Serializable idCliente,
			Serializable idUsuarioContexto) throws ServiceException {
		logger.debug("LocalServiceImpl.getLocais(Serializable, Serializable)");
		
		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}
		
		List<Local> lst = localRepository.getLocais(idCliente,
				idUsuarioContexto);
		// FIXME: REFACTORING
		for (Local loc : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorLocal(loc);
			loc.setSituacao(situacao);
			
			SituacaoOcorrenciaEnum situacaoOcorrencia =
					situacaoService.obterSituacaoOcorrencia(loc, idUsuarioContexto);
			loc.setSituacaoOcorrencia(situacaoOcorrencia);
		}
		
		return lst;
	}
	
	@Override
	public List<Local> getLocaisPorClientes(Serializable idUsuarioContexto)
			throws ServiceException {
		logger.debug("LocalServiceImpl.getLocaisPorCliente");
		
		if (idUsuarioContexto == null) {
			throw new ServiceException("Usuário inválido");
		}
		
		List<Local> lst = localRepository.getLocaisPorClientes(idUsuarioContexto);
		// FIXME: REFACTORING
		for (Local loc : lst) {
			SituacaoEnum situacao = situacaoService.obterSituacaoPorLocal(loc);
			loc.setSituacao(situacao);
			
			SituacaoOcorrenciaEnum situacaoOcorrencia =
					situacaoService.obterSituacaoOcorrencia(loc, idUsuarioContexto);
			loc.setSituacaoOcorrencia(situacaoOcorrencia);
		}
		
		return lst;
	}

	@Override
	public List<Local> getLocaisAtivosPorCliente(Cliente cliente) throws ServiceException {
		logger.debug("LocalServiceImpl.getLocaisAtivosPorCliente");
		return localRepository.getLocaisAtivosPorCliente(cliente);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvarOuAtualizar(Local local) throws ServiceException {
		localRepository.salvarOuAtualizar(local);
	}
	
	@Override
	public List<Local> getLocaisRonda(Long idUsuario) throws ServiceException {
		if (idUsuario == null) {
			throw new ServiceException("Id do usuario nulo");
		}
		return localRepository.getLocaisRonda(idUsuario);
	}

	@Override
	public List<Local> getLocaisPorContratante(Contratante contratante) throws ServiceException {
		if (contratante == null) {
			throw new ServiceException("Contratante nulo");
		}
		return localRepository.getLocaisPorContratante(contratante);
	}
	
	@Override
	public List<Local> obterLocaisDeRondaPorCliente(Cliente cliente) throws ServiceException {
		if (cliente == null) {
			throw new ServiceException(
					"Não é possível listar locais de ronda por cliente com o parâmetro cliente nulo.");
		}

		return localRepository.obterLocaisDeRondaPorCliente(cliente);
	}
}

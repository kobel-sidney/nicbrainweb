package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Local;


@Repository
public class LocalRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Local pelo seu ID.
	 * 
	 * @param idLocal
	 * 
	 * @return
	 */
	public Local find(Serializable idLocal) {
		logger.debug("LocalRepository.find");
		
		Session session = sessionFactory.getCurrentSession();
		return (Local) session.load(Local.class, idLocal);
	}
	
	/**
	 * Retorna todos os locais cadastrados e ordenados pelo nome do local.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Local> getLocais() {
		logger.debug("LocalRepository.getLocais");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class);
		
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	/**
	 * Retorna todos os locais autorizados para o Usuário selecionado, ordenados
	 * pelo nome do local.
	 * 
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	public List<Local> getLocais(Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getLocais(Serializable)");

		return this.getLocais(null, idUsuarioContexto);
	}
	
	/**
	 * Retorna todos os locais autorizados para o Usuário selecionado, ordenados
	 * pelo nome do local.
	 * 
	 * @param idCliente
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Local> getLocais(Serializable idCliente,
			Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getLocais(Serializable, Serializable)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Evento.class);
		criteria.add(Restrictions.eq("ativo", true));
		
		
		// Filtro por Local:
		if (isValidId(idCliente)) {
			DetachedCriteria dCriteria = DetachedCriteria.forClass(Local.class);
			dCriteria.createAlias("cliente", "cli");
			dCriteria.add(Restrictions.eq("cli.id", idCliente));
			dCriteria.setProjection(Projections.property("id"));
			criteria.add(Property.forName("local.id").in(dCriteria));
		}
		
		// Filtra por Contexto:
		criteria.createAlias("usuariosNoEvento", "usr");
		criteria.add(Restrictions.eq("usr.id", idUsuarioContexto));
		
		// Retorna somente os Locais:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("local"));
		criteria.setProjection(Projections.distinct(projection));
		
		// Aplica o SQL DISTINCT:
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		// Ordena a consulta pelo nome do Local:
		criteria.createAlias("local", "l");
		criteria.addOrder(Order.asc("l.nome"));
		
		return criteria.list();
	}
	
	/**
	 * Retorna todos os locais dos Contratantes que o Usuário selecionado possui
	 * autorização, ordenados pelo nome do local.
	 * 
	 * @param idUsuarioContexto
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Local> getLocaisPorClientes(Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getLocaisPorContexto");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class);
		
		// Endereço principal:
		criteria.add(Restrictions.eq("enderecoAtual", true));
		criteria.add(Restrictions.isNotNull("local"));
		
		// Filtra por Contexto:
		DetachedCriteria dCriteria = DetachedCriteria.forClass(Local.class);
		dCriteria.createAlias("eventos", "evt");
		dCriteria.createAlias("evt.usuariosNoEvento", "usr");
		dCriteria.add(Restrictions.eq("usr.id", idUsuarioContexto));
		dCriteria.setProjection(Projections.property("cliente.id"));
		criteria.add(Property.forName("cliente.id").in(dCriteria));
		
		// Retorna somente os Locais:
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("local"));
		criteria.setProjection(Projections.distinct(projection));
		
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Local> getLocaisAtivosPorCliente(Cliente cliente) {
		logger.debug("AtividadeRepository.getLocaisAtivosPorCliente");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class, "l");
		criteria.add(Restrictions.eq("ativo", Boolean.TRUE));
		criteria.add(Restrictions.eq("cliente", cliente));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

	public void salvarOuAtualizar(Local local) {
		logger.debug("AtividadeRepository.salvarOuAtualizar(local)");
		
		Session session = sessionFactory.getCurrentSession();
		if(local != null && local.isNew()) {
			local.setDataCadastro(new Date());
		}
		session.saveOrUpdate(local);
	}
	
	public List<Local> getLocaisRonda(Serializable idUsuarioContexto) {
		logger.debug("AtividadeRepository.getLocais(Serializable, Serializable)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class);

		// Filtra por Contexto:
		criteria.createAlias("eventos", "eventos");
		criteria.add(Restrictions.eq("eventos.ativo", true));
		criteria.add(Restrictions.eq("eventos.ronda", true));
		criteria.createAlias("eventos.usuariosNoEvento", "usuariosNoEvento");
		criteria.createAlias("cercaVirtual", "cercaVirtual", JoinType.NONE);
		criteria.add(Restrictions.eq("usuariosNoEvento.id", idUsuarioContexto));
		
//		// Retorna somente os Locais:
//		
//		Aplica o SQL DISTINCT:
//		criteria.setProjection(Projections.distinct(Projections.property("cercaVirtual")));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
//		
//		// Ordena a consulta pelo nome do Local:
//		criteria.createAlias("local", "l");
//		
//		criteria.addOrder(Order.asc("l.nome"));
//		
		return criteria.list();
	}
	
	public List<Local> getLocaisPorContratante(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class, "local");
		
		criteria.createAlias("local.cliente", "cliente");
		criteria.createAlias("local.usuarioResponsavel", "ur", JoinType.NONE);
		criteria.add(Restrictions.eq("cliente.contratante", contratante));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Local> obterLocaisDeRondaPorCliente(Cliente cliente) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Local.class);
		criteria.createAlias("eventos", "eventos");
		criteria.add(Restrictions.eq("eventos.ativo", true));
		criteria.add(Restrictions.eq("eventos.ronda", true));
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.eq("cliente", cliente));
		criteria.setFetchMode("cercasVirtuais", FetchMode.JOIN);
		
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
}

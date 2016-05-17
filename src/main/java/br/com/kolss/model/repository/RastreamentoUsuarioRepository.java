package br.com.kolss.model.repository;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;
import br.com.kolss.model.entities.RastreamentoUsuario;


@Repository
@Transactional(readOnly = true)
public class RastreamentoUsuarioRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(RastreamentoUsuario rastreamentoUsuario){
		
		Session session = sessionFactory.getCurrentSession();
		session.save(rastreamentoUsuario);
		session.flush();
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void alterar(RastreamentoUsuario rastreamentoUsuario){
		
		Session session = sessionFactory.getCurrentSession();
		session.update(rastreamentoUsuario);
		session.flush();
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(RastreamentoUsuario rastreamentoUsuario){
		
		Session session = sessionFactory.getCurrentSession();
		session.delete(rastreamentoUsuario);
		session.flush();
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public List<RastreamentoUsuario> getPontosDeRastreamentoPorRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from RastreamentoUsuario r where r.agendamentoRastreamentoUsuario.id = :idAgendamentoRastreamentoUsuario group by latitude, longitude");
		query.setLong("idAgendamentoRastreamentoUsuario", agendamentoRastreamentoUsuario.getId());
		
		return query.list();
		
	}
	
	public RastreamentoUsuario getUltimoPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario){
		 
		Session session = sessionFactory.getCurrentSession();
			
		Query query = session.createQuery("from RastreamentoUsuario r where r.agendamentoRastreamentoUsuario.id = :idAgendamentoRastreamentoUsuario order by dataHoraRastreamento desc");
		query.setMaxResults(1);
		query.setLong("idAgendamentoRastreamentoUsuario", agendamentoRastreamentoUsuario.getId());
		
		return (RastreamentoUsuario)query.uniqueResult();
		
	}
	
	public RastreamentoUsuario getPrimeiroPontoRastreadoDoRastreamento(AgendamentoRastreamentoUsuario agendamentoRastreamentoUsuario){
		 
		Session session = sessionFactory.getCurrentSession();
			
		Query query = session.createQuery("from RastreamentoUsuario r where r.agendamentoRastreamentoUsuario.id = :idAgendamentoRastreamentoUsuario order by dataHoraRastreamento asc");
		query.setMaxResults(1);
		query.setLong("idAgendamentoRastreamentoUsuario", agendamentoRastreamentoUsuario.getId());
		
		return (RastreamentoUsuario)query.uniqueResult();
		
	}
	
	
}

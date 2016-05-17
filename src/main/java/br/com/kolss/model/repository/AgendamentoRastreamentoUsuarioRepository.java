package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.AgendamentoRastreamentoUsuario;


@Repository
@Transactional(readOnly = true)
public class AgendamentoRastreamentoUsuarioRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosPorUsuario(Serializable idDoUsuario) {
		
		logger.debug("RastreamentoRepository.getRastreamentosPorPessoa");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(AgendamentoRastreamentoUsuario.class);
		criteria.add(Restrictions.eq("usuario.id", idDoUsuario));
				
		List<AgendamentoRastreamentoUsuario> lst = criteria.list();
		
		if (lst == null){
			return new ArrayList<AgendamentoRastreamentoUsuario>();
		} else {
			return lst;
		}
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(AgendamentoRastreamentoUsuario rastreamento){
		
		Session session = sessionFactory.getCurrentSession();
		session.save(rastreamento);
		session.flush();
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void alterar(AgendamentoRastreamentoUsuario rastreamento){
		
		Session session = sessionFactory.getCurrentSession();
		session.update(rastreamento);
		session.flush();
		
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void excluir(AgendamentoRastreamentoUsuario rastreamento){
		
		Session session = sessionFactory.getCurrentSession();
		
		session.delete(rastreamento);
		session.flush();
		
	}
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivos() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(AgendamentoRastreamentoUsuario.class);
		
		criteria.add(Restrictions.eq("ativo", true));
				
		return criteria.list();
		
	}
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorVigencia(Date vigenciaDeRastreamento) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(AgendamentoRastreamentoUsuario.class);
		
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.le("dataInicioRastreamento", vigenciaDeRastreamento));
		criteria.add(Restrictions.ge("dataFimRastreamento", vigenciaDeRastreamento));
				
		return criteria.list();
		
	}
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPorPeriodo(Date dataInicial, Date dataFinal) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(AgendamentoRastreamentoUsuario.class);
		
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.between("dataInicioRastreamento", dataInicial, dataFinal));
		criteria.add(Restrictions.between("dataFimRastreamento", dataInicial, dataFinal));
		
				
		return criteria.list();
		
	}
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuario(String nomeDoUsuario) {
		
		Session session = sessionFactory.getCurrentSession();
		
		//Criteria criteria = session.createCriteria(Rastreamento.class);
		
		//criteria.add(Restrictions.eq("ativo", true));
		//criteria.add(Restrictions.like("Pessoa.nomePessoa", nomeDoUsuario, MatchMode.START));
		
		Query query = session.createQuery("from AgendamentoRastreamentoUsuario r where r.usuario.nome like :nomeDoUsuario");
		query.setString("nomeDoUsuario", nomeDoUsuario + "%");
				
		return query.list();
		
	}
	
	public List<AgendamentoRastreamentoUsuario> getRastreamentosAtivosPeloNomeDoUsuarioEPorPeriodo(String nomeDoUsuario, Date dataInicial, Date dataFinal) {
		
		Session session = sessionFactory.getCurrentSession();
		
		/*
		Criteria criteria = session.createCriteria(Rastreamento.class);
		
		criteria.add(Restrictions.eq("ativo", true));
		criteria.add(Restrictions.between("dtHrInicioRastreamento", dataInicial, dataFinal));
		criteria.add(Restrictions.between("dtHrFimRastreamento", dataInicial, dataFinal));
		criteria.add(Restrictions.like("pessoa.nomePessoa", nomeDoUsuario, MatchMode.START));
		*/

		Query query = session.createQuery(	"	from 	AgendamentoRastreamentoUsuario r " + 
											"	where 	r.usuario.nome like :nomeDoUsuario and " + 
											"			r.ativo = true and " + 
											"			r.dataInicioRastreamento between :dataInicial and :dataFinal and " + 
											"			r.dataFimRastreamento between :dataInicial and :dataFinal "		
				
										);
		query.setString("nomeDoUsuario", nomeDoUsuario + "%");
		query.setParameter("dataInicial", dataInicial);
		query.setParameter("dataFinal", dataFinal);
				
		return query.list();
		
	}
	
	public AgendamentoRastreamentoUsuario getRastreamentoPorId(Serializable idRastreamento){
		
		Session session = sessionFactory.getCurrentSession();
		
		Criteria criteria = session.createCriteria(AgendamentoRastreamentoUsuario.class);
		
		criteria.add(Restrictions.eq("id", idRastreamento));
		
		return (AgendamentoRastreamentoUsuario) criteria.uniqueResult();
		
	}
	
}

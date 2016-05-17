package br.com.kolss.model.repository;

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

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.RegeracaoSenha;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.enuns.RegeracaoSenhaStatusEnum;


@Repository
@Transactional(readOnly = true)
public class RegeracaoSenhaRepository {
	
	protected Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public RegeracaoSenha getPorHashDeValidacacaoNaoExpirado(
			String hashDeValidacacao) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RegeracaoSenha.class);
		
		criteria.add(Restrictions.eq("hashValidacao", hashDeValidacacao));
		criteria.add(Restrictions.eq("expirado", false));
		
		return (RegeracaoSenha) criteria.uniqueResult();
	}
	
	public RegeracaoSenha getEmAndamentoPorUsuario(Usuario usuario) {
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RegeracaoSenha.class);
		
		criteria.add(Restrictions.eq("usuario.id", usuario.getId()));
		criteria.add(Restrictions.eq("expirado", false));

		criteria.add(Restrictions.eq("status",RegeracaoSenhaStatusEnum.EM_ANDAMENTO));
		
		return (RegeracaoSenha) criteria.uniqueResult();
		
	}

	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(RegeracaoSenha regeracaoSenha) throws DaoException {
		logger.debug("RegeracaoDeSenhaRepository.salvar");
		
		try {
		
			Session session = sessionFactory.getCurrentSession();
			session.save(regeracaoSenha);
			
		} catch (Exception e) {
			logger.info("Problema ao Persistir a Regeneração da Senha: " + e.getLocalizedMessage());
			throw e;
		}
		
	}
	
	/**
	 * Atualiza os dados da Tentativa De Regeracao.
	 * 
	 * @param checklist
	 */
	@Transactional(readOnly = false, propagation=Propagation.REQUIRED)
	public void atualizar(RegeracaoSenha regeracaoSenha) {
		
		logger.debug("RegeracaoDeSenha.atualizar");
		
		Session currentSession = this.sessionFactory.getCurrentSession();
		currentSession.update(regeracaoSenha);
		
		currentSession.flush();
	}
	
	@Transactional(readOnly = false, propagation=Propagation.REQUIRED)
	public void expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario(Usuario usuario) {

		
		logger.debug("RegeracaoDeSenha.expiraTodasAsRegeracoesQueNaoPossuemTentativaPorUsuario");
		
		StringBuilder hql = new StringBuilder();
		hql.append("UPDATE RegeracaoSenha SET status = :status");
		hql.append("     , expirado = :expirado");
		hql.append(" WHERE usuario.id = :idUsuario and ");
		hql.append(" 	   dataTentativa is null");
		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(hql.toString());
		query.setInteger("status", RegeracaoSenhaStatusEnum.EXPIRADO.ordinal());

		query.setBoolean("expirado", true);
		query.setLong("idUsuario", usuario.getId());

		//query.setBoolean("houveTentativaDeRegeracao
		
		query.executeUpdate();
		
	}
	
}

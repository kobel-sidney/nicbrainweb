package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;


@Repository
public class TipoClassificacaoRepository extends AbstractRepository {
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	
	/**
	 * Retorna o Evento pelo seu ID, contendo todos os seus atributos populados.
	 * 
	 * @param idTipoClassificacao
	 * 
	 * @return
	 */
	public TipoClassificacao obter(Serializable idTipoClassificacao) {
		logger.debug("TipoClassificacaoRepository.find");
		Session session = sessionFactory.getCurrentSession();
		return (TipoClassificacao) session.load(TipoClassificacao.class,idTipoClassificacao);
	}
	
	@SuppressWarnings("unchecked")
	public List<TipoClassificacao> obterTodos(Contratante contratante) {
		logger.debug("TipoClassificacaoRepository.getTiposClassificacoes");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoClassificacao.class);
		criteria.add(Restrictions.eqOrIsNull("contratante.id", contratante.getId()));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<TipoClassificacao> getByClassification(ClassificacaoOcorrencia classification) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(TipoClassificacao.class);
		criteria.add(Restrictions.eq("classificacaoOcorrencia", classification));
		criteria.addOrder(Order.asc("nome"));

		return criteria.list();
	}
	
}

package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.AtividadeOcorrencia;
import br.com.kolss.model.entities.OperacaoAtividadeOcorrencia;


@Repository
public class OperacaoAtividadeOcorrenciaRepository extends AbstractRepository {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	public List<OperacaoAtividadeOcorrencia> getOperacoesAtividadesOcorrencias(
			AtividadeOcorrencia atividadeOcorrencia) {
		logger.debug("OperacaoAtividadeChecklistRepository.getOperacoesAtividadesOcorrencias");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(
				OperacaoAtividadeOcorrencia.class);
		
		criteria.add(Restrictions.eq("atividadeOcorrencia.id",
				atividadeOcorrencia.getId()));
		
		return criteria.list();
	}
	
	public void salvar(OperacaoAtividadeOcorrencia operacaoAtividadeOcorrencia) {
		logger.debug("OperacaoAtividadeOcorrenciaRepository.salvar");
		
		Session session = sessionFactory.getCurrentSession();
		session.save(operacaoAtividadeOcorrencia);
	}
	
}

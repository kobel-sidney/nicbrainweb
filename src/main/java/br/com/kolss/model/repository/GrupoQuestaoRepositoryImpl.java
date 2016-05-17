package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.GrupoQuestao;

@Repository("grupoQuestaoRepository")
public class GrupoQuestaoRepositoryImpl extends AbstractRepository implements GrupoQuestaoRepository{

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<GrupoQuestao> obterTodos(Contratante contratante) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(GrupoQuestao.class);
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}
	
    @Override
	public GrupoQuestao obter(final Long id) {
    	
    	Session session = sessionFactory.getCurrentSession();
    	
		Criteria criteria = session.createCriteria(GrupoQuestao.class);
		criteria.add(Restrictions.eq("id",id));
		
		return (GrupoQuestao) criteria.uniqueResult();
	}
    
    @Override
	public void salvar(GrupoQuestao grupoQuestao) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(grupoQuestao);
	}
    
    @Override
	public void atualizar(GrupoQuestao grupoQuestao) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(grupoQuestao);
	}
    
    @Override
	public void remover(GrupoQuestao grupoQuestao) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(grupoQuestao);
	}
}

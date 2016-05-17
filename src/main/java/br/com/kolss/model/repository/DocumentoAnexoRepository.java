package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.DocumentoAnexo;
import br.com.kolss.model.entities.Local;

@Repository
public class DocumentoAnexoRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;

	public List<DocumentoAnexo> listarPorLocal(Local local) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(DocumentoAnexo.class);
		criteria.add(Restrictions.eq("local", local));
		return criteria.list();
	}

	public void excluir(DocumentoAnexo documentoAnexo) {
		logger.debug("DocumentoAnexoRepository.excluir");

		Session session = sessionFactory.getCurrentSession();

		session.delete(documentoAnexo);
	}

	public void salvar(DocumentoAnexo documentoAnexo) {
		logger.debug("DocumentoAnexoRepository.salvar");

		Session session = sessionFactory.getCurrentSession();

		session.save(documentoAnexo);
	}

}

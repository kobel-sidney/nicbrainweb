package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Formulario;
import br.com.kolss.model.entities.Pergunta;
import br.com.kolss.model.entities.RespostaAlternativa;
import br.com.kolss.model.entities.Topico;


@Repository
public class FormularioRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	public Formulario find(Serializable idFormulario) {
		logger.debug("FormularioRepository.find");
		Session session = sessionFactory.getCurrentSession();
		return (Formulario) session.load(Formulario.class, idFormulario);
	}
	
	@SuppressWarnings("unchecked")
	public List<Topico> listarTopicosDoFormulario(Long idFormulario) {

		logger.debug("FormularioRepository.listarTopicosDoFormulario");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Topico.class);

		// criteria.addOrder(Order.asc("sequenciaTopico"));
		criteria.add(Restrictions.eq("formulario.id", idFormulario));

		return criteria.list();
	}

	/**
	 * Retorna todos os Formulário ativos, ordenados em ordem alfabética do nome.
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Formulario> getFormularios() {
		logger.debug("FormularioRepository.getFormularios");
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Formulario.class);
		
		criteria.add(Restrictions.eq("ativo", true));
		criteria.addOrder(Order.asc("nome"));
		
		return criteria.list();
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Pergunta> listarPerguntasDoTopico(Serializable idTopico) {

		logger.debug("FormularioRepository.listarPerguntasDoTopico");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pergunta.class);

		criteria.add(Restrictions.eq("topico.id", idTopico));

		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<RespostaAlternativa> listarDeRespostasAlternativas(Serializable idPergunta) {

		logger.debug("FormularioRepository.listarDeRespostasAlternativas");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RespostaAlternativa.class);

		criteria.add(Restrictions.eq("pergunta.id", idPergunta));

		return criteria.list();
	}

	public void salvar(Formulario formulario) {
		logger.debug("FormularioRepository.salvar");
		Session session = sessionFactory.getCurrentSession();
		session.save(formulario);
	}

	public void atualizar(Formulario formulario) {
		logger.debug("FormularioRepository.atualizar");
		Session session = sessionFactory.getCurrentSession();
		session.update(formulario);
	}

	public void remover(Formulario formulario) {
		logger.debug("FormularioRepository.remover");
		Session session = sessionFactory.getCurrentSession();
		session.delete(formulario);
	}
	
}

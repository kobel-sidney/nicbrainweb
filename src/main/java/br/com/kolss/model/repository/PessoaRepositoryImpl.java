package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Pessoa;

@Repository
public class PessoaRepositoryImpl extends AbstractRepository implements PessoaRepository {

	protected Logger logger = Logger.getLogger(getClass());

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Pessoa obter(Serializable idPessoa) {
		logger.debug("PessoaRepository.find");
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pessoa.class);
		
		criteria.setFetchMode("foto", FetchMode.JOIN);
		criteria.add(Restrictions.eq("id", idPessoa));
		
		return (Pessoa) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pessoa> obterTodos(Contratante contratante) {
		
		logger.debug("PessoaRepository.obterTodos");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pessoa.class);
		criteria.createAlias("usuarios", "u");
		criteria.createAlias("cliente", "cliente");
		criteria.createAlias("cliente.contratante", "contratante");
		criteria.add(Restrictions.eq("contratante.id", contratante.getId()));
		return criteria.list();
	}

	@Override
	public List<Pessoa> findPessoasPorCliente(Cliente cliente) {
		
		logger.debug("PessoaRepository.findPessoasPorCliente");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Pessoa.class, "p");
		criteria.addOrder(Order.asc("nome"));
		criteria.add(Restrictions.eq("cliente", cliente));

		@SuppressWarnings("unchecked")
		List<Pessoa> pessoas = criteria.list();

		for (Pessoa pessoa : pessoas) {
			Hibernate.initialize(pessoa.getEmailsPessoais());
			Hibernate.initialize(pessoa.getTelefonesPessoais());
			Hibernate.initialize(pessoa.getEnderecos());
		}

		return pessoas;
	}

	@Override
	public void salvar(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		session.save(pessoa);
	}

	@Override
	public void atualizar(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		session.update(pessoa);
	}

	@Override
	public void excluir(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(pessoa);
	}

}

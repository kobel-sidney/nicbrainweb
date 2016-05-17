package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Endereco;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Pessoa;

@Repository
public class EnderecoRepository extends AbstractRepository {

	@Autowired
	private SessionFactory sessionFactory;
	private Criteria criteria;

	/**
	 * Retorna um Endereço.
	 *
	 * @param id
	 *
	 * @return
	 */
	public Endereco find(Long id) {
		logger.debug("EnderecoRepository.find(id)");
		Session session = sessionFactory.getCurrentSession();
		return (Endereco) session.load(Endereco.class, id);
	}

	/**
	 * Atualiza um endereço
	 *
	 * @param endereco
	 */
	public void atualizar(Endereco endereco) {
		logger.debug("EnderecoRepository.atualizar");

		Session session = sessionFactory.getCurrentSession();
		session.update(endereco);
	}

	/**
	 * Salva um endereço
	 *
	 * @param endereco
	 */
	public void salvar(Endereco endereco) {
		logger.debug("EnderecoRepository.salvar");

		Session session = sessionFactory.getCurrentSession();
		session.save(endereco);
	}

	/**
	 * Remove um endereço
	 *
	 * @param endereco
	 */
	public void remover(Endereco endereco) {
		logger.debug("EnderecoRepository.remover");

		Session session = sessionFactory.getCurrentSession();
		session.delete(endereco);
	}

	/**
	 * Lista os endereços associados a um contratante
	 *
	 * @param contratante
	 */
	@SuppressWarnings("unchecked")
	public List<Endereco> listarPorContratante(Contratante contratante) {
		logger.debug("EnderecoRepository.listarPorContratante");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class, "e");
		criteria.createCriteria("e.tipoEndereco", "tipoEndereco",
				JoinType.INNER_JOIN);
		criteria.addOrder(Order.asc("logradouro"));
		criteria.add(Restrictions.eq("contratante", contratante));
		return criteria.list();
	}

	/**
	 * Lista os endereços associados a um cliente
	 *
	 * @param cliente
	 */
	@SuppressWarnings("unchecked")
	public List<Endereco> listarPorCliente(Cliente cliente) {
		logger.debug("EnderecoRepository.listarPorCliente");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class, "e");
		criteria.createCriteria("e.tipoEndereco", "tipoEndereco",
				JoinType.INNER_JOIN);
		criteria.addOrder(Order.asc("logradouro"));
		criteria.add(Restrictions.eq("cliente", cliente));
		return criteria.list();
	}

	public Endereco listarEnderecoCompleto(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class, "e");
		criteria.createAlias("e.municipio", "municipio",
				JoinType.RIGHT_OUTER_JOIN);
		criteria.add(Restrictions.eq("id", id));

		return (Endereco) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<Endereco> buscarPorLocal(Local local) {
		logger.debug("EnderecoRepository.buscarPorLocal(local)");

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class, "e");
		criteria.createCriteria("e.tipoEndereco", "tipoEndereco",
				JoinType.INNER_JOIN);
		criteria.addOrder(Order.asc("logradouro"));
		criteria.add(Restrictions.eq("local", local));

		return criteria.list();
	}

	/**
	 * Lista os endereços associados a uma pessoa
	 *
	 * @param pessoa
	 */
	@SuppressWarnings("unchecked")
	public List<Endereco> listarPorPessoa(Pessoa pessoa) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Endereco.class, "endereco");
		criteria.createCriteria("endereco.municipio", "municipio");
		criteria.createCriteria("municipio.estado", "estado");
		criteria.createCriteria("endereco.pessoa", "pessoa");
		criteria.createCriteria("endereco.tipoEndereco", "tipoEndereco");
		criteria.add(Restrictions.eq("pessoa", pessoa));
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	public List<Endereco> obterTodos() {

		Session session = sessionFactory.getCurrentSession();
		criteria = session.createCriteria(Endereco.class);
		return criteria.list();
	}
}
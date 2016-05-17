package br.com.kolss.model.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.ClienteMensagem;
import br.com.kolss.model.entities.Mensagem;

@Repository
@Transactional(readOnly = false)
public class ClienteMensagemRepositoryImpl extends AbstractRepository implements
		ClienteMensagemRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Mensagem> obterAssociadasAoCliente(Long idCliente) {

		logger.debug("ClienteMensagemRepositoryImpl.obterAssociadasAoCliente");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class, "mensagem");
		criteria.createAlias("mensagem.clientesMensagens", "clientesMensagens");
		criteria.createAlias("mensagem.tipoMensagem", "tipoMensagem");
		criteria.add(Restrictions.eq("clientesMensagens.cliente.id", idCliente));
		return criteria.list();
	}

	public List<Mensagem> obterNaoAssociadasAoCliente(Long idCliente) {

		logger.debug("ClienteMensagemRepositoryImpl.obterNaoAssociadasAoCliente");
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Mensagem.class, "mensagem");
		criteria.createAlias("mensagem.clientesMensagens", "clientesMensagens");
		criteria.createAlias("mensagem.tipoMensagem", "tipoMensagem");
		criteria.add(Restrictions.ne("clientesMensagens.cliente.id", idCliente));
		return criteria.list();
	}
	
	@Override
	public void excluir(ClienteMensagem clienteMensagem) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(clienteMensagem);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ClienteMensagem> obterClientesMensagensPorCliente(Cliente cliente) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ClienteMensagem.class);
		criteria.add(Restrictions.eq("cliente", cliente));
		
		return criteria.list();
	}

	@Override
	public void salvar(ClienteMensagem clienteMensagem) {
		Session session = sessionFactory.getCurrentSession();
		session.save(clienteMensagem);
	}
}

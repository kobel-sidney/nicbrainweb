package br.com.kolss.service.message;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import br.com.kolss.dto.MessagePushDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Funcionario;
import br.com.kolss.model.entities.Usuario;

public interface EmailMessageSender {

	void enviarNoFormatoHtml(Long idContratante, String titulo,String corpoMensagem, String emailDestinatario,String nomeDestinatario) throws ServiceException;

	void enviar(Long idContratante, String titulo, String corpoMensagem,Collection<Funcionario> funcionarios) throws ServiceException;

	void enviar(Serializable idContratante, String titulo,	String corpoMensagem, Collection<Usuario> usuarios)	throws ServiceException;

	void enviarPushs(Set<Usuario> usuariosANotificar, String tituloMensagem,String corpoMensagem) throws IOException;

	void enviarPushPorDevice(MessagePushDTO messagePushDTO) throws IOException;

}

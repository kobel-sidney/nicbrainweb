package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.exception.DaoException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Device;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Usuario;

public interface UsuarioRepository {

	Usuario getUsuarioPorEmail(String email);

	void atualizar(Usuario usuario) throws DaoException;

	void salvar(Usuario usuario) throws DaoException;

	Usuario find(Serializable idUsuario);

	List<Usuario> getUsuariosPorContexto(Serializable idUsuario);

	List<Usuario> getUsuariosSuperioresPorContexto(Serializable idUsuario);

	boolean hasUsuarioPorDevice(String idRegistro);

	Device associarDevice(String idRegistro, String idProjeto, Usuario usuario);

	Usuario getUsuarioPorPessoa(Pessoa pessoa);

	List<Usuario> getUsuariosAtivos();

	List<Usuario> getUsuariosAtivosComDeviceRegistrado();

	List<Usuario> getUsuariosAtivosComDeviceRegistradoPorNome(String nome);

	Usuario getUsuarioAtivoPorNome(String nome);

	List<Usuario> getUsuariosResponsavelPorEventos(Serializable idUsuarioContexto);

	List<Usuario> getUsuariosResponsavelPorChecklists(Serializable idUsuarioContexto);

	List<Usuario> getUsuariosResponsavelPorAtividades(Serializable idUsuarioContexto);

	Device getDevice(Usuario usuario);

	List<Usuario> getUsuariosAtivosPorCliente(Cliente cliente);

	List<Usuario> getUsuarios();

	void excluir(Usuario usuario);

	List<Usuario> getUsuariosAtivosPorNome(String nome);

	void removerAssociacaoDevice(String idRegistro, Long idPessoa);
	/**
	 * 
	 * @param contratante
	 * @return
	 */
	List<Usuario> obterTodos(Contratante contratante);

        /**
         * 
         * @param email 
         * @return 
         */
        byte[] obterAvatarUsuarioPorEmail(String email);

		Long obterContrantePor(Ocorrencia ocorrencia);
}

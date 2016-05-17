package br.com.kolss.service;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.dto.RetornoAlterarSenhaDTO;
import br.com.kolss.dto.UsuarioDTO;
import br.com.kolss.exception.LoginException;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Cliente;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Usuario;

/**
 * Serviço responsável pelo Usuario
 */
public interface UsuarioService {

	/**
	 * Retorna o <i>entity</i> do Usuario, caso ele exista no banco.<br>
	 * Em caso positivo, irá retornar os dados do Usuário.<br>
	 * Em caso negativo, irá lançar uma exceção!
	 *
	 * @param userID
	 * @param password
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	UsuarioDTO getUsuarioDTO(String userID, String password) throws ServiceException;

	/**
	 * Remove a associação do Usuário com o Devise, caso exista.
	 *
	 * @param idRegistro
	 * @param idProjeto
	 * @param idPessoa
	 *
	 * @throws ServiceException
	 */
	void removerAssociacaoDevice(String idRegistro, String idProjeto, Long idPessoa) throws ServiceException;

	/**
	 * Associa o Device ao Usuário.
	 *
	 * @param idRegistro
	 * @param idProjeto
	 * @param idPessoa
	 *
	 * @throws ServiceException
	 */
	void associarDevice(String idRegistro, String idProjeto, Long idPessoa) throws ServiceException;

	void salvar(Usuario usuario) throws ServiceException;

	void atualizar(Usuario usuario) throws ServiceException;

	/**
	 * Obtém o Usuário pelo seu ID.
	 *
	 * @param idUsuario
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	Usuario obter(Serializable idUsuario) throws ServiceException;

	/**
	 * Retorna todos os Usuários que estão no mesmo Contexto.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	List<Usuario> getUsuariosPorContexto(Long idUsuario) throws ServiceException;

	/**
	 * Lista os Usuários Superiores de um Responsável.
	 *
	 * @param idUsuario
	 *
	 * @return
	 */
	public List<Usuario> getUsuariosSuperioresPorContexto(Serializable idUsuario) throws ServiceException;

	/**
	 * Retorna o Usuário de acordo com o Email.
	 *
	 * @param emailDoUsuario
	 *
	 * @return Usuario
	 */
	public Usuario getUsuarioPorEmail(String emailDoUsuario) throws ServiceException;

	/**
	 * Retorna o Usuário de acordo com a Pessoa.
	 *
	 * @param Pessoa
	 *
	 * @return Usuario
	 */
	public Usuario getUsuarioPorPessoa(Pessoa pessoa) throws ServiceException;

	/**
	 * Lista os Usuários Ativos.
	 *
	 * @return listaDeUsuarios
	 */
	public List<Usuario> getUsuariosAtivos() throws ServiceException;

	/**
	 * Listar todos UsuariosDTO
	 *
	 * @return List<UsuarioDTO>
	 * @throws ServiceException
	 */
	public List<UsuarioDTO> listarUsuariosDTO(Contratante contratante) throws ServiceException;

	/**
	 * Lista os Usuários Ativos Por Nome.
	 *
	 * @return listaDeUsuarios
	 */
	public List<Usuario> getUsuariosAtivosPorNome(String nome) throws ServiceException;

	/**
	 * Lista os Usuários Ativos com Device Registrado.
	 *
	 * @return listaDeUsuarios
	 */
	public List<Usuario> getUsuariosAtivosComDeviceRegistrado() throws ServiceException;

	/**
	 * Lista os Usuários com Device Registrado Ativos Por Nome.
	 *
	 * @return listaDeUsuarios
	 */
	public List<Usuario> getUsuariosAtivosComDeviceRegistradoPorNome(String nome) throws ServiceException;

	/**
	 * Lista todos os Usuários Responsáveis pelos Eventos visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Usuario> getUsuariosPorEventosPorContexto(Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Lista todos os Usuários Responsáveis pelos Checklist visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Usuario> getUsuariosPorChecklistsPorContexto(Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Lista todos os Usuários Responsáveis pelas Atividades visiveis ao Usuário
	 * selecionado.
	 *
	 * @param idUsuarioContexto
	 *
	 * @return
	 *
	 * @throws ServiceException
	 */
	List<Usuario> getUsuariosPorAtividadesPorContexto(Serializable idUsuarioContexto) throws ServiceException;

	/**
	 * Exclui um usuario
	 *
	 * @param usuarioDTO
	 * @throws ServiceException
	 */
	void excluir(UsuarioDTO usuarioDTO) throws ServiceException;

	/**
	 * Salva ou atualiza Usuario
	 *
	 * @param usuarioDTO
	 * @throws ServiceException
	 */
	void salvarOuAtualizar(UsuarioDTO usuarioDTO) throws ServiceException;

	List<Usuario> getUsuariosAtivosPorCliente(Cliente cliente) throws ServiceException;

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
	 * @throws ServiceException
	 */
	byte[] obterAvatarUsuarioPorEmail(String email) throws ServiceException;

	

	/**
	 * 
	 * @param emailUsuario
	 * @param senhaUsuario
	 * @param novaSenhaUsuario
	 * @return
	 * @throws ServiceException
	 */
	UsuarioDTO alteraSenha(String emailUsuario, String senhaUsuario, String novaSenhaUsuario) throws ServiceException;

	/**
	 * 
	 * @param emailUsuario
	 * @param senhaUsuario
	 * @param novaSenhaUsuario
	 * @return
	 * @throws ServiceException
	 */

	RetornoAlterarSenhaDTO alterarSenhaMobile(String email,String senhaUsuario, String novaSenha, String confirmaNovaSenha) throws LoginException;

	UsuarioDTO getUsuarioDTOMobile(String userID, String password) throws ServiceException, LoginException;

	Long obterContrantePor(Ocorrencia ocorrencia);
}

/**
 * 
 */
package br.com.kolss.service;

import org.junit.Assert;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;

import br.com.kolss.dto.RondaDTO;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.model.repository.RondaRepository;
import br.com.kolss.model.repository.UsuarioRepository;

/**
 * @author adansbento
 *
 */
public class RondaServiceImplTest {
	
	
	@Mock private RondaRepository rondaRepository;
	
	@Mock private UsuarioRepository usuarioRepository;
	
	private UsuarioServiceImpl usuarioServiceImpl;
	private RondaServiceImpl rondaServiceImpl;
	
	
	@org.junit.Before
	public void init() {
		MockitoAnnotations.initMocks(this);
		
		usuarioServiceImpl = new UsuarioServiceImpl();
		usuarioServiceImpl.setUsuarioRepository(usuarioRepository);
		
		rondaServiceImpl = new RondaServiceImpl();
		rondaServiceImpl.setRondaRepository(rondaRepository);
	}
	

	@Test
	public void testObterEmAndamentoPorUsuario() {
		
		Long idUsuario = 99l;
		Mockito.when(usuarioRepository.find(idUsuario)).thenReturn(criarUsuario());
		Usuario usuario = usuarioServiceImpl.obter(idUsuario);
		
		Mockito.when(rondaRepository.obterEmAndamentoPorUsuario(usuario)).thenReturn(criarRonda());
		RondaDTO rondaDTO = rondaServiceImpl.obterEmAndamentoPorUsuario(99L);
		
		Assert.assertNotNull(rondaDTO);
		Assert.assertNotNull(rondaDTO);
		
	}


	private Ronda criarRonda() {
		Ronda ronda = new Ronda();
		ronda.setLocal(new Local(99l, "Local 1", null, null, null, false));
		ronda.setSetor(new Setor(99l, "Zoo"));
		ronda.setVeiculo(new Veiculo(99l, null, null, null, null, null, null, null, null, false));
		return ronda;
	}


	private Usuario criarUsuario() {
		Long id = 99L;
		Usuario usuario = new Usuario();
		usuario.setId(id);
		return usuario;
	}

}

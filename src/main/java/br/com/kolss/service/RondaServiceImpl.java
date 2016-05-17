package br.com.kolss.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.FiltroRonda;
import br.com.kolss.dto.GuarnicaoDTO;
import br.com.kolss.dto.RondaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Pessoa;
import br.com.kolss.model.entities.Ronda;
import br.com.kolss.model.entities.Setor;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.entities.Veiculo;
import br.com.kolss.model.repository.RondaRepository;
import br.com.kolss.util.NicBrainUtil;

import com.google.gson.Gson;

/**
 * @author weverton
 */
@SuppressWarnings("deprecation")
@Service
@Transactional
public class RondaServiceImpl implements RondaService {

	// private final String URL_RONDA_API =
	// "http://ronda.nicbrain.com.br/rondaapi/";
	private final String URL_RONDA_API = "http://rondaapihomologacao.nicbrain.com.br/rondaapi/";

	@Autowired
	private RondaRepository rondaRepository;

	@Autowired
	private VeiculoService veiculoService;

	@Autowired
	private LocalService localService;

	@Autowired
	private SetorService setorService;

	@Autowired
	private PessoaService pessoaService;

	@Autowired
	private UsuarioService usuarioService;

	@Override
	public String obterRondas(FiltroRonda filtro) {

		System.out.println(" Filtro " + filtro.getIdVeiculo());
		@SuppressWarnings("resource")
		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(URL_RONDA_API.concat("obterRonda/"));

		StringEntity entity = new StringEntity(new Gson().toJson(filtro),
				"UTF-8");
		entity.setContentType("application/json");

		post.setEntity(entity);

		HttpResponse response;
		String viaturas = null;
		try {
			response = client.execute(post);
			viaturas = NicBrainUtil.inputStreamToString(response.getEntity()
					.getContent());
		} catch (IOException ex) {
			Logger.getLogger(RondaServiceImpl.class.getName()).log(
					Level.SEVERE, null, ex);
		}
		return viaturas;
	}

	@Override
	public void salvar(Ronda ronda) throws ServiceException {
		if (ronda == null) {
			throw new ServiceException("Ronda nula.");
		}

		Veiculo veiculo = veiculoService.obter(ronda.getVeiculo().getId());
		if (veiculo == null) {
			throw new ServiceException("Veículo nulo.");
		}

		Local local = localService.getLocal(ronda.getLocal().getId());
		if (local == null) {
			throw new ServiceException("Local nulo.");
		}

		Setor setor = setorService.find(ronda.getSetor().getId());
		if (setor == null) {
			throw new ServiceException("Setor nulo.");
		}

		Usuario condutor = usuarioService.obter(ronda.getResponsavelRonda()
				.getId());
		if (condutor == null) {
			throw new ServiceException("Condutor nulo.");
		}

		Ronda rondaOld;
		if (ronda.getId() != null) {
			rondaOld = ronda;
			ronda = rondaRepository.obterRonda(ronda.getId());
			ronda.setDescricao(rondaOld.getDescricao());
			ronda.setInicio(rondaOld.getInicio());
			ronda.setFim(rondaOld.getFim());
			ronda.setTripulantes(rondaOld.getTripulantes());
		} else {
			ronda.setInicio(new Date());
		}

		ronda.setVeiculo(veiculo);
		ronda.setLocal(local);
		ronda.setSetor(setor);
		ronda.setResponsavelRonda(condutor);

		rondaRepository.salvar(ronda);
	}

	@Override
	public Ronda obterRonda(Long idRonda) {
		if (idRonda == null) {
			throw new ServiceException("ID ronda nulo.");
		}
		return rondaRepository.obterRonda(idRonda);
	}

	@Override
	public Ronda obterEmAndamento(Long idRonda) {
		if (idRonda == null) {
			throw new ServiceException("ID ronda nulo.");
		}
		return rondaRepository.obterRondaEmAndamento(idRonda);
	}

	@Override
	public List<Ronda> obterEmAndamento(Usuario usuario) {
	   List<Ronda> list = new ArrayList<Ronda>();
		
	   if(usuario!=null && usuario.getId()!=null){
			list = rondaRepository.obterEmAndamentoPorContexto(usuario);
		}
		return list;
	}

	@Override
	public List<GuarnicaoDTO> buscarGuarnicoes(Long idVeiculo)
			throws ServiceException {
		if (idVeiculo == null) {
			throw new ServiceException("ID do veículo inválido");
		}

		Veiculo veiculo = veiculoService.obter(idVeiculo);
		if (veiculo == null) {
			throw new ServiceException("Veículo nulo");
		}

		Ronda ronda = rondaRepository.obterEmAndamentoPorVeiculo(veiculo);

		Set<Pessoa> pessoas = new HashSet<>(0);
		List<GuarnicaoDTO> guarnicoes = new ArrayList<>(0);

		if (ronda != null) {
			pessoas.addAll(ronda.getTripulantes());

			GuarnicaoDTO guarnicaoDTO = new GuarnicaoDTO();
			guarnicaoDTO.setId(ronda.getResponsavelRonda().getId());
			guarnicaoDTO.setNome(ronda.getResponsavelRonda().getNome());
			guarnicaoDTO.setIdVeiculo(veiculo.getId());
			guarnicaoDTO.setUsuario(true);
			guarnicoes.add(guarnicaoDTO);

			for (Pessoa pessoa : pessoas) {
				GuarnicaoDTO guarnicao = new GuarnicaoDTO();
				guarnicao.setId(pessoa.getId());
				guarnicao.setNome(pessoa.getNome());
				guarnicao.setIdVeiculo(veiculo.getId());
				guarnicao.setUsuario(false);
				guarnicoes.add(guarnicao);
			}
		}

		return guarnicoes;
	}

	@Override
	public RondaDTO obterEmAndamentoPorUsuario(Long idUsuario)
			throws ServiceException {

		RondaDTO rondaDTO = new RondaDTO();

		if (idUsuario == null) {
			throw new ServiceException("ID Usuário nulo");
		}

		Usuario usuario = usuarioService.obter(idUsuario);

		if (usuario == null) {
			throw new ServiceException("Usuário inválido");
		}

		Ronda ronda = rondaRepository.obterEmAndamentoPorUsuario(usuario);

		if (ronda != null) {
			rondaDTO.setIdLocal(ronda.getLocal().getId());
			rondaDTO.setIdSetor(ronda.getSetor().getId());
			rondaDTO.setIdUsuario(usuario.getId());
			rondaDTO.setIdVeiculo(ronda.getVeiculo().getId());
			rondaDTO.setDescricaoVeiculo(ronda.getVeiculo().getNome());
			rondaDTO.setDescricaoLocal(ronda.getLocal().getNome());
			rondaDTO.setDescricaoSetor(ronda.getSetor().getNome());
			rondaDTO.setNomeUsuario(usuario.getNome());
		}

		return rondaDTO;
	}

	public void setRondaRepository(RondaRepository rondaRepository) {
		this.rondaRepository = rondaRepository;
	}

	@Override
	public List<Ronda> obterFinalizadasRecentes(Usuario usuario) {

		if (usuario == null) {
			throw new ServiceException("Usuário inválido");
		}
		
		Date fim = new Date();
		Date inicio;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.SECOND, -10);
		inicio = calendar.getTime();

		return rondaRepository.obterFinalizadasRecentes(usuario, inicio, fim);
	}

}

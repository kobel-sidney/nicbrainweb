package br.com.kolss.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.dto.CercaVirtualDTO;
import br.com.kolss.dto.CoordenadaDTO;
import br.com.kolss.exception.ServiceException;
import br.com.kolss.model.entities.CercaVirtual;
import br.com.kolss.model.entities.Coordenada;
import br.com.kolss.model.entities.CoordenadaGeografica;
import br.com.kolss.model.entities.Local;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.repository.CercaVirtualRepository;
import br.com.kolss.model.repository.CoordenadaRepository;
import br.com.kolss.model.repository.LocalRepository;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class CercaVirtualServiceImpl implements CercaVirtualService {

	@Autowired
	private CercaVirtualRepository cercaVirtualRepository;

	@Autowired
	private LocalRepository localRepository;

	@Autowired
	private CoordenadaRepository coordenadaRepository;
	
	@Autowired
	private UsuarioService usuarioService;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void salvar(CercaVirtualDTO pontosCercaVirtualDTO) throws ServiceException {
		if (pontosCercaVirtualDTO == null) {
			throw new ServiceException("Pontos da cerca nulos.");
		}

		Local local = localRepository.find(pontosCercaVirtualDTO.getIdLocal());
		if (local == null) {
			throw new ServiceException("Local dos pontos nulo.");
		}

		CercaVirtual cercaVirtual = cercaVirtualRepository.buscarPorId(pontosCercaVirtualDTO.getIdCercaVirtual());
		if (cercaVirtual == null) {
			cercaVirtual = new CercaVirtual();
			cercaVirtual.setLocal(local);
		}
		cercaVirtual.setCor(pontosCercaVirtualDTO.getCor());
		cercaVirtual.setDescricao(pontosCercaVirtualDTO.getDescricao());

		if (cercaVirtual.getId() == null || cercaVirtual.getId() == 0) {
			cercaVirtualRepository.salvar(cercaVirtual);
		} else {
			cercaVirtualRepository.atualizar(cercaVirtual);
			// Exclui todas coordenadas existentes na cercaVirtual
			List<Coordenada> coordenadasASeremExcluidas = coordenadaRepository.obterCoordenadas(cercaVirtual);
			for (Coordenada coordenada : coordenadasASeremExcluidas) {
				coordenadaRepository.excluir(coordenada);
			}
		}

		// Salva novas coordenadas na cerca virtual
		for (CoordenadaDTO coordenadaDTO : pontosCercaVirtualDTO.getCoordenadas()) {
			Coordenada coordenada = new Coordenada();
			CoordenadaGeografica coordenadaGeografica = new CoordenadaGeografica();

			coordenadaGeografica.setLatitude(coordenadaDTO.getLatitude());
			coordenadaGeografica.setLongitude(coordenadaDTO.getLongitude());

			coordenada.setCoordenada(coordenadaGeografica);
			coordenada.setCercaVirtual(cercaVirtual);
			coordenada.setIndiceCoordenada(coordenadaDTO.getIndice());

			coordenadaRepository.salvar(coordenada);
		}
	}

	@Override
	public void excluir(Integer idCercaVirtual) throws ServiceException {
		if (idCercaVirtual == null) {
			throw new ServiceException("idCercaVirtual nulo.");
		}

		CercaVirtual cercaVirtual = cercaVirtualRepository.buscarPorId(idCercaVirtual);
		if (cercaVirtual == null) {
			throw new ServiceException("CercaVirtual nula");
		}

		cercaVirtualRepository.excluir(cercaVirtual);
	}

	@Override
	public List<CercaVirtualDTO> listarCercasVirtuais(Usuario usuario) throws ServiceException {
		if (usuario == null) {
			throw new ServiceException("Usuario nulo.");
		}

		List<Local> locais = localRepository.getLocais(usuario.getId());
		if (locais == null) {
			throw new ServiceException("Locais nulo");
		}

		List<CercaVirtualDTO> cercaVirtualDTOs = new ArrayList<>();

		for (Local local : locais) {
			List<CercaVirtual> cercasVirtuais = cercaVirtualRepository.buscarPorLocal(local);
			if (cercasVirtuais != null) {
				for (CercaVirtual cercaVirtual : cercasVirtuais) {
					CercaVirtualDTO cercaVirtualDTO = new CercaVirtualDTO();
					cercaVirtualDTO.setIdCercaVirtual(cercaVirtual.getId());
					cercaVirtualDTO.setIdLocal(cercaVirtual.getLocal().getId());
					cercaVirtualDTO.setCor(cercaVirtual.getCor());
					cercaVirtualDTO.setDescricao(cercaVirtual.getDescricao());

					List<CoordenadaDTO> coordenadaDTOs = new ArrayList<>();
					for (Coordenada coordenada : cercaVirtual.getCoordenadas()) {
						CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
						coordenadaDTO.setLatitude(coordenada.getCoordenada().getLatitude());
						coordenadaDTO.setLongitude(coordenada.getCoordenada().getLongitude());
						coordenadaDTOs.add(coordenadaDTO);
					}

					cercaVirtualDTO.setCoordenadas(coordenadaDTOs);
					cercaVirtualDTOs.add(cercaVirtualDTO);
				}
			}
		}

		return cercaVirtualDTOs;
	}

	@Override
	public CercaVirtualDTO buscarCercaVirtual(Integer idCercaVirtual) throws ServiceException {
		if (idCercaVirtual == null) {
			throw new ServiceException("idCercaVirtual nulo.");
		}

		CercaVirtual cercaVirtual = cercaVirtualRepository.buscarPorId(idCercaVirtual);
		if (cercaVirtual == null) {
			throw new ServiceException("CercaVirtual nula");
		}

		CercaVirtualDTO cercaVirtualDTO = new CercaVirtualDTO();
		cercaVirtualDTO.setIdCercaVirtual(cercaVirtual.getId());
		cercaVirtualDTO.setIdLocal(cercaVirtual.getLocal().getId());
		cercaVirtualDTO.setCor(cercaVirtual.getCor());
		cercaVirtualDTO.setDescricao(cercaVirtual.getDescricao());

		List<CoordenadaDTO> coordenadaDTOs = new ArrayList<>();
		for (Coordenada coordenada : cercaVirtual.getCoordenadas()) {
			CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
			coordenadaDTO.setLatitude(coordenada.getCoordenada().getLatitude());
			coordenadaDTO.setLongitude(coordenada.getCoordenada().getLongitude());
			coordenadaDTO.setIndice(coordenada.getIndiceCoordenada());

			coordenadaDTOs.add(coordenadaDTO);
		}

		cercaVirtualDTO.setCoordenadas(coordenadaDTOs);

		Collections.sort(cercaVirtualDTO.getCoordenadas(), new Comparator<CoordenadaDTO>() {

			@Override
			public int compare(CoordenadaDTO o1, CoordenadaDTO o2) {
				return o1.getIndice().compareTo(o2.getIndice());
			}
		});

		return cercaVirtualDTO;
	}

	@Override
	public List<CercaVirtualDTO> obterCercasVirtuaisPorEmail(String email) {
		if (email.isEmpty() || email.equals(null)) {
			throw new ServiceException("Não é possivel obter cercas virtualis com email do usuário nulo.");
		}

		Usuario usuario = usuarioService.getUsuarioPorEmail(email);
		if (usuario == null) {
			throw new ServiceException("Usuário nulo.");
		}

		List<Local> locais = localRepository.obterLocaisDeRondaPorCliente(usuario.getCliente());
		if (locais == null) {
			throw new ServiceException("Locais nulos.");
		}

		List<CercaVirtualDTO> cercaVirtualDTOs = new ArrayList<>();

		for (Local local : locais) {
			List<CercaVirtual> cercasVirtuais = cercaVirtualRepository.buscarPorLocal(local);
			if (cercasVirtuais != null) {
				for (CercaVirtual cercaVirtual : cercasVirtuais) {
					CercaVirtualDTO cercaVirtualDTO = new CercaVirtualDTO();
					cercaVirtualDTO.setIdCercaVirtual(cercaVirtual.getId());
					cercaVirtualDTO.setIdLocal(cercaVirtual.getLocal().getId());
					cercaVirtualDTO.setCor(cercaVirtual.getCor());
					cercaVirtualDTO.setDescricao(cercaVirtual.getDescricao());

					List<CoordenadaDTO> coordenadaDTOs = new ArrayList<>();
					for (Coordenada coordenada : cercaVirtual.getCoordenadas()) {
						CoordenadaDTO coordenadaDTO = new CoordenadaDTO();
						coordenadaDTO.setLatitude(coordenada.getCoordenada().getLatitude());
						coordenadaDTO.setLongitude(coordenada.getCoordenada().getLongitude());
						coordenadaDTOs.add(coordenadaDTO);
					}

					cercaVirtualDTO.setCoordenadas(coordenadaDTOs);
					cercaVirtualDTOs.add(cercaVirtualDTO);
				}
			}
		}

		return cercaVirtualDTOs;
	}

	@Override
	public CercaVirtual obterCercaVirtualPorId(Integer id) throws ServiceException {
		if (id == 0 || id == null) {
			throw new ServiceException("Id da cerca virtual nulo.");
		}

		return cercaVirtualRepository.buscarPorId(id);
	}
}

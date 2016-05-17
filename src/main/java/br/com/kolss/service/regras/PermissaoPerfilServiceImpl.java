package br.com.kolss.service.regras;

import java.io.Serializable;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.kolss.exception.SemPermissaoPorPerfilException;
import br.com.kolss.model.entities.Atividade;
import br.com.kolss.model.entities.Checklist;
import br.com.kolss.model.entities.Evento;
import br.com.kolss.model.entities.Ocorrencia;
import br.com.kolss.model.entities.Perfil;
import br.com.kolss.model.entities.StatusEnum;
import br.com.kolss.model.entities.Usuario;
import br.com.kolss.model.entities.UsuarioResponsavel;
import br.com.kolss.service.AtividadeChecklistService;
import br.com.kolss.service.ChecklistService;
import br.com.kolss.service.EventoService;
import br.com.kolss.service.OcorrenciaService;
import br.com.kolss.service.UsuarioService;


@Service
@Transactional(readOnly=false)
public class PermissaoPerfilServiceImpl implements PermissaoPerfilService {
	
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	@Autowired
	protected UsuarioService usuarioService;
	
	@Autowired
	protected ChecklistService checklistService;
	
	@Autowired
	protected AtividadeChecklistService atividadeService;
	
	@Autowired
	protected EventoService eventoService;
	
	@Autowired
	protected OcorrenciaService ocorrenciaService;
	
	@Override
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,Atividade atividade) throws SemPermissaoPorPerfilException {
		logger.debug("PermissaoPerfilServiceImpl.validarPermissaoOpercaoPorPerfil(idUsuario, Atividade)");
		
		Atividade atv = atividadeService.obter(atividade.getId());
		
		/*
		 * D) Perfil para 'OPERADOR RONDA': permissão para executar ação se o
		 * o funcionário responsável for 'OPERADOR RONDA' e o Checklist for do 
		 * tipo 'checklist ronda' e o Checklist ainda não foi iniciado.
		 */
		Usuario solicitante = usuarioService.obter(idUsuario);
		Perfil perfilSolicitante = solicitante.getPerfil();
		if (Perfil.ID_PERFIL_OPERADOR_RONDA.equals(perfilSolicitante.getId())
				&& StatusEnum.AGENDADO.getId().equals(atv.getChecklist().getStatus().getId())
				&& atv.getChecklist().isChecklistRonda()) {
			// possui permissão
			return;
		}
		
		this.validar(idUsuario, atv, atividade.getChecklist().getEvento());
	}
	
	@Override
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,
			Checklist checklist) throws SemPermissaoPorPerfilException {
		logger.debug("PermissaoPerfilServiceImpl.validarPermissaoOperacaoPorPerfil(idUsuario, Checklist)");
		
		Checklist chk = checklistService.obter(checklist.getId());
		
		/*
		 * D) Perfil para 'OPERADOR RONDA': permissão para executar ação se o
		 * o funcionário responsável for 'OPERADOR RONDA' e o Checklist for do 
		 * tipo 'checklist ronda' e o Checklist ainda não foi iniciado.
		 */
		Usuario solicitante = usuarioService.obter(idUsuario);
		Perfil perfilSolicitante = solicitante.getPerfil();
		if (Perfil.ID_PERFIL_OPERADOR_RONDA.equals(perfilSolicitante.getId())
				&& StatusEnum.AGENDADO.getId().equals(chk.getStatus().getId())
				&& chk.isChecklistRonda()) {
			// possui permissão
			return;
		}
		
		this.validar(idUsuario, chk, chk.getEvento());
	}
	
	@Override
	public void validarPermissaoOperacaoPorPerfil(Serializable idUsuario,
			Ocorrencia ocorrencia) throws SemPermissaoPorPerfilException {
		logger.debug("PermissaoPerfilServiceImpl.validarPermissaoOperacaoPorPerfil(idUsuario, Ocorrencia)");
		
		Ocorrencia ocr = ocorrenciaService.getOcorrencia(ocorrencia.getId());
		this.validar(idUsuario, ocr, ocr.getEvento());
	}
	
	
	/**
	 * Executa as regras de validação de operação no Usuário Solicitante.
	 * 
	 * @param idUsuario
	 * @param usuarioResponsavel
	 * @param evento
	 * 
	 * @throws SemPermissaoPorPerfilException
	 */
	private void validar(Serializable idUsuario,
			UsuarioResponsavel usuarioResponsavel, Evento evento)
					throws SemPermissaoPorPerfilException {
		logger.debug("PermissaoPerfilServiceImpl.validar");
		
		/* A) Perfil do Usuario ADM: permissão para executar ação. */
		Usuario solicitante = usuarioService.obter(idUsuario);
		Perfil perfilSolicitante = solicitante.getPerfil();
		if (Perfil.ID_PERFIL_ADMINISTRADOR.equals(perfilSolicitante.getId())) {
			// possui permissao
			return;
		}
		
		/* B) Todos os perfils podem executar ação se for o Responsável Direto */
		Usuario responsavel = usuarioResponsavel.getUsuarioResponsavel();
		if (responsavel != null && responsavel.getId().equals(solicitante.getId())) {
			// possui permissão
			return;
		}
		
		/*
		 * C) Perfil para 'OPERADOR MASTER': permissão para executar ação se for
		 *  o funcionário responsável; ou caso o responsável seja um 'OPERADOR'
		 *  e com o mesmo contexto.
		 */
		Perfil perfilResponsavel = responsavel.getPerfil();
		if (Perfil.ID_PERFIL_OPERADOR_MESTRE.equals(perfilSolicitante.getId())
				&& Perfil.ID_PERFIL_OPERADOR.equals(perfilResponsavel.getId())) {
			
			Evento eventoContextos = eventoService.obter(evento.getId());
			if (eventoContextos.getUsuariosNoEvento().contains(solicitante)
					&& eventoContextos.getUsuariosNoEvento().contains(responsavel)) {
				// possui permissão
				return;
			}
		}
		
		// não possui permissão:
		throw new SemPermissaoPorPerfilException("");
	}

	public void setUsuarioService(UsuarioService usuarioService) {
		this.usuarioService = usuarioService;
	}

	public void setChecklistService(ChecklistService checklistService) {
		this.checklistService = checklistService;
	}
	
}

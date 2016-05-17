package br.com.kolss.model.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import br.com.kolss.exception.DaoException;
import br.com.kolss.util.FacesContextUtil;


@Repository
public class OcorrenciaDaoImpl {

	private final Logger logger = Logger.getLogger(OcorrenciaDaoImpl.class);
	
	
	@SuppressWarnings("rawtypes")
	public List listarTotalOcorrenciaPorLocal(Date dateFrom, Date dateTo) throws DaoException {
		logger.debug("OcorrenciaDaoImpl.listarTotalOcorrenciaPorLocal");
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT COUNT( * ) , l.nomeLocal, o . * ");
		sql.append("  FROM ocorrencia o, local l");
		sql.append(" WHERE o.IdLocal = l.idLocal");
		if(dateFrom != null){
			sql.append(" AND DtInicioOcorrencia BETWEEN(:dateFrom)AND(:dateTo)");	
		}
		sql.append(" GROUP BY IdLocal");
		
		try {
			// FIXME: Usar a injeção!
			Session session = FacesContextUtil.getRequestSession();
			
			Query query = session.createSQLQuery(sql.toString());
			if(dateFrom != null){
				query.setDate("dateFrom", dateFrom);
				query.setDate("dateTo", dateTo);
			}
			List retorno = query.list();
			
			return retorno;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Ocorrência por local");
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List listarOcorrenciaPorLocal(Integer idLocal, Date dateFrom, Date dateTo)
			throws DaoException {
		logger.debug("OcorrenciaDaoImpl.listarOcorrenciaPorLocal");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT COUNT( * ) , c.nomeClassificacaoOcorrencia FROM ocorrencia o, classificacao_ocorrencia c");
		sql.append(" WHERE o.IdClassificacaoOcorrencia = c.IdClassificacaoOcorrencia");
		sql.append(" AND o.IdLocal = :idLocal");
		if(dateFrom != null){
			sql.append(" AND DtInicioOcorrencia BETWEEN(:dateFrom)AND(:dateTo)");	
		}
		sql.append(" GROUP BY o.IdClassificacaoOcorrencia");
		
		try {
			// FIXME: Usar a injeção!
			Session session = FacesContextUtil.getRequestSession();
			
			Query query = session.createSQLQuery(sql.toString());
			query.setInteger("idLocal", idLocal);
			if(dateFrom != null){
				query.setString("dateFrom", sdf.format(dateFrom));
				query.setString("dateTo", sdf.format(dateTo));
			}
			List retorno = query.list();
			
			return retorno;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new DaoException("Erro ao listar Ocorrencias por local");
		}
		
	}
	
}

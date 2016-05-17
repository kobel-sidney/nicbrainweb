package br.com.kolss.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import br.com.kolss.dto.RelatorioDTO;
import br.com.kolss.enums.TipoExportRelatorioEnum;

/**
 * 
 * @author hamseshenrique
 *
 */
@Service("relatorioService")
public class RelatorioServiceImpl implements RelatorioService {
	
	private Logger LOGGER = Logger.getLogger(RelatorioServiceImpl.class);

	@Override
	public Boolean criarRelatorio(final RelatorioDTO relatorioDTO) {
		Boolean isRelatorio = Boolean.FALSE;
		
		if(TipoExportRelatorioEnum.PDF.equals(relatorioDTO.getTipoExportRelatorioEnum())){
			isRelatorio = criarRelatorioPDF(relatorioDTO);
		}
		
		return isRelatorio;
	}
	
	/**
	 * 
	 * @param relatorioDTO
	 * @return
	 */
	private Boolean criarRelatorioPDF(final RelatorioDTO relatorioDTO){
		Boolean isRelatorio = Boolean.FALSE;
		
		try{
			
			final JasperPrint jasperPrint = JasperFillManager.fillReport(relatorioDTO.getRealPath(),
					relatorioDTO.getParametros(),new JRBeanCollectionDataSource(relatorioDTO.getConteudo()));
			
			JasperExportManager.exportReportToPdfFile(jasperPrint, relatorioDTO.getDestino());
			isRelatorio = Boolean.TRUE;
			
		}catch(Exception ex){
			
			LOGGER.error("ERRO AO GERAR RELATORIO PDF", ex);
		}
		
		return isRelatorio;
	}

}

package br.com.kolss.model.repository;

import java.io.Serializable;
import java.util.List;

import br.com.kolss.model.entities.ClassificacaoOcorrencia;
import br.com.kolss.model.entities.Contratante;
import br.com.kolss.model.entities.TipoClassificacao;

public interface ClassificacaoOcorrenciaRepository {

	ClassificacaoOcorrencia obter(Serializable idClassificacaoOcorrencia);
	ClassificacaoOcorrencia obterPorNome(String nomeClassificacaoOcorrencia,Contratante contratante);
	List<ClassificacaoOcorrencia> obterTodos(Contratante contratante);
	List<TipoClassificacao> obterTipoClassificacoesOcorrenciasPorIdClasContrante(Long idGravidade, Contratante contratante);


}

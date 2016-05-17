package br.com.kolss.model.repository;

import java.io.Serializable;

import br.com.kolss.model.entities.ConfiguracaoEmail;

public interface ConfigContratanteRepository {

	ConfiguracaoEmail getConfiguracaoEmail(Serializable idContratante);

}

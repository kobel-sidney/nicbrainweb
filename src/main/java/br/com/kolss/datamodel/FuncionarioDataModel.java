package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Funcionario;


public class FuncionarioDataModel extends ListDataModel<Funcionario>
		implements SelectableDataModel<Funcionario> {
	
	/** Método construtor padrão. */
	public FuncionarioDataModel() {
	}
	
	public FuncionarioDataModel(List<Funcionario> funcionarios) {
		super(funcionarios);
	}
	
	
	@Override
	public Object getRowKey(Funcionario object) {
		return object.getUsuario().getPessoa().getId();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Funcionario getRowData(String rowKey) {
		List<Funcionario> entities = (List<Funcionario>) getWrappedData();
		for (Funcionario entity : entities) {
			if (entity.getId() != null 
					&& entity.getUsuario().getPessoa().getId().toString().equals(rowKey))
				return entity;
		}

		return null;
	}
	
}

package br.com.kolss.datamodel;

import java.util.List;

import javax.faces.model.ListDataModel;

import org.primefaces.model.SelectableDataModel;

import br.com.kolss.model.entities.Usuario;


public class UsuarioDataModel extends ListDataModel<Usuario>
		implements SelectableDataModel<Usuario> {
	
	
	public UsuarioDataModel() {
	}

	public UsuarioDataModel(List<Usuario> data) {
		super(data);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Usuario getRowData(String rowKey) {

		List<Usuario> usuarios = (List<Usuario>) getWrappedData();
		
		for (Usuario usuario : usuarios) {
			if (usuario.getId() != null					
					&& usuario.getId().toString().equals(rowKey))
				return usuario;
		}
		
		return null;
	}

	@Override
	public Object getRowKey(Usuario usuario) {		
		return usuario.getId();
	}
	
}
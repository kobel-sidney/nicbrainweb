package br.com.kolss.view;

import java.util.Collection;

public class SelectGroupHtml {
	
	private String groupName;
	private Collection<SelectOptionHtml> options;

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Collection<SelectOptionHtml> getOptions() {
		return options;
	}

	public void setOptions(Collection<SelectOptionHtml> options) {
		this.options = options;
	}
}

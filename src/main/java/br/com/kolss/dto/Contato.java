package br.com.kolss.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Contato {

    private String nome;

    private String celular;

    private String email;

    private String twitter;

    private String facebook;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public Contato(String nome, String celular, String email, String twitter,
			String facebook) {
		super();
		this.nome = nome;
		this.celular = celular;
		this.email = email;
		this.twitter = twitter;
		this.facebook = facebook;
	}

	@Override
	public String toString() {
		return "Contato [nome=" + nome + ", celular=" + celular + ", email="
				+ email + ", twitter=" + twitter + ", facebook=" + facebook
				+ "]";
	}

    // Getters, Setters e Construtores...
    

}
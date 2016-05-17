package br.com.kolss.model.entities;

import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "menu")
public class Menu extends AbstractEntity<Long> implements Comparator<Menu>, Comparable<Menu> {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -6485645232449658832L;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_menu", nullable = false, unique = true)
	private Long id;
	
	
	@Column(name = "nome_menu", nullable = true)
	private String nome;
	
	
	@Column(name = "descricao_menu", nullable = true)
	private String descricao;
	
	
	@Column(name = "lado_menu", nullable = true, length = 1, columnDefinition = "CHAR(1)")
	private String ladoMenu;
	
	
	@Column(name = "nr_item_menu", nullable = false)
	private Integer numeroItemMenu;
	
	
	@Column(name = "url_menu", nullable = true)
	private String urlMenu;
	
	
	@Column(name = "url_icone", nullable = true)
	private String urlIcone;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = true)
	@JoinColumn(name = "id_menu_superior", nullable = true)
	private Menu menuSuperior;
	
	
	@Column(name = "ativo", nullable = false)
	private boolean ativo = false;
	
	@ManyToMany(mappedBy = "menus", fetch = FetchType.LAZY)
	private Set<Regra> regras = new HashSet<Regra>();
	
	@ManyToMany(mappedBy = "menus", fetch = FetchType.LAZY)
	private Set<Contratante> contratantes = new HashSet<Contratante>();
	
	
	/** Método Construtor padrão. */
	public Menu() {
		super();
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param numeroItemMenu
	 * @param ativo
	 */
	public Menu(Long id, Integer numeroItemMenu, boolean ativo) {
		this(id, null, null, null, numeroItemMenu, null, null, null, ativo);
	}
	
	/**
	 * Método Construtor.
	 * 
	 * @param id
	 * @param nome
	 * @param descricao
	 * @param ladoMenu
	 * @param numeroItemMenu
	 * @param urlMenu
	 * @param urlIcone
	 * @param menuSuperior
	 * @param ativo
	 */
	public Menu(Long id, String nome, String descricao, String ladoMenu,
			Integer numeroItemMenu, String urlMenu, String urlIcone,
			Menu menuSuperior, boolean ativo) {
		this();
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
		this.ladoMenu = ladoMenu;
		this.numeroItemMenu = numeroItemMenu;
		this.urlMenu = urlMenu;
		this.urlIcone = urlIcone;
		this.menuSuperior = menuSuperior;
		this.ativo = ativo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (ativo ? 1231 : 1237);
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((ladoMenu == null) ? 0 : ladoMenu.hashCode());
		result = prime * result
				+ ((menuSuperior == null) ? 0 : menuSuperior.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((numeroItemMenu == null) ? 0 : numeroItemMenu.hashCode());
		result = prime * result
				+ ((urlIcone == null) ? 0 : urlIcone.hashCode());
		result = prime * result + ((urlMenu == null) ? 0 : urlMenu.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Menu other = (Menu) obj;
		if (ativo != other.ativo)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (ladoMenu != other.ladoMenu)
			return false;
		if (menuSuperior == null) {
			if (other.menuSuperior != null)
				return false;
		} else if (!menuSuperior.equals(other.menuSuperior))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (numeroItemMenu == null) {
			if (other.numeroItemMenu != null)
				return false;
		} else if (!numeroItemMenu.equals(other.numeroItemMenu))
			return false;
		if (urlIcone == null) {
			if (other.urlIcone != null)
				return false;
		} else if (!urlIcone.equals(other.urlIcone))
			return false;
		if (urlMenu == null) {
			if (other.urlMenu != null)
				return false;
		} else if (!urlMenu.equals(other.urlMenu))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id
				+ ", nome=" + nome
				+ ", descricao=" + descricao
				+ ", ladoMenu=" + ladoMenu
				+ ", numeroItemMenu=" + numeroItemMenu
				+ ", urlMenu=" + urlMenu
				+ ", urlIcone=" + urlIcone
				+ ", menuSuperior=" + menuSuperior
				+ ", ativo=" + ativo
				+ "]";
	}
	
	@Override
	public int compare(Menu menu, Menu menuComparado) {
		// TODO Auto-generated method stub
		return menu.getNumeroItemMenu() - menuComparado.getNumeroItemMenu();
	}
	
	@Override
	public int compareTo(Menu menu) {
		// TODO Auto-generated method stub
		return (this.getId()).compareTo(menu.getId());
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getLadoMenu() {
		return ladoMenu;
	}
	
	public void setLadoMenu(String ladoMenu) {
		this.ladoMenu = ladoMenu;
	}
	
	public Integer getNumeroItemMenu() {
		return numeroItemMenu;
	}
	
	public void setNumeroItemMenu(Integer numeroItemMenu) {
		this.numeroItemMenu = numeroItemMenu;
	}
	
	public String getUrlMenu() {
		return urlMenu;
	}
	
	public void setUrlMenu(String urlMenu) {
		this.urlMenu = urlMenu;
	}
	
	public String getUrlIcone() {
		return urlIcone;
	}
	
	public void setUrlIcone(String urlIcone) {
		this.urlIcone = urlIcone;
	}
	
	public Menu getMenuSuperior() {
		return menuSuperior;
	}
	
	public void setMenuSuperior(Menu menuSuperior) {
		this.menuSuperior = menuSuperior;
	}
	
	public boolean isAtivo() {
		return ativo;
	}
	
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
	public Set<Regra> getRegras() {
		return regras;
	}
	
	public void setRegras(Set<Regra> regras) {
		this.regras = regras;
	}
	
	public Set<Contratante> getContratantes() {
		return contratantes;
	}
	
	public void setContratantes(Set<Contratante> contratantes) {
		this.contratantes = contratantes;
	}

	

	


	
}

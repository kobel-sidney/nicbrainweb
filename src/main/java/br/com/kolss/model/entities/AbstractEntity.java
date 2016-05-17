package br.com.kolss.model.entities;

import java.io.Serializable;

import javax.persistence.MappedSuperclass;


/** Classe Abstrata para definir a estrutura de um Entity. */
@MappedSuperclass
public abstract class AbstractEntity<ID extends Serializable> implements Serializable {
	
	/** serialVersionUID */
	private static final long serialVersionUID = -8469426110085667153L;
	
	
	/** Construtor Padrão (privado). */
	protected AbstractEntity() { }
	
	
	/**
	 * Verifica se esta classe possui um Identificador de Unicidade válido.
	 *  
	 * @return true: Este Objeto possui um Identificador de Unicidade;<br>
	 * false: Este Objeto não possui um Identificador de Unicidade;<br>
	 */
	public boolean isNew(){
		
		if(getId() instanceof Number){
			return !isNumeroNatural((Number) getId());
		}
		return getId()==null;
	}
	
	/**
	 * Verifica se um Número não é nulo, se é Inteiro e se é maior que Zero (0).
	 * 
	 * @param numero
	 * 
	 * @return true: Número Inteiro, maior que Zero (0);<br>
	 * false: Número nulo ou igual ou menor que Zero (0);
	 */
	protected boolean isNumeroNatural(Number numero) {
		return (numero != null
				&& numero.intValue() > 0
				&& numero.intValue() % 1 == 0);
	}
	
	@Override
	public abstract int hashCode();
	
	@Override
	public abstract boolean equals(Object obj);
	
	@Override
	public abstract String toString();
	
	public abstract ID getId();
}

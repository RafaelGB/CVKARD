package es.ucm.fdi.iw.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
public class Tag {
	private long id;
	private String name;
	private List <Proyect> proyects;
	private List <Offer> offers;
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@ManyToMany(targetEntity=Proyect.class, mappedBy="tags")
	public List<Proyect> getProyects() {
		return proyects;
	}
	public void setProyects(List<Proyect> proyects) {
		this.proyects = proyects;
	}
	@ManyToMany(targetEntity=Offer.class, mappedBy="tags")
	public List<Offer> getOffers() {
		return offers;
	}
	
	public void setOffers(List<Offer> offers) {
		this.offers = offers;
	}
}

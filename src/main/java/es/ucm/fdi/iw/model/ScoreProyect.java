package es.ucm.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
public class ScoreProyect extends Score{
	private User punctuator;
	private Proyect punctuated;
	
	@ManyToOne(targetEntity=User.class)
	public User getPunctuator(){
		return punctuator;
	}
	public void setPunctuator(User punctuator){
		this.punctuator = punctuator;
	}
	
	@ManyToOne(targetEntity=Proyect.class)
	public Proyect getPunctuated(){
		return punctuated;
	}
	public void setPunctuated(Proyect punctuated) {
		this.punctuated = punctuated;
	}
}

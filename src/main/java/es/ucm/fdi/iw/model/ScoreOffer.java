package es.ucm.fdi.iw.model;
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
public class ScoreOffer extends Score{

	private User punctuator;
	private Offer punctuated;

	@ManyToOne(targetEntity=User.class)
	public User getPunctuator(){
		return punctuator;
	}
	public void setPunctuator(User punctuator){
		this.punctuator = punctuator;
	}
	@ManyToOne(targetEntity=Offer.class)
	public Offer getPunctuated(){
		return punctuated;
	}
	public void setPunctuated(Offer punctuated) {
		this.punctuated = punctuated;
	}
}

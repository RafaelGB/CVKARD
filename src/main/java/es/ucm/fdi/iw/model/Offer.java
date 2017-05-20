package es.ucm.fdi.iw.model;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Offer {
	private long id;
	private String title;
	private String description;
	private String img;
	private User offerer;
	private List<ScoreOffer> assessment;
	private List<Tag> tags;
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getTitle(){
		return title;
	}
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	@ManyToOne(targetEntity=User.class)
	public User getOfferer(){
		return offerer;
	}
	public void setOfferer(User offerer) {
		this.offerer = offerer;
	}
	
	@OneToMany(targetEntity=ScoreOffer.class)
	@JoinColumn(name="punctuated") // <-- this avoids creating an extra Offer_ScoreOffer table
	public List<ScoreOffer> getAssessment() {
		return assessment;
	}
	public void setAssessment(List<ScoreOffer> assessment) {
		this.assessment = assessment;
	}
	
	@ManyToMany(targetEntity=Tag.class, fetch=FetchType.EAGER)
	public List<Tag> getTags() {
		return tags;
	}
	public void setTags(List<Tag> tags){
		this.tags = tags;
	}
	
	@Column(length=1024)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}

package es.ucm.fdi.iw.model;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Proyect {
	private long id;
	private String description;
	private String img;
	private String title;
	private String date;
	private String link;
	private List <User> members;
	private List<Language> languages;
	private List<Tag> tags;
	private List<ScoreProyect> assessment;
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(length=1024)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@ManyToMany(targetEntity=User.class, mappedBy="proyects")
	public List<User> getMembers() {
		return members;
	}
	public void setMembers(List<User> members) {
		this.members = members;
	}
	
	@ManyToMany(targetEntity=Language.class, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Language> getLanguages() {
		return languages;
	}
	public void setLanguages(List<Language> languages){
		this.languages = languages;
	}
	
	@ManyToMany(targetEntity=Tag.class, fetch=FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Tag> getTags() {
		return tags;
	}
	public void setTags(List<Tag> tags){
		this.tags = tags;
	}
	
	@OneToMany(targetEntity=ScoreProyect.class)
	@JoinColumn(name="punctuated_id") // <-- this avoids creating an extra User_ScoreOffer table
	public List<ScoreProyect> getAssessment() {
		return assessment;
	}
	public void setAssessment(List<ScoreProyect> assessment) {
		this.assessment = assessment;
	}
	
	public Proyect(){
		tags = new ArrayList<Tag>();
		languages = new ArrayList<Language>();
		members = new ArrayList<User>();
	}

}

package es.ucm.fdi.iw.model;

//import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
@Entity
@NamedQueries({
    @NamedQuery(name="userByLogin",
        query="select u from User u where u.email = :emailParam")
})
public class User {
	@Id
	@GeneratedValue
	private long id;
	
	//@DateTimeFormat(iso = ISO.DATE)
	private String birthday;
	
	private String name;
	private String email;
	private String password;
	private byte enabled;
	private Direction address;
	private List<Message> receivedMessages;
	private List<Message> sentMessages;
	private String card;//ambos, uno como curriculum y otro como descripcion
	private String lastName;//solo employee
	private String nick;//solo employee 
	private String DNI;//solo employee
	private String roles; // separado con ,  para distinguir entre roles
	private List<Proyect> proyects;//solo employee
	private List<ScoreOffer> myScoreOffers;//soloemployee
	private List<Offer> offers;//solo bussines
	private List<ScoreProyect> myScoreProyects;//solo bussines


	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(columnDefinition="VARCHAR(60000)")
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Column(columnDefinition="VARCHAR(9)")
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
	public byte getEnabled() {
		return enabled;
	}
	public void setEnabled(byte enabled) {
		this.enabled = enabled;
	}
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "receiver",targetEntity=Message.class,cascade = CascadeType.REMOVE, orphanRemoval = true)
	//@Cascade(CascadeType.ALL)
    @Fetch(value = FetchMode.SUBSELECT)
	public List<Message> getReceivedMessages() {
		return receivedMessages;
	}
	public void setReceivedMessages(List<Message> receivedMessages) {
		this.receivedMessages = receivedMessages;
	}
	

	@OneToMany(fetch = FetchType.EAGER,mappedBy = "sender",targetEntity=Message.class,cascade = CascadeType.REMOVE, orphanRemoval = true)
	//@Cascade(CascadeType.ALL)
    @Fetch(value = FetchMode.SUBSELECT)
	public List<Message> getSentMessages() {
		return sentMessages;
	}
	public void setSentMessages(List<Message> sentMessages) {
		this.sentMessages = sentMessages;
	}	
	
	@ManyToMany(targetEntity=Proyect.class)
	public List<Proyect> getProyects() {
		return proyects;
	}
	public void setProyects(List<Proyect> proyects) {
		this.proyects = proyects;
	}
	
	@OneToMany(targetEntity=ScoreOffer.class)
	@JoinColumn(name="punctuatorOffers") // <-- this avoids creating an extra User_ScoreOffer table
	public List<ScoreOffer> getMyScoreOffers() {
		return myScoreOffers;
	}

	public void setMyScoreOffers(List<ScoreOffer> myScoreOffers) {
		this.myScoreOffers = myScoreOffers;
	}
	@OneToMany(targetEntity=Offer.class)
	@JoinColumn(name="offerer") // <-- this avoids creating an extra Offer_ScoreOffer table
	public List<Offer> getOffers() {
		return offers;
	}
	public void setOffers(List<Offer> offers) {
		this.offers = offers;
	}
	
	@OneToMany(targetEntity=ScoreProyect.class)
	@JoinColumn(name="punctuatorProyects") // <-- this avoids creating an extra User_ScoreOffer table
	public List<ScoreProyect> getMyScoreProyects() {
		return myScoreProyects;
	}

	public void setMyScoreProyects(List<ScoreProyect> myScoreProyects) {
		this.myScoreProyects = myScoreProyects;
	}
	
	@OneToOne(fetch=FetchType.LAZY)
	public Direction getAddress() {
		return address;
	}
	public void setAddress(Direction address) {
		this.address = address;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
}

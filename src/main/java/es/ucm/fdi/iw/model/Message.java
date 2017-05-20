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
public class Message {
	private long id;
	private String subject;
	private String body;
	private boolean favourite;
	private boolean read;
	private User sender;
	private User receiver;
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getSubject(){
		return subject;
	}
	public void setSubject(String subject){
		this.subject = subject;
	}
	
	public String getBody(){
		return body;
	}
	public void setBody(String body){
		this.body = body;
	}
	
	public Boolean getFavourite(){
		return favourite;
	}
	public void setFavourite(Boolean favourite){
		this.favourite = favourite;
	}
	
	public boolean getRead() {
		return read;
	}
	public void setRead(boolean read) {
		this.read = read;
	}
	
	@ManyToOne(targetEntity=User.class)
	public User getReceiver(){
	return receiver;
	}
	public void setReceiver(User receiver){
		this.receiver =receiver;
	}
	
	@ManyToOne(targetEntity=User.class)
	public User getSender(){
	return sender;
	}
	
	public void setSender(User sender){
		this.sender =sender;
	}
	

}

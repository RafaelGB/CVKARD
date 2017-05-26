package es.ucm.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Message {
	private long id;
	private String subject;
	private String body;
	private String description;
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
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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

package es.ucm.fdi.iw.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Message {
	private long id;
	private String subject;
	private String body;
	private String category;
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
	
	@Column(columnDefinition="VARCHAR(3000)")
	public String getBody(){
		return body;
	}
	public void setBody(String body){
		this.body = body;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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

package es.ucm.fdi.iw.controller;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import es.ucm.fdi.iw.model.Message;
import es.ucm.fdi.iw.model.User;

@Controller	
@RequestMapping("message")
public class MessageController {
private static Logger log = Logger.getLogger(UserController.class);
	

	
	@PersistenceContext
	private EntityManager entityManager;
	
	@RequestMapping(value="/createMessage", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView createMessage(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("asunto") String subject,
			@RequestParam("email") String email,
			@RequestParam("category") String category,
			@RequestParam("message") String message){
		String url = "/buzon/nuevo/0";
		try{
		User u2 = entityManager.createQuery("from User where email = :email", User.class)
								  .setParameter("email", email)
								  .getSingleResult();
		User u = (User) session.getAttribute("user");
		u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		log.info("Mensaje enviado por "+u.getName()+" a "+u2.getName());
		Message m = new Message();
		m.setSender(u);
		m.setBody(message);
		m.setRead(false);
		m.setSubject(subject);
		m.setCategory(category);
		m.setReceiver(u2);
		u.getSentMessages().add(m);
		u2.getReceivedMessages().add(m);
		entityManager.persist(m);//se crea un objeto nuevo
		session.setAttribute("user", u);
		response.setStatus(HttpServletResponse.SC_OK);
		url = "/buzon/E/1";
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("No existe ningun usuario con ese email\n");
		}
		return new RedirectView(url);
	}
	
	@RequestMapping(value="/createExternalMessage/{id}", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView createExternalMessage(Model model,
    		@PathVariable("id") long id,
    		@RequestParam("sender-form") String sender,
    		@RequestParam("asunto") String subject,
			@RequestParam("email") String email,
			@RequestParam("category") String category,
			@RequestParam("message") String message){
		String url = "/welcome";
		try{
		User u = entityManager.find(User.class, id);
		url = "/curriculum/"+u.getNick()+"?contact=fallo+al+enviar+ensaje,+pruebe+mas+tarde";
		log.info("Mensaje enviado por ");
		Message m = new Message();
		//m.setSender(u);
		m.setBody(message);
		m.setRead(false);
		m.setSubject(subject);
		m.setCategory(category);
		m.setReceiver(u);
		//u.getSentMessages().add(m);
		u.getReceivedMessages().add(m);
		entityManager.persist(m);//se crea un objeto nuevo
		url = "/curriculum/"+u.getNick()+"?contact=mensaje+enviado+con+exito";
		}catch(NoResultException nre){
			log.error("No existe ningun usuario con ese email\n");
		}
		return new RedirectView(url);
	}
	
	@RequestMapping(value="/actionOnMarks/{type}", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView changeMarks(HttpSession session,HttpServletResponse response,Model model,
    		@PathVariable("type") String type,
    		@RequestParam("markOptions") String markOptions,
    		@RequestParam("checked") List<Long> checked){
		try{
		User u = (User) session.getAttribute("user");
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		Iterator<Long> it = checked.iterator();
		Message m;
		while(it.hasNext()) {
			m = entityManager.find(Message.class, it.next());
			if(markOptions.equals("leido")){
				m.setRead(true);
			}else if(markOptions.equals("borrar")){
				entityManager.remove(m);
				log.info("mensaje con la key "+m.getId()+ " eliminado");
			}
		}
		session.setAttribute("user", u);
		log.info("opcion "+markOptions+" aplicada");
		
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("Algo salio mal aplicando la opcion "+markOptions);
		}
		return new RedirectView("/buzon/"+type+"/1");
	}
	
}

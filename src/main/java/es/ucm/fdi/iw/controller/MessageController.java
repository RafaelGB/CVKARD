package es.ucm.fdi.iw.controller;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
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
		entityManager.persist(m);//si se crea un objeto nuevo
		session.setAttribute("user", u);
		response.setStatus(HttpServletResponse.SC_OK);
		url = "/buzon/E/1";
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("No existe ningun usuario con ese email\n");
		}
		return new RedirectView(url);
	}
	
}

package es.ucm.fdi.iw.controller;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller	
@RequestMapping("message")
public class MessageController {
private static Logger log = Logger.getLogger(UserController.class);
	

	
	@PersistenceContext
	private EntityManager entityManager;
	
	@RequestMapping(value="/createMessage", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public void createMessage(){
		
	}
}

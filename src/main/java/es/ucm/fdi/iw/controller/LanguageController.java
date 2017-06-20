package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;


import es.ucm.fdi.iw.LocalData;
import es.ucm.fdi.iw.model.Language;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Proyect;
import es.ucm.fdi.iw.model.ScoreOffer;
import es.ucm.fdi.iw.model.ScoreProyect;
import es.ucm.fdi.iw.model.Tag;
import es.ucm.fdi.iw.model.User;

@Controller	
@RequestMapping("Language")
public class LanguageController {
private static Logger log = Logger.getLogger(UserController.class);
@Autowired
private LocalData localData;

		
	@Autowired
	private EntityManager entityManager;
	
		@RequestMapping(value="/createL", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView createL(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("name") String name
    		
			){
		//@RequestParam("img") String img
		String url = "/Ls/1";
		try{
		User u = (User) session.getAttribute("user");
		u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		
		Language l = new Language();
		l.setName(name);
		entityManager.persist(l);//si se crea un objeto nuevo
		session.setAttribute("user", u);
		response.setStatus(HttpServletResponse.SC_OK);
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("No existe ningun usuario con ese email\n");
		}
		return new RedirectView(url);
	}
	
	

	
	
	
	@RequestMapping(value="/actionOnMarks", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView changeMarks(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("markOptions") String markOptions,
    		@RequestParam("checked") List<Long> checked){
		String url = "/Ls/1";
		try{
		User u = (User) session.getAttribute("user");
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		Iterator<Long> it = checked.iterator();
		Language l;
		
		while(it.hasNext()) {
			l = entityManager.find(Language.class, it.next());
			 if(markOptions.equals("borrar")){
				entityManager.remove(l);
				log.info("tag eliminado");
			}
		}
		session.setAttribute("user", u);
		log.info("opcion "+markOptions+" aplicada");
		
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("Algo salio mal aplicando la opcion "+markOptions);
		}
		return new RedirectView(url);
	}
	
	
}
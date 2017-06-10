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
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Proyect;
import es.ucm.fdi.iw.model.ScoreOffer;
import es.ucm.fdi.iw.model.ScoreProyect;
import es.ucm.fdi.iw.model.Tag;
import es.ucm.fdi.iw.model.User;

@Controller	
@RequestMapping("offer")
public class OfferControler {
private static Logger log = Logger.getLogger(UserController.class);
@Autowired
private LocalData localData;

		
	@Autowired
	private EntityManager entityManager;
	
	@RequestMapping(value="/createOffer", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView createOffer(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("title") String title,
			@RequestParam("description") String description,
			@RequestParam("date") String date,
    		@RequestParam("checkedTag") List<String> checked
			){
		//@RequestParam("img") String img
		String url = "/tablaofertas/1";
		try{
		User u = (User) session.getAttribute("user");
		u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		log.info("Oferta creada por "+u.getName());
		Iterator<String> it = checked.iterator();
		Offer f = new Offer();
		f.setTitle(title);
		f.setDescription(description);
		f.setDate(date);
		List<Tag> listTags = new ArrayList<Tag>();
		int i=0;
		while(it.hasNext()) {
			Tag t = entityManager.createQuery("from Tag where name = :name", Tag.class)
                    .setParameter("name", it.next())
                    .getSingleResult();
			
			listTags.add(i,t);
			i++;
			}
		f.setTags(listTags);
		//f.setImg(img);
		f.setOfferer(u);
		u.getOffers().add(f);
		entityManager.persist(f);//si se crea un objeto nuevo
		session.setAttribute("user", u);
		response.setStatus(HttpServletResponse.SC_OK);
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("No existe ningun usuario con ese email\n");
		}
		return new RedirectView(url);
	}
	

	
	/**
	 * Update the info of a user
	 * @param dni-form dni of a user
	 * @param name-form the name
	 * @param lastName-form the last name
	 * @param birthday-form the birthday
	 * @return redirect to perfilusuario with or without error
	 */
	@RequestMapping(value="/updateInfoOffer/{id}", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView updateInfoOffer(
			@RequestParam("name-form") String title,
			@RequestParam("date-form") String date,
			@PathVariable("id") long id,
			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session){
		log.info("dentro del update\n name = "+title+"\n date = "+date+"\n");
		try {
			Offer f = entityManager.find(Offer.class, id);
			f.setTitle(title);
			f.setDate(date);
			entityManager.merge(f);
			response.setStatus(HttpServletResponse.SC_OK);
			return new RedirectView("/editOffer/"+id+"?update=tus+datos+se+actualizaron+correctamente");
		} catch (NoResultException nre) {
			log.error("fallo al encontrar oferta para actualizar\n");
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return new RedirectView("/tablaofertas?update=false");
		}	
	}
	
	
	@RequestMapping(value="/updateDescript/{id}", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
	 public RedirectView updateDescript(
	    		@RequestParam("html_data") String html_data,
	    		@PathVariable("id") long id,
				HttpServletRequest request, HttpServletResponse response, 
				Model model, HttpSession session){
			String card = "error+no+se+ha+conseguido+actualizar+la+descripción"; 
			try {
				Offer f = entityManager.find(Offer.class, id);
				
				f.setDescription(html_data);
				
				entityManager.merge(f);
				response.setStatus(HttpServletResponse.SC_OK);
				card = "se+ha+actualizado+con+exito"; 
			} catch (NoResultException nre) {
				log.error("fallo al encontrar oferta para actualizar\n");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}
			return new RedirectView("/editOffer/"+id+"?card="+ card);
				
	}
	
	@RequestMapping(value="/actionOnMarks", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView changeMarks(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("markOptions") String markOptions,
    		@RequestParam("checked") List<Long> checked){
		String url = "/tablaofertas/1";
		try{
		User u = (User) session.getAttribute("user");
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		Iterator<Long> it = checked.iterator();
		Offer f;
		while(it.hasNext()) {
			f = entityManager.find(Offer.class, it.next());
			 if(markOptions.equals("borrar")){
				entityManager.remove(f);
				log.info("Oferta eliminada");
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
	/**
	 * Uploads a photo for a offer
	 * @param id of offer 
	 * @param photo to upload
	 * @return
	 */
	@RequestMapping(value="/photo/{id}", method=RequestMethod.POST)
    public @ResponseBody RedirectView handleFileUpload(@RequestParam("photo") MultipartFile photo,
    		@PathVariable("id") String id){
        if (!photo.isEmpty()) {
            try {
                byte[] bytes = photo.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(
                        		new FileOutputStream(localData.getFile("offer/"+id, "img")));
                stream.write(bytes);
                stream.close();
                return new RedirectView("/editOffer/"+id);
            } catch (Exception e) {
                return new RedirectView("/editOffer/"+id);
            }
        } else {
        	return new RedirectView("/editOffer/"+id);
        }
	}
	
	@RequestMapping(value="/photo/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public void photo(@PathVariable("id") String id, 
			HttpServletResponse response) {
	    File f = localData.getFile("offer/"+id, "img");
	    InputStream in = null;
	    try {
		    if (f.exists()) {
		    	in = new BufferedInputStream(new FileInputStream(f));
		    } else {
		    	in = new BufferedInputStream(
		    			this.getClass().getClassLoader().getResourceAsStream("unknown-user.jpg"));
		    }
	    	FileCopyUtils.copy(in, response.getOutputStream());
	    } catch (IOException ioe) {
	    	log.info("Error retrieving file: " + f + " -- " + ioe.getMessage());
	    }
	}
	
	@RequestMapping(value="/puntuaOffer/{id}/{puntuacion}", method=RequestMethod.GET)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView puntuaOffer(HttpSession session,HttpServletResponse response,Model model,
    		@PathVariable("id") Long id,
    		@PathVariable("puntuacion") int punt){
		String desc = "";
		try{
		User u = (User) session.getAttribute("user");
		Offer o = entityManager.find(Offer.class, id);
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		
		List<ScoreOffer> scores = u.getMyScoreOffers();
		log.info("Hay"+scores.size());
		Iterator<ScoreOffer> it = scores.iterator();
		String existe="false";
		while(it.hasNext() && existe.equals("false"))
		{
			
			
			if(it.next().getPunctuated().getId()==o.getId())
			{
			
				existe="true";
			}
				
		}
			if(existe.equals("false")){
		
			ScoreOffer score=new ScoreOffer();
			score.setPunctuated(o);
			score.setPunctuation(punt);
			score.setPunctuator(u);
			u.getMyScoreOffers().add(score);
			o.getAssessment().add(score);
			entityManager.persist(score);//si se crea un objeto nuevo
			session.setAttribute("user", u);
			response.setStatus(HttpServletResponse.SC_OK);
			desc="puntuado con exito";
			}
			else{
				desc="Ya has puntuado este proyecto";
			}
			
		
			
		
		
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("Algo salio mal aplicando la opcion ");
		}
		return new RedirectView("/ofertavista/"+id+"?desc="+ desc);	
	}
		
	
}

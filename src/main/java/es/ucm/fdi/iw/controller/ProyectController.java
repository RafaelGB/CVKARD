package es.ucm.fdi.iw.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import es.ucm.fdi.iw.LocalData;
import es.ucm.fdi.iw.model.Language;
import es.ucm.fdi.iw.model.Proyect;
import es.ucm.fdi.iw.model.ScoreProyect;
import es.ucm.fdi.iw.model.Tag;
import es.ucm.fdi.iw.model.User;

@Controller	
@RequestMapping("proyect")
public class ProyectController {
	
	private static Logger log = Logger.getLogger(Proyect.class);
	
	@Autowired
	private LocalData localData;
	
	@PersistenceContext
	private EntityManager entityManager;
	

    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("s", "/static/");
    }
	
	/**
	 * Returns a proyect photo
	 * @param id of proyect to get photo from
	 * @return
	 */
	@RequestMapping(value="/photo/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public void proyectPĥoto(@PathVariable("id") long id, 
			HttpServletResponse response) {
	    File f = localData.getFile("proyect/"+id, "image");
	    InputStream in = null;
	    try {
		    if (f.exists()) {
		    	in = new BufferedInputStream(new FileInputStream(f));
		    } else {
		    	in = new BufferedInputStream(
		    			this.getClass().getClassLoader().getResourceAsStream("unknownObject.png"));
		    }
	    	FileCopyUtils.copy(in, response.getOutputStream());
	    } catch (IOException ioe) {
	    	log.info("Error retrieving file: " + f + " -- " + ioe.getMessage());
	    }
	}
	
	/**
	 * Uploads a photo for a proyect
	 * @param id of project 
	 * @param photo to upload
	 * @return
	 */
	@RequestMapping(value="/photo/{id}", method=RequestMethod.POST)
    public @ResponseBody RedirectView handleFileUpload(@RequestParam("photo") MultipartFile photo,
    		@PathVariable("id") long id){
        if (!photo.isEmpty()) {
            try {
            	log.info("entra");
                byte[] bytes = photo.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(
                        		new FileOutputStream(localData.getFile("proyect/"+id, "image")));
                stream.write(bytes);
                stream.close();
                return new RedirectView("/proyect/editProyect/"+id+"?image=actualizado+con+exito");
            } catch (Exception e) {
                return new RedirectView("/proyect/editProyect/"+id+"?image=fallo+al+actualizar+el+avatar");
            }
        } else {
        	return new RedirectView("/proyect/editProyect/"+id+"?image=archivo+vacio");
        }
	}
	
	/**
	 * Update the info of a proyect
	 * @param name-form title of a proyect
	 * @param date-form date of the proyect
	 * @param id id of the proyect
	 * @return redirect to editProyect with or without error
	 */
	@RequestMapping(value="/updateInfoProyect/{id}", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView updateInfoProyect(
			@RequestParam("name-form") String title,
			@RequestParam("date-form") String date,
			@RequestParam("link-form") String link,
			@PathVariable("id") long id,
			HttpServletRequest request, HttpServletResponse response, 
			Model model, HttpSession session){
		log.info("dentro del update\n name = "+title+"\n date = "+date+"\n");
		try {
			Proyect p = entityManager.find(Proyect.class, id);
			
			p.setTitle(title);
			p.setDate(date);
			p.setLink(link);
			
			entityManager.merge(p);
			response.setStatus(HttpServletResponse.SC_OK);
			return new RedirectView("/proyect/editProyect/"+id+"?update=tus+datos+se+actualizaron+correctamente");
		} catch (NoResultException nre) {
			log.error("fallo al encontrar el proyecto para actualizar\n");
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return new RedirectView("/proyect/editProyect/"+id+"?update=false");
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
			String desc = "error+no+se+ha+conseguido+actualizar+la+descripción"; 
			try {
				Proyect p = entityManager.find(Proyect.class, id);
				
				p.setDescription(html_data);
				
				entityManager.merge(p);
				response.setStatus(HttpServletResponse.SC_OK);
				desc = "se+ha+actualizado+con+exito"; 
			} catch (NoResultException nre) {
				log.error("fallo al encontrar el proyect para actualizar\n");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}
			return new RedirectView("/proyect/editProyect/"+id+"?desc="+ desc);
				
	}
	
	
	@RequestMapping(value="/createProyect", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView createProyect(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("title") String title,
    		@RequestParam("link") String link,
			@RequestParam("description") String description,
			@RequestParam("newDate") String date,
    		@RequestParam(value="checkedTag",required=false) List<String> checked ,
    		@RequestParam(value="checkedLang",required=false) List<String> checked2){
		
		String url = "/home"; 
		try{
		User u = (User) session.getAttribute("user");
		u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		Proyect p = new Proyect();
		p.setTitle(title);
		p.setDescription(description);
		p.setDate(date);
		p.setLink(link);
		if(checked!=null){
		Iterator<String> it = checked.iterator();
		int i=0;
		while(it.hasNext()) {
			Tag t = entityManager.createQuery("from Tag where name = :name", Tag.class)
                    .setParameter("name", it.next())
                    .getSingleResult();
			
			p.getTags().add(i,t);
			i++;
			}
		}
		if(checked2!=null){
		Iterator<String> it2 = checked2.iterator();
		int i=0;
		while(it2.hasNext()) {
			Language l = entityManager.createQuery("from Language where name = :name", Language.class)
                    .setParameter("name", it2.next())
                    .getSingleResult();
			
			p.getLanguages().add(i,l);
			i++;
			}
		}
		//añadimos a las listas de proyectos y de miembros de proyecto
		
		log.info("size de getMembers"+p.getMembers().size());
		p.getMembers().add(u);
		
		log.info("size de getProyects"+u.getProyects().size());
		u.getProyects().add(p);
		entityManager.persist(p);//si se crea un objeto nuevo
		
		log.info("llega hasta despues de getMembers");

		log.info("llega hasta despues de getProyects");
		log.info("Proyecto creado por "+u.getName());
		session.setAttribute("user", u);
		response.setStatus(HttpServletResponse.SC_OK);
		url = "/tablaproyectos/V/1";
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("No existe ningun usuario con ese email\n");
		}
		log.info("redirigiendo a "+url);
		return new RedirectView(url);
	}
	

	
	@RequestMapping(value="/actionOnMarks", method=RequestMethod.POST)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView changeMarks(HttpSession session,HttpServletResponse response,Model model,
    		@RequestParam("markOptions") String markOptions,
    		@RequestParam("checked") List<Long> checked){
		try{
		User u = (User) session.getAttribute("user");
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		Iterator<Long> it = checked.iterator();
		Proyect p;
		while(it.hasNext()) {
			p = entityManager.find(Proyect.class, it.next());
			 if(markOptions.equals("borrar")){
				entityManager.remove(p);
				for (User user : p.getMembers()) {
				     user.getProyects().remove(p);
				}
				log.info("mensaje con la key "+p.getId()+ " eliminado");
			}
		}
		session.setAttribute("user", u);
		log.info("opcion "+markOptions+" aplicada");
		
		}catch(NoResultException nre){
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			log.error("Algo salio mal aplicando la opcion "+markOptions);
		}
		return new RedirectView("/tablaproyectos/V/1");
	}
	
	@RequestMapping(value="/puntuaProyect/{id}/{puntuacion}", method=RequestMethod.GET)
	@ResponseBody
	@Transactional // needed to allow DB change
    public RedirectView puntuaProyect(HttpSession session,HttpServletResponse response,Model model,
    		@PathVariable("id") Long id,
    		@PathVariable("puntuacion") int punt){
		String desc = "";
		try{
		User u = (User) session.getAttribute("user");
		Proyect p = entityManager.find(Proyect.class, id);
		//u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		
		List<ScoreProyect> scores = u.getMyScoreProyects();
		log.info("Hay"+scores.size());
		Iterator<ScoreProyect> it = scores.iterator();
		String existe="false";
		while(it.hasNext() && existe.equals("false"))
		{
			log.info("Entra1");
			
			if(it.next().getPunctuated().getId()==p.getId())
			{
				log.info("Entra2");
				existe="true";
			}
				
		}
			if(existe.equals("false")){
		
			ScoreProyect score=new ScoreProyect();
			score.setPunctuated(p);
			score.setPunctuation(punt);
			score.setPunctuator(u);
			u.getMyScoreProyects().add(score);
			p.getAssessment().add(score);
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
		return new RedirectView("/proyecto/"+id+"?desc="+ desc);	
	}
	
	/**
	 * editProyect -  vista de edición de un proyecto
	 */
	@GetMapping("/editProyect/{id}")
	public String editProyect(Model model,
			@PathVariable("id") long id,
			HttpSession session) {
		String exit="redirect:/home?error=acceso+denegado";
		User u = (User) session.getAttribute("user");
		int i = 0;
		boolean validate = false;
		Proyect p = entityManager.find(Proyect.class, id);
		//comprobamos si el usuario pertenece a la lista de miembros del proyecto
		while(!validate && i < p.getMembers().size()){
			if(p.getMembers().get(i).getId()== u.getId())
				validate = true;
			i++;
		}
		if(validate){	
			model.addAttribute("proyect", p);
			model.addAttribute("tags",p.getTags());
			model.addAttribute("lang",p.getLanguages());
			exit="editProyect";
		}
		
		return exit;
	}
			
	
}

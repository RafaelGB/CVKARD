package es.ucm.fdi.iw.controller;

import java.security.Principal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import es.ucm.fdi.iw.model.Message;
import es.ucm.fdi.iw.model.Offer;
import es.ucm.fdi.iw.model.Proyect;
import es.ucm.fdi.iw.model.Tag;
import es.ucm.fdi.iw.model.User;

@Controller	
public class RootController {

	private static Logger log = Logger.getLogger(RootController.class);
	
	@Autowired
	private EntityManager entityManager;
	
    @ModelAttribute
    public void addAttributes(Model model) {
        model.addAttribute("s", "/static/");
    }

	@GetMapping({"/", "/welcome"})
	public String root(Model model,Principal principal) {
		//principal es NULL 
		//log.info(principal.getName() + " de tipo " + principal.getClass());
		// org.springframework.security.core.userdetails.User
		
		model.addAttribute("pageTitle", "¡Bienvenido a CVKARD!");
		return "index";
	}

	/**
	 * Home - vista de entrada al loguear
	 */
	@GetMapping("/home")
	public String home(HttpSession session, Principal principal) {
		
		if (principal != null && principal.getName() != null && session.getAttribute("user")== null) {
			try {
				User u = entityManager.createQuery("from User where email = :email", User.class)
		                            .setParameter("email", principal.getName())
		                            .getSingleResult();
				session.setAttribute("user", u);
			} catch (Exception e) {
				// TODO: handle exception
				System.err.println(e);
			}
		}
		return "home";
	}
	/**
	 * curriculum - Vista de portfolio del usuario "Empleado" 
	 */
	@GetMapping("/curriculum/{nick}")
	public String curriculum(@PathVariable("nick") String nick,HttpSession session,
			Model model) {
		String url = "index";
		log.info("Buscando usuario con nick: '"+nick+"'\n");
		try {
			if(session.getAttribute("user")==null){
			User u = entityManager.createQuery("from User where nick = :nick", User.class)
	                            .setParameter("nick", nick)
	                            .getSingleResult();
			model.addAttribute("user", u);
			}
			url = "curriculum";
		} catch (Exception e) {
			// TODO: handle exception
			log.error(e);
		}
		return url;
	}

	/**  ????????????????????????
	 * Contact - Vista formulario de contacto entre usuarios 
	 */
	@GetMapping("/contacto")
	public String contacto() {
		return "contacto";
	}

	/**
	 * Empresas - vista del conjunto de negocios acreditados en la web
	 */
	@GetMapping("/empresas")
	public String empresas() {
		return "empresas";
	}

	/**
	 * Ofertas - vista del conjunto de ofertas lanzadas por los negocios
	 */
	@GetMapping("/ofertas")
	public String ofertas() {
		return "ofertas";
	}

	/**
	 * Registro - vista de formulario de registro de un usuario nuevo a la web
	 */
	@GetMapping("/registro")
	public String registro() {
		return "registro";
	}

	/**
	 * Buscador - ???????????????????????????????????????????????
	 */
	@GetMapping("/buscador")
	public String buscador() {
		return "buscador";
	}

	/**
	 * Proyecto - vista sobre los detalles y referencias de un proyecto concreto
	 */
	@GetMapping("/proyecto/{id}")
	public String proyecto(Model model,@PathVariable("id") long id, HttpSession session) {
		User u = (User) session.getAttribute("user");
		u= entityManager.find(User.class, u.getId());
		Proyect p = entityManager.find(Proyect.class, id);
		
		log.info("refresh de proyecto."+ p.getId());
		
		session.setAttribute("user", u);
		model.addAttribute("proyect", p);
		model.addAttribute("participante", p.getMembers());
		model.addAttribute("tags",p.getTags());
		model.addAttribute("languages",p.getLanguages());
		
		
		
		return "proyecto";
		
	}
	
	/**
	 * editProyect -  vista de edición de un proyecto
	 */
	@GetMapping("/editProyect/{id}")
	@Transactional
	public String editProyect(Model model,@PathVariable("id") long id, HttpSession session) {
		String exit="home";
		User u = (User) session.getAttribute("user");
		u= entityManager.find(User.class, u.getId());
		Proyect p = entityManager.find(Proyect.class, id);
		
		log.info("refresh de proyecto."+ p.getId());
		
		session.setAttribute("user", u);
		model.addAttribute("proyect", p);
		model.addAttribute("tags",p.getTags());
		exit="editProyect";
		
		
		return exit;
	}
	
	
	/**
	 * Proyecto - vista sobre los detalles y referencias de un proyecto concreto
	 */
	@GetMapping("/showmessage/{type}/{id}")
	@Transactional
	public String showmessage(HttpSession session,Model model,
			@PathVariable("type") String type,
			@PathVariable("id") long id) {
		String url = "home";
		boolean correct=false;
		Message m = entityManager.find(Message.class, id);//refresh de la base de datos
		User u = (User) session.getAttribute("user");
		if(type.equals("R")){//comprobamos si está en recibidos
			model.addAttribute("entry",true);
			if(m.getReceiver().getId() == u.getId()){//si existe dentro de los recibidos lo habilitamos
				correct = true;
				model.addAttribute("correo",m.getSender().getEmail());
				if(!m.getRead()){
					log.info("Mensaje "+id+ " actualizado como 'leido'");
					m.setRead(true);
				}
			}
		}else{//sino lo asignamos a enviados por lo que leido no nos incumbe
			model.addAttribute("entry",false);
			if(m.getSender().getId() == u.getId()){//si existe dentro de los enviados lo habilitamos
				correct = true;
				model.addAttribute("correo",m.getReceiver().getEmail());
			}
		}
		if(correct){//si está habilitado asignamos al modelo el mensaje
			model.addAttribute("mensaje", m);
			url = "showmessage";
		}
		
		return url;
	}
	/**
	 * Buzon - vista del correo de entrada/salida de un usuario registrado
	 */
	@GetMapping("/buzon/{type}/{pag}")
	@Transactional
	public String buzon(HttpSession session,HttpServletResponse response,
			@PathVariable("pag") String pag,@PathVariable("type") String type,
			Model model) {
		String exit = "home";
		if(type.equals("N")){
			model.addAttribute("type", type);
			exit = "buzon";
		}else{
		try {
			log.info("pagina de buzon : "+pag);
				if(pag.equals("1")){
					User u = (User) session.getAttribute("user");
					log.info("carga el usuario : "+u.getName());
					u = entityManager.find(User.class, u.getId());//refresh de la base de datos
					log.info("refresh de usuario lanzado.");
					if(type.equals("R")){
						model.addAttribute("size",u.getReceivedMessages().size());
						log.info("numero de mensajes recibidos: "+u.getReceivedMessages().size());
					}else if(type.equals("E")){
						model.addAttribute("size",u.getSentMessages().size());
						log.info("numero de mensajes enviados: "+u.getSentMessages().size());
					}else{
						throw new EntityNotFoundException("opcion no contemplada");
					}
					session.setAttribute("user", u);	
					model.addAttribute("pag",pag);
					model.addAttribute("type", type);
				}
				exit = "buzon";
			} catch (NoResultException nre) {
				log.error("fallo al encontrar el usuario para actualizar");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}catch (EntityNotFoundException nre) {
				log.error(nre+": "+type);
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);		
			}
		}
		return exit;
	}

	/**
	 * Empresavista - vista sobre la información de un negocio y sus referencias
	 */
	@GetMapping("/empresavista")
	public String empresavista() {
		return "empresavista";
	}



	/**
	 * PerfilEmpresa - vista sobre el perfil de un negocio en concreto con sus configuraciones
	 */
	@GetMapping("/perfilempresa")
	public String perfilempresa(HttpSession session) {
		User u = (User) session.getAttribute("user");
		u = entityManager.find(User.class, u.getId());//refresh de la base de datos
		log.info(" cargamos la direccion  don id: "+u.getAddress().getId());
		session.setAttribute("user", u);
		return "perfilempresa";
	}

	/**
	 * PerfilUsuario - vista sobre el perfil de un aspirante a trabajador en concreto con sus configuraciones
	 */
	@GetMapping("/perfilusuario")
	public String perfilusuario() {
		return "perfilusuario";
	}



	/**
	 * TablaProyectos -  vista sobre los proyectos de un trabajador en concreto bajo su log y sus opciones de edición
	 */
	@GetMapping("/tablaproyectos/{type}/{pag}")
	@Transactional
	public String tablaproyectos(Model model,@PathVariable("pag") String pag,@PathVariable("type") String type, HttpSession session) {
		String exit="home";
		if(type.equals("N")){
			model.addAttribute("type",type);
			List<Tag> t = entityManager.createQuery("from Tag ", Tag.class).getResultList();
			
	        model.addAttribute("tags",t);
			
			exit="tablaproyectos";
		}
		else{
		
		User u = (User) session.getAttribute("user");
		u= entityManager.find(User.class, u.getId());
		log.info("refresh de usuario."+ u.getId());
		
		model.addAttribute("size",u.getProyects().size());
		model.addAttribute("pag",pag);
		
		model.addAttribute("proyects", u.getProyects());
		session.setAttribute("user", u);
		exit="tablaproyectos";
		
		}
		
		return exit;
	}
	
	@GetMapping("/editOffer/{id}")
	@Transactional
	public String editOffer(HttpSession session,Model model,
			@PathVariable("id") long id) {
		
		Offer f = entityManager.find(Offer.class, id);//refresh de la base de datos
		User u = (User) session.getAttribute("user");
		//si está habilitado asignamos al modelo el mensaje
			model.addAttribute("offer", f);
			String url = "editOffer";
		
		return url;
	}
	
	/**
	 * TablaOfertas - vista sobre las ofertas de un negocio en concreto bajo su log y sus opciones de edición
	 */
	@GetMapping("/tablaofertas/{pag}")
	@Transactional
	public String tablaofertas(HttpSession session,HttpServletResponse response,
			@PathVariable("pag") String pag,
			Model model) {
		String exit = "home";
		
		try {
			log.info("pagina de ofertas : "+pag);
				if(pag.equals("1")){
					User u = (User) session.getAttribute("user");
					log.info("carga el usuario : "+u.getName());
					u = entityManager.find(User.class, u.getId());//refresh de la base de datos
					log.info("refresh de usuario lanzado.");
					model.addAttribute("size",u.getOffers().size());
					log.info("Tamaño."+u.getOffers().size());
					session.setAttribute("user", u);	
					model.addAttribute("pag",pag);
					model.addAttribute("offers", u.getOffers());
					
				}
				exit = "tablaofertas";
			} catch (NoResultException nre) {
				log.error("fallo al encontrar el usuario para actualizar");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}catch (EntityNotFoundException nre) {
				
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);		
			}
		
		return exit;
	}
	
	/**
	 * OfertaVista - vista sobre la información de una oferta en concreto y sus referencias
	 */

	@GetMapping("/ofertas/ofertavista/{id}")
	@Transactional
	public String ofertavista(HttpSession session,Model model,
			@PathVariable("id") long id) {
		String url = "home";
		
		Offer f = entityManager.find(Offer.class, id);//refresh de la base de datos
		User u = (User) session.getAttribute("user");
		//si está habilitado asignamos al modelo el mensaje
			model.addAttribute("offer", f);
			url = "ofertavista";
		
		
		return url;
	}

	
	@GetMapping("/ofertas/{pag}")
	@Transactional
	public String ofertas(HttpSession session,HttpServletResponse response,
			@PathVariable("pag") String pag,
			Model model) {
		String exit = "home";
		
		try {
			log.info("pagina de ofertas : "+pag);
				if(pag.equals("1")){
					User u = (User) session.getAttribute("user");
					log.info("carga el usuario : "+u.getName());
					u = entityManager.find(User.class, u.getId());//refresh de la base de datos
					log.info("refresh de usuario lanzado.");
					model.addAttribute("size",u.getOffers().size());
					log.info("Tamaño."+u.getOffers().size());
					session.setAttribute("user", u);	
					model.addAttribute("pag",pag);
					model.addAttribute("offers", u.getOffers());
					
				}
				exit = "ofertas";
			} catch (NoResultException nre) {
				log.error("fallo al encontrar el usuario para actualizar");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}catch (EntityNotFoundException nre) {
				
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);		
			}
		
		return exit;
	}
	@GetMapping("/tag/{id}/{pag}")
	@Transactional
	public String tag(Model model,@PathVariable("id") Long id,@PathVariable("pag") String pag, HttpSession session) {
		String exit="home";
		
		
		User u = (User) session.getAttribute("user");
		u= entityManager.find(User.class, u.getId());
		log.info("refresh de usuario."+ u.getId());
		Tag t= entityManager.find(Tag.class, id);
		//Solo proyectos por ahora
		model.addAttribute("size",t.getProyects().size());
		model.addAttribute("pag",pag);
		model.addAttribute("tag",t);
		
		session.setAttribute("user", u);
		model.addAttribute("proyects", t.getProyects());
		exit="tag";
		
		
		
		return exit;
	}
	
	@GetMapping("/proyectos/{pag}")
	@Transactional
	public String proyectos(Model model,@PathVariable("pag") String pag, HttpSession session) {
		String exit="home";
		
		User u = (User) session.getAttribute("user");
		u= entityManager.find(User.class, u.getId());
		log.info("refresh de usuario."+ u.getId());
		List<Proyect> p = entityManager.createQuery(" from Proyect order by id DESC", Proyect.class).getResultList();

               
		
		//Solo proyectos por ahora
		model.addAttribute("sizeProyect",p.size());
		model.addAttribute("pag",pag);
		model.addAttribute("proyects",p);
		
		session.setAttribute("user", u);
		exit="proyectos";
		
		
		
		return exit;
	}
	
}

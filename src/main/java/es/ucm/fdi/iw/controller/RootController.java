package es.ucm.fdi.iw.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import es.ucm.fdi.iw.model.Message;
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
	public String curriculum(@PathVariable("nick") String nick,HttpSession session) {
		String url = "welcome";
		log.info("Buscando usuario con nick: '"+nick+"'\n");
		try {
			User u = entityManager.createQuery("from User where nick = :nick", User.class)
	                            .setParameter("nick", nick)
	                            .getSingleResult();
			session.setAttribute("user", u);
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
	@GetMapping("/proyecto")
	public String proyecto() {
		return "proyecto";
	}

	/**
	 * Buzon - vista del correo de entrada/salida de un usuario registrado
	 */
	@GetMapping("/buzon/{pag}")
	@Transactional
	public String buzon(HttpSession session,HttpServletResponse response,
			@PathVariable("pag") String pag,Model model) {
		try {
			log.info("pagina de buzon : "+pag);
				if(pag.equals("1")){
					User u = (User) session.getAttribute("user");
					log.info("carga el usuario : "+u.getName());
					u = entityManager.find(User.class, u.getId());//refresh de la base de datos
					log.info("refresh de la base de datos lanzado.");
					//Hibernate.initialize(u.getReceivedMessages());
					/*for(int i = 1;i< 50;i++){
					Message m = new Message();
					m.setBody("cuerpo del mensaje para el id = "+i);
					m.setSubject("asunto para id = "+i);
					m.setDescription("mi descripcion para id = "+i);
					m.setReceiver(u);
					u.getReceivedMessages().add(m);
					entityManager.persist(m);
					}*/
					log.info("tamaño de los mensajes recibidos actualizado: "+u.getReceivedMessages().size()+"\n");
					session.setAttribute("user", u);	
					model.addAttribute("pag",pag);
				}
			} catch (NoResultException nre) {
				log.error("fallo al encontrar el usuario para actualizar\n");
				response.setStatus(HttpServletResponse.SC_NOT_FOUND);
				
			}			
		return "buzon";
	}

	/**
	 * Empresavista - vista sobre la información de un negocio y sus referencias
	 */
	@GetMapping("/empresavista")
	public String empresavista() {
		return "empresavista";
	}

	/**
	 * OfertaVista - vista sobre la información de una oferta en concreto y sus referencias
	 */
	@GetMapping("/ofertavista")
	public String ofertavista() {
		return "ofertavista";
	}

	/**
	 * PerfilEmpresa - vista sobre el perfil de un negocio en concreto con sus configuraciones
	 */
	@GetMapping("/perfilempresa")
	public String perfilempresa() {
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
	 * TablaOfertas - vista sobre las ofertas de un negocio en concreto bajo su log y sus opciones de edición
	 */
	@GetMapping("/tablaofertas")
	public String tablaofertas() {
		return "tablaofertas";
	}

	/**
	 * TablaProyectos -  vista sobre los proyectos de un trabajador en concreto bajo su log y sus opciones de edición
	 */
	@GetMapping("/tablaproyectos")
	public String tablaproyectos() {
		return "tablaproyectos";
	}

}

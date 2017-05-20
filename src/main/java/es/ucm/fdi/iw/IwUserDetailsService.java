package es.ucm.fdi.iw;

import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import es.ucm.fdi.iw.model.User;

public class IwUserDetailsService implements UserDetailsService {

	private static Logger log = Logger.getLogger(IwUserDetailsService.class);

    private EntityManager entityManager;
    
    @PersistenceContext
    public void setEntityManager(EntityManager em){
        this.entityManager = em;
    }

    public UserDetails loadUserByUsername(String email){
    	 User u;
    	try {
	        u = entityManager.createQuery("from User where email = :email", User.class)
	                            .setParameter("email", email)
	                            .getSingleResult();
	        // build UserDetails object
	        ArrayList<SimpleGrantedAuthority> roles = new ArrayList<>();
	        for (String r : u.getRoles().split("[,]")) {
	        	roles.add(new SimpleGrantedAuthority("ROLE_" + r));
		        log.info("Roles for " + email + " include " + roles.get(roles.size()-1));
	        }
	        return new org.springframework.security.core.userdetails.User(
	        		u.getEmail(),
	        		u.getPassword(),
	        		roles); 
	    } catch (Exception e) {
    		log.info("No such user: " + email, e);
    		throw new UsernameNotFoundException("Bad username");
    	}
    	
    	/*EJEMPLO HECHO POR EL PROFE A MODO DE CONCEPTO
    	 ****
        ArrayList<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
	    roles.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
    	roles.add(new SimpleGrantedAuthority("ROLE_BUSSINES"));
        return new org.springframework.security.core.userdetails.User(
        		"paco", "123456", roles); */
    }
}
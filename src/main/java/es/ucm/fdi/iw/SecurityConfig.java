package es.ucm.fdi.iw;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		 http
		 .authorizeRequests()
		 	.antMatchers("/static/**","/registro","/download/showpdf/*","/user/photo/*","/curriculum/*","/user/newUserEmployee").permitAll()
		 	.antMatchers("/perfilusuario","/tablaproyectos").hasRole("EMPLOYEE")
		 	.antMatchers("/perfilempresa","/tablaofertas").hasRole("BUSSINES")
	        .anyRequest().authenticated()
	        .and()
	     .formLogin()
	 		.loginProcessingUrl("/login")
	     	.loginPage("/welcome")
	     	.defaultSuccessUrl("/home",true)
	     	.failureUrl("/welcome?error=usuario+o+password+incorrecto")
	 		.permitAll()
	     	.and()
	     .logout()
	     	.logoutUrl("/logout")
	     	.logoutSuccessUrl("/welcome")
	     	.permitAll();
	}

	@Bean
	public IwUserDetailsService springDataUserDetailsService() {
		return new IwUserDetailsService();
	}
	/**
	 * Encripta la password introducida
	 * @return :password encriptada
	 */
	@Bean
	public BCryptPasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
		
	}
	
	@Autowired
	private Environment env;
	
    @Bean(name="localData")
    public LocalData getLocalData() {
    	return new LocalData(new File(env.getProperty("es.ucm.fdi.base-path")));
    }    
}
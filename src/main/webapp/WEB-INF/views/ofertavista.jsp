<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CVKard - Empresas</title>
    <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
    <link rel="stylesheet" type="text/css"  href="${s}css/components.css">  
    <link rel="stylesheet" type="text/css"  href="${s}css/responsee.css"> 
    <link rel="stylesheet" type="text/css"  href="${s}css/template-style.css"> 
    <link rel="stylesheet" type="text/css"  href="${s}css/style.css"> 

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
</head>

<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
    </div>
    <%@ include file="../fragments/adds.jspf" %>
    <section>
    	<div id="head">
	        <div class="line">
	        	<h1>${offer.title}</h1>
	        </div>
      	</div>
      	<div id="content">
      		<div class="line">
	        	<section id="main" class="container">      
		           <div class="box">
		              	<div class="row">
			              	<div class="u">
			                    <div class="colum1">
<img src="/offer/photo/${offer.id}" alt="" width="200"
										height="150"/>			                    </div>
		                	</div>
		                	<div class="u">		             
			                    <div class="colum1">
			                   		<ul style="list-style:none;">
			                      		<li><h2>${user.name}</h2></li>

			                      		<li>${user.email}</li>			                      	
			                      	</ul>
			                    </div>
		                	</div>
		                	<div class="u2">		             
			                    <div class="colum1">
			                    	<ul style="list-style:none;">
				                   		<li><h4> Puntuacion: 
										<div class="ec-stars-wrapper">
											<a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
											<a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
											<a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
											<a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
											<a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
										</div>
										</h4>
										</li>
										<li></br>
										<h4>Tags</h4>
											<a href="" class="w3-button">Videojuegos</a> ;
											<a href="" class="w3-button">NetherReam</a> ;
											<a href="" class="w3-button">Accion</a> ;
											<a href="" class="w3-button">Plataformas</a> 
										</li>
									</ul>						
			                    </div>
		                	</div>
		                </div>
		             </div>
		             <div class="box">
		             	<div class="row">
		             		<div class="u3">		             
			                    <div class="colum1">
			                    	<h3>Descripción Oferta</h3>
			  						<p>${offer.description}</p>                 
			                    </div>
			                </div>
			              
			           </div>
			           <div class="row">			        
							<img src="${s}images/oficina.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/mkx.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/injustice.jpg" alt=""WIDTH=200 HEIGHT=140/>
							<img src="${s}images/villians.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80 style="padding-top:1.8em;"/>
			           </div>
			       	</div>
			              
		             <div class="box">
				<section>
					<h3>Solicitar oferta</h3>
					 <form method="post" action="#">
					 	<div class="row">
		                    <div class="u">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><input type="text" name="name" id="name" value="" placeholder="Name"></li></br>
		                    			<li><input type="text" name="mobile" id="mobile" value="" placeholder="Mobile"></li></br>
		                    			<li>
					                    	<input type="checkbox" id="copy" name="copy">
					                    	<label for="copy">Email me a copy of this message</label>
					                    </li>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="u">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><input type="email" name="email" id="email" value="" placeholder="Email"></li></br>
		                    			 <li>
					                    	<div class="select-wrapper">
						                        <select name="category" id="category">
						                          <option value="">- Disponibilidad -</option>
						                          <option value="1">Tiempo completo</option>
						                          <option value="1">Tarde</option>
						                          <option value="1">Mañana</option>
						                          <option value="1">Otra</option>
						                        </select>
                      						</div> </br>
                      					</li>
                      					<li>
		                    				<input type="checkbox" id="human" name="human" checked="">
                      						<label for="human">I am a human and not a robot</label>
                      					</li>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="u2">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea></li>
		                    			
		                    		</ul>		                    		     
		                    	</div>
		                    </div>
		                    
		                </div>
		                <div class="row">
		                	<div class="u2">
		                    	<div class="column1">
		                    		<input type="submit" value="Send Email">
		                    	</div>
		                    </div>
		                    
		                    <div class="u2">
		                    	<div class="column1">
		                    		<input type="reset" value="Clear" >
		                    	</div>
		                    </div>
		                </div>
					 </form>				
				</section>
			</div>
		             
		             
					
            </section>
          </div>
	          	
        	</div>
    </section>
    
    <!-- FOOTER -->   
      
	 <%@ include file="../fragments/footer.jspf" %>


		</div>


    <!-- Scripts -->
    
      <script src="${s}js/jquery.min.js"></script>
      <script src="${s}js/jquery.dropotron.min.js"></script>
      <script src="${s}js/login.js"></script>
      <script src="${s}js/jquery.scrollgress.min.js"></script>
      <script src="${s}js/skel.min.js"></script>
      <script src="${s}js/util.js"></script>
      <script src="${s}js/main.js"></script>
   </body>
</html>
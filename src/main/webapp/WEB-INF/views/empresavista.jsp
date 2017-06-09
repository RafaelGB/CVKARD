<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CVKard - Empresa</title>
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

    <section>
    	<div id="head">
      	</div>
      	<div id="content">
      		<div class="line">
	        	<section id="main" class="container">      
		            <div class="box">
		              	<div class="row">
			              	<div class="u">
			                    <div class="colum1">
			                     <img src="/user/photo/${user.id}" alt="" width="200"
										height="150" />
			                    </div>
		                	</div>
		                	<div class="u">		             
			                    <div class="colum1">
			                   		<ul style="list-style:none;">
			                      		<li><h2>${user.name}</h2></li>
			                      		<li>${user.address}</li>
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
										
									</ul>						
			                    </div>
		                	</div>
		                </div>
		             </div>
		             <div class="box">
		             	<h3>Carta de Presentación</h3>
		             	<p>${user.card}</p>
		             	<!--  <div class="row">
							<img src="${s}images/oficina.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/mkx.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/injustice.jpg" alt=""WIDTH=200 HEIGHT=140/>
							<img src="${s}images/villians.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80 style="padding-top:1.8em;"/>
						</div> -->        
		             </div>
	
			<div class="box">
				<h3>OFERTAS </h3>
             	<div class="row">
                <div class="u">
                  <div class="colum1">
                    <img src="${s}images/nr.png" alt="" WIDTH=150 HEIGHT=150/>
                  </div>
                  <ul style="list-style:none;">
                  <li>Desarrollo Videojuegos</li>
                  <li>Breve Descripcion de la oferta</li>
                  <li>Valoracion</li>
                </div>
                <div class="u">
                  <div class="colum1">
                    <img src="${s}images/i2.jpg" alt="" WIDTH=150 HEIGHT=150/>
                  </div>
                  <ul style="list-style:none;">
                  <li>Injustice 2</li>
                  <li>Breve Descripcion de la oferta</li>
                  <li>Valoracion</li>
                </div>
                <div class="u">
                  <div class="colum1">
                    <img src="${s}images/mkl.jpg" alt="" WIDTH=150 HEIGHT=150/>
                  </div>
                  <ul style="list-style:none;">
                  <li>Mortal kombat x</li>
                  <li>Breve Descripcion de la oferta</li>
                  <li>Valoracion</li>
                </div>
                <div class="u">
                  <div class="colum1">
                    <img src="${s}images/rh.jpg" alt="" WIDTH=150 HEIGHT=150/>
                  </div>
                  <ul style="list-style:none;">
                  <li>Recursos humanos</li>
                  <li>Breve Descripcion de la oferta</li>
                  <li>Valoración</li>
                </div>
              </div>
             <a href="#" class="button special small" style="float:right;">Mostrar más</a>
            </div>
	
				</div>	
            </section>
          </div>
	          	
        	</div>
    </section>
      <!-- FOOTER -->   
    <%@ include file="../fragments/footer.jspf" %>

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
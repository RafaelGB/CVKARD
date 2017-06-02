<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>${proyect.title}</title>
    <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
    <link rel="stylesheet" type="text/css"  href="${s}css/components.css">  

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
</head>

<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
    </div>

    <section>
    	<div id="head"></div>
      	<div id="content">
      		<div class="line">
	        	<section id="main" class="container">      
		            <div class="box">
		              	<div class="row">
			              	<div class="u">
			                    <div class="colum1">
			                      <img src="/proyect/photo/${proyect.id}" alt="" width="200" height="150/">
			                    </div>
		                	</div>
		                	<div class="u">		             
			                    <div class="colum1">
			                   		<ul style="list-style:none;">
			                      		<li><h2>${proyect.title}</h2></li>
			                      		<c:forEach items="${participante}" var="p" >
			                      		<li>${p.name}</li>
			                      		</c:forEach>		                      	
			                      	</ul>
			                    </div>
		                	</div>
		                	<div class="u2">		             
			                    <div class="colum1">
			                    	<ul style="list-style:none;">
				                   		<li><h4> Puntuacion: </h4>
										<div class="ec-stars-wrapper">
											<a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
											<a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
											<a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
											<a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
											<a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
										</div>
										
										</li>
										<li>
										<h4>Tags</h4>
											<a href="" class="w3-button">Diseno Web</a> ;
											<a href="" class="w3-button">Pagina web</a> ;
											<a href="" class="w3-button">Ingenieria Web</a> ;
											<a href="" class="w3-button">Universidad Complutense</a> 
										</li>
									</ul>						
			                    </div>
		                	</div>
		                </div>
		             </div>
		             <div class="box">
						
						<h3>Explicacion Proyecto</h3>
						<p>${proyect.description}</p>
								
						<div class="row">
							<img src="${s}images/logo.png" alt="" WIDTH=140 HEIGHT=100/>
							<img src="${s}images/d.png" alt="" WIDTH=140 HEIGHT=100/>
							<img src="${s}images/s.png" alt="" WIDTH=140 HEIGHT=100/>
							<img src="${s}images/m.png" alt="" WIDTH=140 HEIGHT=100/>
							<img src="${s}images/v.png" alt="" WIDTH=140 HEIGHT=100/>
							<img src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80 style="padding-top:1.8em;"/>
						</div>
					</div>
					
					<div class="box">
						<h3>Codigo proyecto</h3>
							<div class="row">
			              		<div class="u3">
			                   		<div class="colum1">							
										<textarea name="message" id="message" placeholder="Codigo" rows="6" readonly></textarea>
									</div>
								</div>
							</div><br>
							<a href="#" class="button special small" style="float:right;">Ver en GITHUB</a>
					</div>
	          	</section>
        	</div>
      	</div>
    </section>
      <!-- FOOTER -->   
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
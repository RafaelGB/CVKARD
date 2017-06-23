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
   <%@ include file="../fragments/adds.jspf" %>
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
			                      		<li><h2><c:out value="${proyect.title}"></c:out></h2></li>
			                      		<li><h4> Miembros: </h4></li>
			                      		<c:forEach items="${proyect.members}" var="members" >
			                      		<li><c:out value="${members.name}"></c:out></li>
			                      		</c:forEach>		                      	
			                      	</ul>
			                    </div>
		                	</div>
		                	<div class="u2">		             
			                    <div class="colum1">
			                    	<ul style="list-style:none;">
				                   		<sec:authorize access="hasRole('BUSSINES')">
				                   		<li><h4> Puntuacion: </h4>
										<div class="ec-stars-wrapper">
										<!-- En el security poner en usuario /puntuaProyect/** -->
											<a href="/proyect/puntuaProyect/${proyect.id}/1" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
											<a href="/proyect/puntuaProyect/${proyect.id}/2" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
											<a href="/proyect/puntuaProyect/${proyect.id}/3" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
											<a href="/proyect/puntuaProyect/${proyect.id}/4" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
											<a href="/proyect/puntuaProyect/${proyect.id}/5" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
										</div>
										
										
										</li>
										</sec:authorize>
										<li><h4> Puntuacion media: ${media}</h4>
										</li>
										<li>
										<h4>Tags</h4>
										<c:forEach items="${tags}" var="t" >
			                      		<a href="/tag/${t.id}/1" class="w3-button"><c:out value="${t.name}"></c:out></a>
			                      		</c:forEach>
										</li>
										<li>
										<h4>Lenguajes</h4>
										<c:forEach items="${languages}" var="l" >
			                      		<a href="/language/${l.id}/1" class="w3-button"><c:out value="${l.name}"></c:out></a>
			                      		</c:forEach>
										</li>
									</ul>						
			                    </div>
		                	</div>
		                </div>
		             </div>
		             <div class="box">
						
						<h3>Explicacion Proyecto</h3>
						<p><c:out value="${proyect.description}"></c:out></p>
					</div>
					
					<div class="box">
						<a href="${proyect.link}" class="button special small" style="float:right;">Ver en GITHUB</a>
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

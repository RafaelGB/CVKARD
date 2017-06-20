<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CVKard - Empresas</title>
    <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
    <link rel="stylesheet" type="text/css"  href="${s}css/style.css"> 
    <script src="${s}resources/js/passwords.js"></script>
    <script src="${s}resources/js/mail.js"></script>
    <script src="${s}resources/js/reqUsuario.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
    <style type="text/css">
      
         ul.radio_search li{
            display: inline-block;
         }       
     
   </style>
</head>
   
<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;">
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
    </div>

    <section>
      <div id="head">
           <div class="line">
            <h1>BUSCADOR</h1>
           </div>
      </div>
      <div id="content">
         <div class="line">
           <section id="main" class="container">  
           
      
                <div class="box" style="padding-bottom:0px">
                  <div class="row">
                  	 <c:when test="${type=='P'}">
	                    <c:forEach items="${proyects}" var="p" begin="${(pag-1)*4}" end="${((pag-1)*4)+3}" >
		   					<div class="u">
			   					<div class="colum1">
		       					<img src="/proyect/photo/${p.id}" alt="" width="100" height="100/">
								</div>
								<ul style="list-style:none;">
		                   		<li><a href="/proyecto/${p.id}"><c:out value="${p.title}"></c:out></a></li>
		                   		<li><c:out value="${p.description}"></c:out></li>
		                   		<li><a href="/proyecto/${p.id}"
									class="button special small">Proyecto</a></li>
		                   		</ul>
	                   		</div>
	               		</c:forEach> 
	               	</c:when>
	               	<c:when test="${type=='O'}">
	                    <c:forEach items="${offers}" var="o" begin="${(pag-1)*4}" end="${((pag-1)*4)+3}" >
		   					<div class="u">
			   					<div class="colum1">
		       					<img src="/proyect/photo/${p.id}" alt="" width="100" height="100/">
								</div>
								<ul style="list-style:none;">
		                   		<li><a href="/proyecto/${o.id}"><c:out value="${o.title}"></c:out></a></li>
		                   		<li><c:out value="${o.description}"></c:out></li>
		                   		<li><a href="/proyecto/${o.id}"
											class="button special small">Oferta</a></li>
		                   		</ul>
	                   		</div>
	               		</c:forEach> 
	               	</c:when>
	               	<c:when test="${type=='E'}">
	                    <c:forEach items="${business}" var="b" begin="${(pag-1)*4}" end="${((pag-1)*4)+3}" >
		   					<div class="u">
			   					<div class="colum1">
		       					<img src="/proyect/photo/${b.id}" alt="" width="100" height="100/">
								</div>
								<ul style="list-style:none;">
		                   		<li><a href="/proyecto/${b.id}"><c:out value="${b.title}"></c:out></a></li>
		                   		<li><c:out value="${b.description}"></c:out></li>
		                   		<li><a href="/proyecto/${b.id}"
											class="button special small">Empresa</a></li>
		                   		</ul>
	                   		</div>
	               		</c:forEach> 
	               	</c:when>
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
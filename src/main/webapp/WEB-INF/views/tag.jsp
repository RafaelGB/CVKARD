<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CVKard - Tag</title>
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
        <div class="line">
           <h1>${tag.name}</h1>
        </div>
      </div>
      <div id="content">
        <div class="line">
          <section id="main" class="container"> 
          <div class="box" id="site">
              <a href="../IW/index.html"> Home > </a> <a id="actual">Ofertas </a>

          </div>

            <div class="box">
            <h2>Proyectos de este tag</h2>
              <div class="row">
                  
                    <!--  <div class="colum1">
                      <img src="${s}images/oferta.png" alt="" WIDTH=150 HEIGHT=150/>
                    </div>-->
                    
                    <c:forEach items="${proyects}" var="p" >
		   					<div class="u">
			   					<div class="colum1">
		       					<img src="/proyect/photo/${p.id}" alt="" width="100" height="100/">
								</div>
								<ul style="list-style:none;">
		                   		<li><c:out value="${p.title}"></c:out></li>
		                   		<li><c:out value="${p.description}"></c:out></li>
		                   		</ul>
	                   		</div>
                   		</c:forEach>
                    
            </div>
            </div>
             <div class="w3-bar w3-border w3-round">
                <div class="w3-bar">
                  <a href="#" class="w3-bar-item w3-button"> &laquo; </a>
                  <a href="#" class="w3-button"> 1 </a>
                  <a href="#" class="w3-button"> 2 </a>
                  <a href="#" class="w3-button"> 3 </a>
                  <a href="#" class="w3-button"> 4 </a>
                  <a href="#" class="w3-button"> &raquo; </a>
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
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	 <title>CVKARD - Curriculum</title>
     <meta name="viewport" content="width=device-width, initial-scale=1" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

     <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
     <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
     <link rel="stylesheet" type="text/css"  href="${s}css/components.css">
     <link rel="stylesheet" type="text/css"  href="${s}css/responsee.css">
     <link rel="stylesheet" type="text/css"  href="${s}css/template-style.css">
     <link rel="stylesheet" type="text/css"  href="${s}css/style.css" />
 	 <script src="${s}tools/ckeditor/ckeditor.js"></script>
 	 <script src="${s}js/curriculum.js"></script>
     <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
     	
</head>

<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
  <div id="page-wrapper">
   <%@ include file="../fragments/header.jspf" %>
  </div>
   <%@ include file="../fragments/adds.jspf" %>
     <div id="head">
       <div class="line">
          <h1>CURRICULUM</h1>
       </div>
     </div>
     <div id="content">
    	<div class="line">
         <section id="main" class="container">      
             <div class="box">
               <div class="row">
                <div class="u">
                    <div class="colum1">
                      <img src="/user/photo/${user.id}" alt="" width="200"	height="150/">
                    </div>
                </div>
                <div class="u">
                    <div class="colum1">
                    	<h3>${user.name} ${user.lastName}</h3>
                     	<ul style="list-style:none;">		              
		                    <li>${user.DNI}</li>
		                    <li>${user.birthday}</li>
		                    <li>Domicilio</li>		               
	                   </ul>
                    </div>
                </div>
                <div class="u2">
                    <div class="colum1">
                    	<h3>ESTUDIOS Y CURSOS</h3>
                     	<ul style="list-style:none;">		              
		                    <li>Estudio 1</li>
		                    <li>Estudio 2</li>
		                    <li>Estudio 3</li>		               
	                   </ul>
                    </div>
                </div>
                
               </div>
               </div>
               <div class="box">
               <h3>Proyectos realizados</h3> 
             	
             	<div class="row">
                 <div class="u">
                   <div class="colum1">
                     <img src="${s}images/oferta.png" alt="" WIDTH=150 HEIGHT=150/>
                   </div>
                   <ul style="list-style:none;">
                   <li>Proyecto</li>
                   <li>Breve Descripcion del proyecto</li>
                   <li>Ha escrito 500 lineas</li></br>
                 </div>
                 <div class="u">
                 <div class="colum1">
                   <img src="${s}images/oferta1.png" alt="" WIDTH=150 HEIGHT=150/>
                 </div>
                 <ul style="list-style:none;">
                   <li>Proyecto</li>
                   <li>Breve Descripcion del proyecto</li>
                   <li>Ha escrito 500 lineas</li></br>
               </div>
               <div class="u">
                 <div class="colum1">
                   <img src="${s}images/oferta2.png" alt="" WIDTH=150 HEIGHT=150/>
                 </div>
                 <ul style="list-style:none;">
                  <li>Proyecto</li>
                   <li>Breve Descripcion del proyecto</li>
                   <li>Ha escrito 500 lineas</li></br>
               </div>
               <div class="u">
                 <div class="colum1">
                   <img src="${s}images/oferta3.png" alt="" WIDTH=150 HEIGHT=150/>
                 </div>
                 <ul style="list-style:none;">
                   <li>Proyecto</li>
                   <li>Breve Descripcion del proyecto</li>
                   <li>Ha escrito 500 lineas</li></br>
               </div>
           </div>
             <a href="#" class="button special small" style="float:right;">Mostrar mas</a>
           </div>
           <div class="box">
             <h3>Carta de Presentacion</h3>
	        <form id="pdf_form" action="/download/showpdf/${user.id}" method="post">
	            <textarea name="vitae" id="vitae" rows="10" cols="80" disabled="disabled">
	                ${user.card}
	            </textarea>
	            <input type="text" name="ckeditor_data" id="ckeditor_data" style="visibility:hidden;"> </input>
	            <input name="${_csrf.parameterName}" type="hidden"
						value="${_csrf.token}" />
				<input type="button" onclick="downloadpdf()" value="Descargar PDF"></input>
	            <script>
	                // Replace the <textarea id="editor1"> with a CKEditor
	                // instance, using default configuration.
			        CKEDITOR.replace( 'vitae');
	            </script>
	        </form>
	    <div id="download_div" style="background:url(${s}images/animal.gif) no-repeat center center;width:80px;height:80px;visibility:hidden;">
   	  	</div>
           </div>
		<sec:authorize access="isAnonymous()">
			<div class="box">
				<section>
					<h3>Contacta Conmigo</h3>
					 <form id="contact-form" action="/message/createExternalMessage/${user.id}" method="POST">
					 	<div class="row">
		                    <div class="u">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><input type="email" name="sender-form" id="sender-form"  placeholder="tu email..."></li></br>
		                    			<li><input type="text" name="subject-form" id="subject-form" placeholder="Asunto"></li></br>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="u">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
	                    			 	<li>
					                    	<div class="select-wrapper">
						                        <select name="category" id="category">
						                          <option value="Category">- Category -</option>
						                          <option value="Questions">Questions</option>
						                          <option value="Interview">Interview</option>
						                          <option value="Contract">Contract</option>
						                          <option value="Other">Other</option>
						                        </select>
	                   						</div> <br></br>
	                   					</li>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="u2">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><textarea name="message" id="message-form" placeholder="Enter your message" rows="6"></textarea></li>
		                    			
		                    		</ul>		                    		     
		                    	</div>
		                    </div>
		                    
		                </div>
		                <div class="row">
	                    	<div class="column1 u">
	                    		<input type="button" onclick="checkAndCreateMessage()" value="Enviar mensaje">
	                    	</div>
	                    	<div class="column1 u2">
	                    		<button type="reset">Limpiar mensaje</button>
	                    	</div>
		                </div><br></br>
		                 <div id="myRecaptcha"></div>
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					 </form>
				 	 <h3><%
				     if (request.getParameter("contact") != null) {
				        out.println(request.getParameter("contact"));
				     }
					 %></h3>				
				</section>
			</div>
	  	</sec:authorize>
    </section>

	  <!-- FOOTER -->   

    <%@ include file="../fragments/footer.jspf" %>


    <!-- Scripts -->
      <script>
      function downloadpdf(){
    	  var $mygif = document.getElementById ("download_div");
    	  $mygif.style.visibility = "visible";
    	  var data = CKEDITOR.instances.vitae.getData();
    	  document.getElementById("ckeditor_data").value = data;
    	  document.getElementById("pdf_form").submit();
    	  setTimeout(function() {
    		  $mygif.style.visibility = "hidden";
    		}, 5000);
      }
      </script>
      <script src="https://www.google.com/recaptcha/api.js?onload=CaptchaCallback&render=explicit" async defer></script>
      <script src="${s}js/jquery.min.js"></script>
      <script src="${s}js/jquery.dropotron.min.js"></script>
      <script src="${s}js/login.js"></script>
      <script src="${s}js/jquery.scrollgress.min.js"></script>
      <script src="${s}js/skel.min.js"></script>
      <script src="${s}js/util.js"></script>
      <script src="${s}js/main.js"></script>
   </body>
</html>
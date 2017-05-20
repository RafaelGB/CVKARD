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

    <section>
    	<div id="head">
    	 <div class="line">
           <h1>EDITAR INFORMACION</h1>
        </div>
      	</div>
      	<div id="content">
      		<div class="line">
	        	<section id="main" class="container">      
		            <div class="box">
		              	<div class="row">
			              	<div class="u">
			                    <div class="colum1">
			                      <img src="/user/photo/${user.id}" alt="" width="200" height="150/">
            	            <form id="formAvatar" action="user/photo/${user.id}" style ="visibility: hidden;"
								enctype="multipart/form-data" method="post">
								<input type="file" name="photo" size="40">
								<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
								<div>
									<input type="submit" value="Send">
								</div>
							</form>
			                    </div>
		                	</div>
		                	<form id="confirmUpdate" action="/user/updateInfoBusiness" style="visibility:hidden;" method="post">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
					 	<input type="submit" id="submit-form" /> 	
					</form>
		                	<div class="u">		             
			                    <div class="colum1">
			                          	<ul style="list-style:none;">	
	                     		<li   style="font-size:24px;margin-top:0.5em;">
									<input class="changingClass" type="text" disabled="disabled" id="name-form" name="name-form" form="confirmUpdate" value="${user.name}"/>
	                     		</li>      
	     
								
								        
			                    <li>
									<c:choose>
									    <c:when test="${!empty user.email}">
									           <input class="changingClass" type="text" disabled="disabled" id="email-form" name="email-form" form="confirmUpdate" value="${user.email}"/>  
									        <br />
									    </c:when>    
									    <c:otherwise>
									           <input class="changingClass" type="text" disabled="disabled" id="email-form" name="email-form" form="confirmUpdate" value="email!"/> 
									        <br />
									    </c:otherwise>
									</c:choose>
			                    </li>
			          
			                    <li class="changingClass">
			                    ${not empty user.address ? user.address : 'domicilio'}
								</li>              
		                   </ul>
			                    </div>
		                	</div>	                	
		                </div>
		                <a href="tablaofertas" class="button special small" style="float:right;">Editar Ofertas</a> 
		               <label for="submit-form" id="update_button" class="button special small" style="float:right;visibility: hidden;">Guardar Cambios</label>
	                <button onclick="updateState(this);"  style="float:right; margin-top:0.5em;">Activar edición</button>
		                  <span style="color: blue;">
		                  ${not empty param.update ?  param.update : ''}      
		                  </span>  
		                
		             </div>
		             <div class="box">
		             	<h3>Descripción </h3>
		             	<p contenteditable="true">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sodales porta venenatis. Aliquam tristique, purus id lacinia egestas, risus turpis iaculis eros, eget venenatis dolor magna eu ex. Nunc interdum varius urna sed lobortis. Sed feugiat, nulla sed imperdiet semper, metus risus aliquam odio, quis ullamcorper odio lorem at ante. Sed at dignissim leo. Morbi varius iaculis augue a consequat. Maecenas eget luctus purus. Sed venenatis efficitur lectus, ac posuere arcu tincidunt et. Vestibulum auctor nulla nec molestie tincidunt. Curabitur congue massa in dignissim fermentum. Mauris vel dapibus lacus, eget volutpat leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		             	<div class="row">
							<img src="${s}images/oficina.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/mkx.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/injustice.jpg" alt=""WIDTH=200 HEIGHT=140/>
							<img src="${s}images/villians.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80 style="padding-top:1.8em;"/>
						</div></br>  
						<a href="#" class="button special small" style="float:right; margin-left:0.5em;">Guardar Cambios</a> 
						<a href="#" class="button special small" style="float:right;">Subir Fotos</a>          
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
      <script> 
	      function updateState(button){
	    	  var $div=$('.changingClass');
	    	  var $update = document.getElementById ("update_button");
	    	  var $avatar = document.getElementById ("formAvatar");
	    	  if($update.style.visibility == 'hidden'){
	    		  $div.attr('disabled',false);
	    		  $div.attr('contentEditable',true);
	    		  $update.style.visibility = "visible";
	    		  $avatar.style.visibility = "visible";
	    		  button.innerHTML = "Desactivar edición";
	    	  }
	    	  else{
	    		  $div.attr('disabled',true);
	    		  $div.attr('contentEditable',false);
	    		  $update.style.visibility = "hidden";
	    		  $avatar.style.visibility = "hidden";
	    		  button.innerHTML = "Activar edición";
	    	  }
	      }
      </script>
   </body>
</html>
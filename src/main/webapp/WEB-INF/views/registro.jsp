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
    <script src="${s}js/registro.js"></script>
    

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
</head>

<body class="landing" onload="javascript:cambiarPestanna(pestanas,pestana1);" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;" >
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
    </div>

    <section>
      <div id="head">
        
      </div>

      <div id="content">

        <div class="line">
 
          <section id="main" class="container"> 

    
                                              <div class="tab">
   <input class="tablinks" onclick="openCity(event, 'Usuario')"  id="defaultOpen" type="submit" value="USUARIO"></input>                                            
  <input class="tablinks" onclick="openCity(event, 'Empresa')" type="submit" value="EMPRESA"></input>
 
</div>
                <div id="Usuario" class="tabcontent">
                 <div class="box">
  				<form method="post" action="#">
				 	<div class="row">
	                    <div class="u2">
	                    	<div class="column1">
	                    		<ul style="list-style:none;">
	                    			<li><input type="text" name="name" id="name" value="" placeholder="Name"></li></br>
	                    			<li><input type="text" class="form-control" name="username" id="username" onclick="reqUsuario()" placeholder="Indique su usuario"/></li></br>
	                    			<li><input type="password" class="form-control" name="password" id="id_password"  placeholder="Password"/></li></br>                 		                    		
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
	                    			<li><input type="email" name="user" id="user" value="" placeholder="Last Name"></li></br>
	                    			<li><input type="text" class="form-control" name="email" id="id_email"  placeholder="Indique su email" onchange="javascript:validateMail('id_email')"/></li></br>		                    		
			                    	<li><input type="password" class="form-control" name="password2" id="id_password2"  placeholder="Confirm your password"/></li></br>
									<li>
	                    				<input type="submit" value="CONFIRMAR">
	                    					</li>
	                    		</ul>
	                    	</div>
	                    </div>		                   		                    
	                </div>		               
			 	</form>		               
              </div>
                </div>
                <div id="Empresa" class="tabcontent">
                          
              <div class="box">
  				<form method="post" action="#">
				 	<div class="row">
	                    <div class="u2">
	                    	<div class="column1">
	                    		<ul style="list-style:none;">
	                    			<li><input type="text" name="name" id="name" value="" placeholder="Business Name"></li></br>
	                    			<li><input type="password" class="form-control" name="password" id="id_password"  placeholder="Password"/></li></br>                 		                    		
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
	                    			<li><input type="text" name="email" id="email" value="" placeholder="Email"></li></br>
			                    	<li><input type="password" class="form-control" name="password2" id="id_password2"  placeholder="Confirm your password"/></li></br>
									<li>
	                    				<input type="submit" value="CONFIRMAR">
	                    					</li>
	                    		</ul>
	                    	</div>
	                    </div>		                   		                    
	                </div>		               
			 	</form>		               
              </div>
                </div>
            
             
            </section>
      


           
        </div>
      </div>
    </section>
    <!-- FOOTER -->   
      
	 <%@ include file="../fragments/footer.jspf" %>
   </body>
</html>


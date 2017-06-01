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
</head>

<body class="landing" onload="javascript:cambiarPestanna(pestanas,pestana1);" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;" >
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
    </div>
	<h3 style="color:blue;">${feedback}</h3>
    <section>
      <div id="head">
        
      </div>

      <div id="content">

        <div class="line">
 
          <section id="main" class="container"> 
         <div class="tab">
   			<button  style="font-size: 20px;" class="tablinks" onclick="changeForm('Usuario')">USUARIO</button>                                            
  			<button  style="font-size: 20px;" class="tablinks" onclick="changeForm('Empresa')">EMPRESA</button>
		</div>
              <div id="employee" class="tabcontent">
              	<div class="box">
	  				<form id="employee-form" action="/user/newUserEmployee" method="POST">
					 	<div class="row">
		                    <div class="u2">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><input type="text" name="nameE" id="nameE"  placeholder="Nombre"></li></br>
		                    			<li><input type="text" class="form-control" name="nickE" id="nickE" placeholder="Indique su nick"/></li></br>
		                    			<li><input type="password" class="form-control" name="passE" id="passE"  placeholder="Password"/></li></br>                 		                    		
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="u2">
		                    	<div class="column1">
		                    		<ul style="list-style:none;">
		                    			<li><input type="text" name="lastNameE" id="lastNameE" placeholder="Last Name"></li></br>
		                    			<li><input type="email" class="form-control" name="emailE" id="emailE"  placeholder="Indique su email"/></li></br><!--  onchange="javascript:validateMail('id_email')"?¿? -->		                    		
				                    	<li><input type="password" class="form-control" name="passConfirmE" id="passConfirmE"  placeholder="Confirm your password"/></li></br>
										<li>
		                    				<input type="button" onclick="checkAndCreateE()" value="Verificar">
		                    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                    			</li>
		                    		</ul>
		                    	</div>
		                    </div>		                   		                    
		                </div>	
		                <div id="RecaptchaField1"></div>	   
                    </form>		               
              	</div>
              </div>
              <div id="bussines" class="tabcontent" style="display:none;">            
	              <div class="box">
		 				<form id="bussines-form" method="post" action="/user/newUserBussines">
						 	<div class="row">
			                    <div class="u2">
			                    	<div class="column1">
			                    		<ul style="list-style:none;">
			                    			<li><input type="text" name="nameB" id="nameB"  placeholder="Business Name"></li></br>
			                    			<li><input type="password" class="form-control" name="passB" id="passB"  placeholder="Password"/></li></br>
			                    		</ul>
			                    	</div>
			                    </div>
			                    <div class="u2">
			                    	<div class="column1">
			                    		<ul style="list-style:none;">
			                    			<li><input type="email" name="emailB" id="emailB" value="" placeholder="Email"></li></br>
					                    	<li><input type="password" class="form-control" name="passConfirmB" id="passConfirmB"  placeholder="Confirm your password"/></li></br>
											<li>
			                    				<input type="button" onclick="checkAndCreateB()" value="Verificar">
			                    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                    					</li>
			                    		</ul>
			                    	</div>
			                    </div>		                   		                    
			                </div>	
			                <div id="RecaptchaField2"></div>
			            </form>		               
	              </div>
              </div>
            
             
            </section>
      


           
        </div>
      </div>
    </section>
    <!-- FOOTER -->   
      
	 <%@ include file="../fragments/footer.jspf" %>
	 
	 <!-- Scripts -->
	  <script src="https://www.google.com/recaptcha/api.js?onload=CaptchaCallback&render=explicit" async defer></script>
   </body>
</html>


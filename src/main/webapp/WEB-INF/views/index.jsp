<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
	<head>
		<title>${pageTitle}</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${s}css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<link rel="stylesheet" href="${s}css/components.css" />
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
		<script src="${s}js/login.js"></script>
		
	</head>
	<body class="landing" style="background-image: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;">  <div id="page-wrapper">
<!-- Header -->
		<header id="header" class="alt">
			<nav id="nav">
				<div id="loginContainer">
	                <a href="#" class="button" id="loginButton"><span>Login</span></a>
	                <div style="clear:both"></div>
	                <div id="loginBox">                
	                    <form action= "<c:url value='/login'/>" id="loginForm" method = "POST">
	                        <fieldset id="body">
	                            <fieldset>
	                                <label for="loginEmail">Email Address</label>
	                                <input type="text" id="username" name="username" placeholder="Login"/>
	                            </fieldset>
	                            <fieldset>
	                                <label for="loginPass">Password</label>
	                                <input type="password" id="password" name="password" placeholder="Contraseña"/>
	                            </fieldset>
		                            <input class="button special" type="submit" id="login" value="Sign in" style="
   									padding-top: 0px;"/>
		                            <br><input type="checkbox" id="rememberMe" value="first_checkbox"><label for="rememberMe">Recuerdame</label><br>	
		                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	                            
							</fieldset>
							<span style="color: red;">
								<%
								    if (request.getParameter("error") != null)
								        out.println(request.getParameter("error"));
								%>
							</span>
	                       	<span><a href="#">Forgot your password?</a></span>
	                    </form>
	                </div>
	            </div>
			</nav>
		</header>

	<!-- Banner -->
		<section id="banner">
			<h2>CVKARD<img src="${s}images/logo1.png" id ="logo"/></h2>
			<p>Una carta de presentación para desarrolladores y empresas</p>
			<ul class="actions">
				<li><a href="/registro" class="button special">Registrate</a></li><br></br>
				<li><input type="text" name="nick" id="nick"  placeholder="escribe un nick..." /></li>
				<li><a href="#" onclick='searchingCV(this)' class="button special" id="search_button">Buscar CV</a></li>
			</ul>
		</section>

	<!-- Main -->
		<section id="main" class="container">

			<section class="box special features">
				<div class="features-row">
				<header class="major">
					<h2>Deslumbra a todos con una carta de presentación 
					<br />
					de tus proyectos y consigue trabajo al instante.</h2>
					<p>Gracias a CVKard podrás mostrar todos tus proyectos y creaciones y las empresas podrán contactar contigo </p>
				</header>
				</div>
			</section>
			<section>
				<span class="image featured"><img src="${s}images/proyecto.png" alt="" /></span>
			</section>

			<section class="box special features">
				<div class="features-row">
					<section>
						<span><img src="${s}images/users.png" alt="" /></span>
						<h3>Usuario</h3>
						<p>CVKard se compromete a proteger su privacidad, y compartir la información que el sólo el usuario desee. Notificaciones sobre posibles ofertas futuras o confirmaciones al vuelo por correo y/o mensajería instantánea, un marco de trabajo que muestre tus logros y proyectos, facilidades para compartir tus hilos de “Github”, podrás ver la popularidad de las empresas en función del feedback de sus trabajadores contratados...</p>
					</section>
					<section>
						<span><img src="${s}images/cityscape.png" alt="" /></span>
						<h3>Empresa</h3>
						<p>CVKard garantiza la fiabilidad de la información que muestran los usuarios con un sistema de rangos, así puede buscar a usuarios que quieran trabajar en lo que la empresa oferte, contactar con él y organizar la entrevista. La empresa podrá publicar ofertas de trabajo y recibir recomendaciones de usuarios que hayan trabajado en esos apartados pudiendo contactar diréctamente con dicho usuario.</p>
					</section>
				</div>
			</section>

		</section>


       <!-- FOOTER -->   
       <%@ include file="../fragments/footer.jspf" %>

    <!-- Scripts -->
    <script>
    function searchingCV(myLink){
    	myLink.href = "/curriculum/"+document.getElementById("nick").value;
    }
    </script>
      <script src="${s}resources/js/jquery.min.js"></script>
      <script src="${s}resources/js/jquery.dropotron.min.js"></script>
      <script src="${s}resources/js/jquery.scrollgress.min.js"></script>
      <script src="${s}resources/js/skel.min.js"></script>
      <script src="${s}resources/js/util.js"></script>
      <script src="${s}resources/js/main.js"></script>
      
   </body>
</html>
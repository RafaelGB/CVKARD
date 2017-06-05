<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>CVKARD - Curriculum</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/components.css">
<link rel="stylesheet" type="text/css" href="${s}css/responsee.css">
<link rel="stylesheet" type="text/css" href="${s}css/template-style.css">
<link rel="stylesheet" type="text/css" href="${s}css/style.css" />

<script src="${s}tools/ckeditor/ckeditor.js"></script>

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>

<body class="landing"
	style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
	<div id="page-wrapper">
		<%@ include file="../fragments/header.jspf"%>
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
									<img src="/user/photo/${user.id}" alt="" width="200"
										height="150/">
									<form id="formAvatar" action="user/photo/${user.id}"
										style="visibility: hidden;" enctype="multipart/form-data"
										method="post">
										<input type="file" name="photo" size="40"> <input
											name="${_csrf.parameterName}" type="hidden"
											value="${_csrf.token}" />
										<div>
											<input type="submit" value="Send">
										</div>
									</form>
									<span style="color: blue;"> <%
								    if (request.getParameter("avatar") != null)
								        out.println(request.getParameter("avatar"));
								%>
									</span>
								</div>
							</div>
							<form id="confirmUpdate" action="/user/updateInfoUser"
								style="visibility: hidden;" method="post">
								<input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" /> <input type="submit"
									id="submit-form" />
							</form>
							<div class="u">
								<div class="colum1">
									<ul style="list-style: none;">
										<li style="font-size: 24px; margin-top: 0.5em;"><input
											class="changingClass" disabled="disabled" type="text"
											id="name-form" name="name-form" form="confirmUpdate"
											value="${user.name}" pattern="^[A-Za-z -]+$"
											title="Sólo letras y espacios"/></li>
										<li class="changingClass"
											style="font-size: 21px; margin-bottom: 1em;"><input
											class="changingClass" disabled="disabled" type="text"
											id="lastName-form" name="lastName-form" form="confirmUpdate"
											value="${user.lastName}" pattern="^[A-Za-z -]+$"
											title="Sólo letras y espacios"/></li>


										<li>
											<input disabled="disabled" class="changingClass" pattern="^(\d){8}[a-zA-Z]$"
											title="8 digitos + letra" type="text" id="dni-form" name="dni-form"
											form="confirmUpdate" value="${!empty user.DNI ? user.DNI : '00000000A'}" />
										</li>
										<li>fecha de nacimiento: 
										
											<input class="changingClass"
											disabled="disabled" type="date" id="birthday-form"
											name="birthday-form" form="confirmUpdate"
											value="${!empty user.birthday ? user.birthday : ''}">

										</li>
										<li>domicilio</li>
									</ul>
								</div>
							</div>

							<a href="tablaproyectos/V/1" class="button special small"
								style="float: right; margin-left: 0.4em;">Editar Proyectos</a>  
								<label for="submit-form" id="update_button"
									class="button special small"
									style="float: right; visibility: hidden;">
									Guardar	Cambios
								</label>
							<button onclick="updateState(this);"
								style="float: right; margin-top: 0.5em;">Activar
								edición</button>
							<span style="color: blue;"> 
								<%
							    if (request.getParameter("update") != null)
							        out.println(request.getParameter("update"));
								%>
							</span>

						</div>
					</div>
					<div class="box">
						<h3>Carta de Presentacion</h3>
				        <form id="ckeditor_form" action="/user/updateCard" method="post">
				            <textarea name="editor1" id="editor1" rows="10" cols="80">
				                ${user.card}
				            </textarea>
				            <input type="text" name="html_data" id="html_data" style="visibility:hidden;"> </input>
				            <input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" />
							 <input type="button" onclick="updateCkeditor()" value="Actualizar">
				            <script>
				                // Replace the <textarea id="editor1"> with a CKEditor
				                // instance, using default configuration.
				                CKEDITOR.replace( 'editor1' );
				            </script>
				        </form>
					</div>
				</section>
			</div>
		</div>
	</section>
	<!-- FOOTER -->

	<%@ include file="../fragments/footer.jspf"%>


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
	    		  $update.style.visibility = 'visible';
	    		  $avatar.style.visibility = "visible";
	    		  button.innerHTML = "Desactivar edición";
	    	  }
	    	  else{
	    		  $div.attr('disabled',true);
	    		  $update.style.visibility = "hidden";
	    		  $avatar.style.visibility = "hidden";
	    		  button.innerHTML = "Activar edición";
	    	  }
	      }
	      function updateCkeditor(){
	    	  var data = CKEDITOR.instances.editor1.getData();
	    	  document.getElementById("html_data").value = data;
	    	  document.getElementById("ckeditor_form").submit();
	      }
      </script>
</body>
</html>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>CVKARD - Proyecto</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/components.css">
<link rel="stylesheet" type="text/css" href="${s}css/responsee.css">
<link rel="stylesheet" type="text/css" href="${s}css/template-style.css">
<link rel="stylesheet" type="text/css" href="${s}css/style.css" />


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
				<h1>EDITAR PROYECTO</h1>
			</div>
		</div>
		<!--Cambiar las ids o los names de los inputs para pillarlos en un proyectController , y crear el metodo para que lo actualice bien -->
		<!--Crear un metodo que pille la foto del proyecto como la del user/photo-->
		<div id="content">
			<div class="line">
				<section id="main" class="container">
					<div class="box">
						<div class="row">
							<div class="u">
								<div class="colum1">
								<img src="/proyect/photo/${proyect.id}" alt="" width="200"
										height="150/">
									<form id="formImage" action="/proyect/photo/${proyect.id}"
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
								    if (request.getParameter("image") != null)
								        out.println(request.getParameter("image"));
								%>
									</span>
								</div>
							</div>
							<form id="confirmUpdate" action="/proyect/updateInfoProyect/${proyect.id}"
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
											value="<c:out value="${proyect.title}"></c:out>" /></li>
										


										
										<li>Fecha del proyecto: 
										
											<input class="changingClass"
											disabled="disabled" type="date" id="birthday-form"
											name="date-form" form="confirmUpdate"
											value="<c:out value="${!empty proyect.date ? proyect.date : ''}"></c:out>">

										</li>
										<li id="selectorT" style="visibility: hidden;">Tags:<c:forEach items="${tags}" var="t">
										<input type="checkbox" id="${t.id}" name="checkedTag" value="${t.name}" ></input>
										<label for="${t.id}">${t.name}</label>
										</c:forEach></li>
										<li id="selectorL" style="visibility: hidden;">Lenguajes:<c:forEach items="${lang}" var="l">
										<input type="checkbox" id="l${l.id}" name="checkedTag" value="${l.name}" ></input>
										<label for="l${l.id}">${l.name}</label>
										</c:forEach></li>
									
									</ul>
								</div>
							</div>

							  
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
						<h3>Descripción del proyecto</h3>
				        <form id="ckeditor_form" action="/proyect/updateDescript/${proyect.id}" method="post">
				            <textarea name="editor1" id="editor1" rows="2" cols="40">
				                <c:out value="${proyect.description}"></c:out>
				            </textarea>
				            <input type="text" name="html_data" id="html_data" style="visibility:hidden;"> 
				            <input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" />
							 <input type="button" onclick="updateCkeditor()" value="Actualizar">
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
	    	  var $select = document.getElementById ("selector");
	    	  var $update = document.getElementById ("update_button");
	    	  var $image = document.getElementById ("formImage");
	    	  if($update.style.visibility == 'hidden'){
	    		  $div.attr('disabled',false);
	    		  $select.style.visibility = 'visible';
	    		  $update.style.visibility = 'visible';
	    		  $image.style.visibility = "visible";
	    		  button.innerHTML = "Desactivar edición";
	    	  }
	    	  else{
	    		  $div.attr('disabled',true);
	    		  $select.style.visibility = 'hidden';
	    		  $update.style.visibility = "hidden";
	    		  $image.style.visibility = "hidden";
	    		  button.innerHTML = "Activar edición";
	    	  }
	      }
	      function updateCkeditor(){
	    	  var data = document.getElementById("editor1").value;
	    	  document.getElementById("html_data").value = data;
	    	  document.getElementById("ckeditor_form").submit();
	      }
      </script>
</body>
</html>
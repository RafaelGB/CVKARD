<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CVKard - Empresas</title>
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/components.css">
<link rel="stylesheet" type="text/css" href="${s}css/responsee.css">
<link rel="stylesheet" type="text/css" href="${s}css/template-style.css">
<link rel="stylesheet" type="text/css" href="${s}css/style.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
<script src="${s}js/login.js"></script>
<script src="${s}tools/ckeditor/ckeditor.js"></script>
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
									<img src="/user/Bphoto/${user.id}" alt="" width="200"
										height="150/">
									<form id="formAvatar" action="user/Bphoto/${user.id}"
										style="visibility: hidden;" enctype="multipart/form-data"
										method="post">
										<input type="file" name="Bphoto" size="40"> <input
											name="${_csrf.parameterName}" type="hidden"
											value="${_csrf.token}" />
										<div>
											<input type="submit" class="button special small" value="SEND">
										</div>
									</form>
								</div>
							</div>
							<form id="confirmUpdate" action="/user/updateInfoBusiness"
								style="visibility: hidden;" method="post">
								<input name="${_csrf.parameterName}" type="hidden"
									value="${_csrf.token}" /> <input type="submit"
									id="submit-form" />
							</form>
							<div class="u">
								<div class="colum1">
									<ul style="list-style: none;">
										<li><h3>DATOS PERSONALES</h3></li>
										<li style="font-size: 24px; margin-top: 0.5em;"><input
											class="changingClass" type="text" disabled="disabled"
											id="name-form" name="name-form" form="confirmUpdate"
											value="<c:out value="${user.name}"></c:out>" />
										</li>
										<br></br>
										<li>
											<input class="changingClass" type="text"
												disabled="disabled" id="email-form" name="email-form"
												form="confirmUpdate" 
												value="<c:out value="${!empty user.email ? user.email : 'email@ejemplo.sub'}"></c:out>" />
											<br />
										</li>
									</ul>
								</div>
							</div>
							<div class="u">
								<div class="colum1">
									<ul style="list-style: none;">
										<li>
											<h3>DIRECCION</h3>
										</li>
										<li><input class="changingClass" type="text"
											placeholder="Municipio" disabled="disabled"
											id="municipality-form" name="municipality-form"
											form="confirmUpdate" value="<c:out value="${user.address.municipality}"></c:out>" /></br>
										</li>
										<li><input class="changingClass" type="text"
											placeholder="Calle" disabled="disabled" id="street-form"
											name="street-form" form="confirmUpdate"
											value="<c:out value="${user.address.street}"></c:out>" /> <span
											style="display: inline-block; width: 10px;"></span></li>

									</ul>
								</div>

							</div>
							<div class="u" style="width: 13%">
								<div class="colum1">
									<ul style="list-style: none;">
										
										<li style="padding-top: 4em"><input class="changingClass" type="text"
											placeholder="País" disabled="disabled" id="country-form"
											name="country-form" form="confirmUpdate"
											value="<c:out value="${user.address.country}"></c:out>" /></br></li>
										<li><input class="changingClass" type="text"
											placeholder="Número" disabled="disabled" id="number-form"
											name="number-form" form="confirmUpdate"
											value="<c:out value="${user.address.number}"></c:out>" /></li>
									</ul>

								</div>
							</div>
						</div>
						<a href="tablaofertas/1" class="button special small"
							style="float: right; margin:2px;">Editar Ofertas</a> <label for="submit-form"
							id="update_button" class="button special small"
							style="float: right; margin:2px; visibility: hidden;">GUARDAR CAMBIOS</label>
						<button onclick="updateState(this);"
							style="float: right; margin:2px;" class="button special small">ACTIVAR EDICION</button>
						<span style="color: blue;"> ${not empty param.update ?  param.update : ''}
						</span>

					</div>
					<div class="box">
						<h3>Descripción</h3>
						<form id="description_form" action="/user/updateCard/B"
							method="post">
							<textarea name="editor1" id="editor1" rows="10" cols="80">
				                <c:out value="${user.card}"></c:out>
				            </textarea>
							<input type="text" name="html_data" id="html_data"
								style="visibility: hidden;"> </input> <input
								name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" />
							<script>
								// Replace the <textarea id="editor1"> with a CKEditor
								// instance, using default configuration.
								CKEDITOR.replace('editor1');
							</script>
							<input type="button" onclick="updateCkeditor()"
								value="GUARDAR CAMBIOS">
						</form>
					</div>
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
		function updateState(button) {
			var $div = $('.changingClass');
			var $update = document.getElementById("update_button");
			var $avatar = document.getElementById("formAvatar");
			if ($update.style.visibility == 'hidden') {
				$div.attr('disabled', false);
				$div.attr('contentEditable', true);
				$update.style.visibility = "visible";
				$avatar.style.visibility = "visible";
				button.innerHTML = "DESACTIVAR EDICION";
			} else {
				$div.attr('disabled', true);
				$div.attr('contentEditable', false);
				$update.style.visibility = "hidden";
				$avatar.style.visibility = "hidden";
				button.innerHTML = "ACTIVAR EDICION";
			}
		}
		function updateCkeditor() {
			var data = CKEDITOR.instances.editor1.getData();
			document.getElementById("html_data").value = data;
			document.getElementById("description_form").submit();
		}
	</script>
</body>
</html>
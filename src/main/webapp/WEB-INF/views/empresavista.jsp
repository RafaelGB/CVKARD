<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CVKard - Empresa</title>
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/components.css">
<link rel="stylesheet" type="text/css" href="${s}css/responsee.css">
<link rel="stylesheet" type="text/css" href="${s}css/template-style.css">
<link rel="stylesheet" type="text/css" href="${s}css/style.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
<script src="${s}js/login.js"></script>
</head>

<body class="landing"
	style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
	<div id="page-wrapper">
		<%@ include file="../fragments/header.jspf"%>
	</div>

	<section>
		<div id="head"></div>
		<div id="content">
			<div class="line">
				<section id="main" class="container">
					<div class="box">
						<div class="row">
							<div class="u">
								<div class="colum1">
									<img src="/user/photo/${user.id}" alt="" width="200"
										height="150" />
								</div>
							</div>
							<div class="u">
								<div class="colum1">
									<ul style="list-style: none;">
										<li><h2>${user.name}</h2></li>
										<li>${user.address}</li>
										<li>${user.email}</li>
									</ul>
								</div>
							</div>
							<div class="u2">
								<div class="colum1">
									<ul style="list-style: none;">
										<li><h4>
												Puntuacion:
												<div class="ec-stars-wrapper">
													<a href="#" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
													<a href="#" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
													<a href="#" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
													<a href="#" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
													<a href="#" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
												</div>
											</h4></li>

									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="box">
						<h3>Carta de Presentación</h3>
						<p>${user.card}</p>
						<!--  <div class="row">
							<img src="${s}images/oficina.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/mkx.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/injustice.jpg" alt=""WIDTH=200 HEIGHT=140/>
							<img src="${s}images/villians.jpg" alt="" WIDTH=200 HEIGHT=140/>
							<img src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80 style="padding-top:1.8em;"/>
						</div> -->
					</div>

					<div class="box">
						<h3>OFERTAS</h3>
						<div class="row">

							<c:forEach items="${user.offers}" var="f" begin="${(pag-1)*10}"
								end="${((pag-1)*10)+9}">

								<div class="u">
									<div class="colum1">
										<img src="/offer/photo/${f.id}" alt="" WIDTH=150 HEIGHT=150 />
									</div>
									<ul style="list-style: none;">
										<li>${f.title}</li>
										<li>${f.description}</li>
										<li>${user.name}</li>
										</br>
										<li><a href="/ofertas/ofertavista/${f.id}"
											class="button special small">Oferta</a></li>
								</div>
							</c:forEach>

							

						</div>
						<div class="w3-bar w3-border w3-round">
								<div class="w3-bar">
									<a
										href="/empresas/empresavista/${user.id}/${pag>=5 ? pag-4 : 1}"
										class="w3-bar-item w3-button"> &laquo; </a> <a
										href="/empresas/empresavista/${user.id}/${pag}"
										class="w3-button"> ${pag} </a> <a
										href="/empresas/empresavista/${user.id}/${(((pag)*10)+1) <= size ? pag+1 : pag}"
										class="w3-button"> ${(((pag)*10)+1) <= size ? pag+1 : '-'}
									</a> <a
										href="/empresas/empresavista/${user.id}/${(((pag+1)*10)+1) <= size ? pag+2 : pag}#"
										class="w3-button">${(((pag+1)*10)+1) <= size ? pag+2 : '-'}
									</a> <a
										href="//empresas/empresavista/${user.id}/${(((pag+2)*10)+1)<= size ? pag+3 : pag}#"
										class="w3-button">${(((pag+2)*10)+1) <= size ? pag+3 : '-'}
									</a> <a
										href="/empresas/empresavista/${user.id}/${(((pag+3)*10)+1) <= size ? pag+4 : pag}#"
										class="w3-button"> &raquo; </a>
								</div>
							</div>
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
</body>
</html>
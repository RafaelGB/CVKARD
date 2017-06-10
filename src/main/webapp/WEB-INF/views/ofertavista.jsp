<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CVKard - Oferta</title>
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
	<%@ include file="../fragments/adds.jspf"%>
	<section>
		<div id="head">
			<div class="line">
				<h1>${theOffer.title}</h1>
			</div>
		</div>
		<div id="content">
			<div class="line">
				<section id="main" class="container">
					<div class="box">
						<div class="row">
							<div class="u">
								<div class="colum1">
									<img src="/offer/photo/${theOffer.id}" alt="" width="200"
										height="150" />
								</div>
							</div>
							<div class="u">
								<div class="colum1">
									<ul style="list-style: none;">
										<li>por: <h2>${theOffer.offerer.name}</h2></li>

										<li>contacto: ${theOffer.offerer.email}</li>
									</ul>
								</div>
							</div>
							<div class="u2">
								<div class="colum1">
									<ul style="list-style: none;">
										<sec:authorize access="hasRole('EMPLOYEE')">
										<li><h4>
												Puntuacion:</h4>
												<div class="ec-stars-wrapper">
												<a href="/offer/puntuaOffer/${theOffer.id}/1" data-value="1" title="Votar con 1 estrellas">&#9733;</a>
												<a href="/offer/puntuaOffer/${theOffer.id}/2" data-value="2" title="Votar con 2 estrellas">&#9733;</a>
												<a href="/offer/puntuaOffer/${theOffer.id}/3" data-value="3" title="Votar con 3 estrellas">&#9733;</a>
												<a href="/offer/puntuaOffer/${theOffer.id}/4" data-value="4" title="Votar con 4 estrellas">&#9733;</a>
												<a href="/offer/puntuaOffer/${theOffer.id}/5" data-value="5" title="Votar con 5 estrellas">&#9733;</a>
												</div>
											</li>
											
											</sec:authorize>
											<li><h4> Puntuacion media:<c:out value="${media}"></c:out></h4>
											</li>
										<li><br/>
											<h4>Tags</h4>
											<c:forEach items="${theOffer.tags}" var="t" >
												<a href="/tag/${t.id}/1" class="w3-button">${t.name}</a>
											</c:forEach>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="row">
							<div class="u3">
								<div class="colum1">
									<h3>Descripción</h3>
									<p>${theOffer.description}</p>
								</div>
							</div>

						</div>
						<!--  <div class="row">
							<img src="${s}images/oficina.jpg" alt="" WIDTH=200 HEIGHT=140 />
							<img src="${s}images/mkx.jpg" alt="" WIDTH=200 HEIGHT=140 /> <img
								src="${s}images/injustice.jpg" alt="" WIDTH=200 HEIGHT=140 /> <img
								src="${s}images/villians.jpg" alt="" WIDTH=200 HEIGHT=140 /> <img
								src="${s}images/f.png" alt="" WIDTH=100 HEIGHT=80
								style="padding-top: 1.8em;" />
						</div> -->
					</div>	
					<sec:authorize access="hasRole('EMPLOYEE')">
						<a href="/buzon/N/${theOffer.offerer.email}" class="button special"><h3>Solicitar oferta</h3></a>				
					</sec:authorize>
				</section>
			</div>

		</div>
	</section>

	<!-- FOOTER -->

	<%@ include file="../fragments/footer.jspf"%>


	</div>


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







<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>CVKARD - home</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/components.css">
<link rel="stylesheet" type="text/css" href="${s}css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${s}css/owl.theme.css">

</head>
<body class="landing"
	style="background-image: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;">
	<div id="page-wrapper">
		<%@ include file="../fragments/header.jspf"%>
	</div>

	<section>
		<div id="head">
			<div class="carousel" style="text-align: -webkit-center">
				<div id="owl-demo" class="owl-carousel owl-theme">
					<div class="item">
						<img src="${s}images/Carousel.png" alt="">
						<div class="carousel-text">
							<div class="line" id="line">
								<div class="s-12 l-9">
									<h5>Deslumbra a todos con una carta de presentacion de tus
										proyectos y consigue</h5>
								</div>
								<div class="s-12 l-9">
									<p>Trabajo al instante</p>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<img src="${s}images/Carousel.png" stylealt="">
						<div class="carousel-text">
							<div class="line" id="line">
								<div class="s-12 l-9">
									<h5>Se el primero en estar al corriente de las</h5>
								</div>
								<div class="s-12 l-9">
									<p>Mejores ofertas del mercado</p>
								</div>
							</div>
						</div>
					</div>
					<div class="item">
						<img src="${s}images/Carousel.png" stylealt="">
						<div class="carousel-text">
							<div class="line" id="line">
								<div class="s-12 l-9">
									<h5>Comparte código con la comunidad para</h5>
								</div>
								<div class="s-12 l-9">
									<p>Ser el mejor valorado</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div id="content">
			<div class="line">
				<section id="main" class="container">
						
					<div class="box">
					
						<div class="line">
							<h2>MEJORES EMPRESAS</h2>
						</div>
						<div class="row">

							<c:forEach items="${bussines}" var="f" begin="0" end="3">

								<div class="u">
									<div class="colum1">
										<img src="/user/photo/${f.id}" alt="" WIDTH=150 HEIGHT=150 />
									</div>
									<ul style="list-style: none;">
										<li>${f.name}</li>
										<li>${f.email}</li>
										</br>
										<li><a href="empresas/empresavista/${f.id}/1"
											class="button special small">Empresa</a></li>
								</div>
							</c:forEach>

						</div>

					</div>
					<a href="/empresas/1" class="button special small"
						style="float: none">Todas las Empresas</a>
				</section>


			</div>

			<div class="line">
				<section id="main" class="container">
					<div class="box">
						<div class="line">
							<h2>ULTIMAS OFERTAS</h2>
						</div>
						<div class="row">

							<c:forEach items="${offerList}" var="f" begin="0" end="3">

								<div class="u">
									<div class="colum1">
										<img src="/offer/photo/${f.id}" alt="" WIDTH=150 HEIGHT=150 />
									</div>
									<ul style="list-style: none;">
										<li>${f.title}</li>
										<li>${f.description}</li>
										<li>${f.offerer.name}</li>
										</br>
										<li><a href="/ofertavista/${f.id}"
											class="button special small">Oferta</a></li>
								</div>
							</c:forEach>

						</div>

					</div>
					<a href="/ofertas/1" class="button special small"
						style="float: none">Todas las ofertas</a>
				</section>
			</div>
		</div>

	</section>


	<!-- FOOTER -->

	<%@ include file="../fragments/footer.jspf"%>

	<script type="text/javascript" src="${s}js/owl.carousel.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$("#owl-demo").owlCarousel({
				slideSpeed : 300,
				autoPlay : true,
				navigation : false,
				pagination : false,
				singleItem : true
			});
			$("#owl-demo2").owlCarousel({
				slideSpeed : 300,
				autoPlay : true,
				navigation : false,
				pagination : true,
				singleItem : true
			});
		});
	</script>
</body>
</html>

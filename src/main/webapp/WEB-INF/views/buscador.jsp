<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CVKard - Empresas</title>
<link rel="stylesheet" type="text/css" href="${s}css/main.css">
<link rel="stylesheet" type="text/css" href="${s}css/style.css">
<script src="${s}resources/js/passwords.js"></script>
<script src="${s}resources/js/mail.js"></script>
<script src="${s}resources/js/reqUsuario.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
<script src="${s}js/login.js"></script>
<style type="text/css">
ul.radio_search li {
	display: inline-block;
}
</style>
</head>

<body class="landing"
	style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;">
	<div id="page-wrapper">
		<%@ include file="../fragments/header.jspf"%>
	</div>

	<section>
		<div id="head">
			<div class="line">
				<h1>BUSCADOR</h1>
			</div>
		</div>
		<div id="content">
			<div class="line">
				<section id="main" class="container">


					<div class="box" style="padding-bottom: 0px">
						<div class="row">
							<c:choose>

								<c:when test="${type=='P'}">
									<c:choose>
										<c:when test="${size=='0'}">

											<h2>SIN RESULTADOS</h2>

										</c:when>
										<c:otherwise>
											<c:forEach items="${proyects}" var="p" begin="0"
												end="${proyects.size()}">
												<div class="u">
													<div class="colum1">
														<img src="/proyect/photo/${p.id}" alt="" width="100"
															height="100/">
													</div>
													<ul style="list-style: none;">
														<li><a href="/proyecto/${p.id}"><c:out
																	value="${p.title}"></c:out></a></li>
														<li><c:out value="${p.description}"></c:out></li>
														<li><a href="/proyecto/${p.id}"
															class="button special small">Proyecto</a></li>
													</ul>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${type=='O'}">
									<c:choose>
										<c:when test="${size=='0'}">

											<h2>SIN RESULTADOS</h2>

										</c:when>
										<c:otherwise>
											<c:forEach items="${offers}" var="f" begin="0"
												end="${offers.size()}">
												<div class="u">
													<div class="colum1">
														<img src="/offer/photo/${f.id}" alt="" WIDTH=150 HEIGHT=150 />
													</div>
													<ul style="list-style: none;">
														<li>${f.title}</li>
														<li>${f.description}</li>
		
														</br>
														<li><a href="/ofertavista/${f.id}"
															class="button special small">Oferta</a></li>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${type=='E'}">
									<c:choose>
										<c:when test="${size=='0'}">

											<h2>SIN RESULTADOS</h2>

										</c:when>
										<c:otherwise>

											<c:forEach items="${bussines}" var="b" begin="0"
												end="${bussines.size()}">


												<div class="u">
													<div class="colum1">
														<img src="/user/photo/${b.id}" alt="" WIDTH=150 HEIGHT=150 />
													</div>
													<ul style="list-style: none;">
														<li>${b.name}</li>
														<li>${b.email}</li>
														</br>
														<li><a href="/empresas/empresavista/${b.id}"
															class="button special small">Empresa</a></li>
												</div>

											</c:forEach>


										</c:otherwise>


									</c:choose>

								</c:when>
							</c:choose>
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
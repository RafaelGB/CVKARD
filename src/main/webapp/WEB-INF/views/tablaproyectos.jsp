<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CVKard - Ofertas</title>
    <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
    <link rel="stylesheet" type="text/css"  href="${s}css/components.css">  

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
</head>

<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
    <div id="page-wrapper">
    
    <%@ include file="../fragments/header.jspf" %>
  </div>
    <section>
      <div id="head">
        
      </div>
      <div id="content">
        <div class="line">
          <section id="main" class="container">
            <a href="#" id ="new" class="button alt fit small">Nuevo</a>
            <a href="#" class="button alt fit small">Modificar</a>
            <a href="#" class="button alt fit small">Eliminar</a>
			<a href="#" class="button alt fit small">Buscar</a>
            <div class="box">

              <div class="row">                
                <div class="table-wrapper">
                  <table>
                    <thead>
                      <tr>                   
                        <th id="selec">Proyectos</th>
                        <th>Description</th>
                        <th>Fecha</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td id="selec">
                          <input type="checkbox" id="copy" name="copy">
                          <label for="copy">Nombre Proyecto</label></th></td>
                        <td>Ante turpis integer aliquet porttitor.</td>
                        <td>27/04/2017</td>
                      </tr>
                      <tr>
                        <td id="selec">
                          <input type="checkbox" id="copy1" name="copy1">
                          <label for="copy1">Nombre Proyecto</label></th></td>
                        <td>Vis ac commodo adipiscing arcu aliquet.</td>
                           <td>27/04/2017</td>
                      </tr>
                      <tr>
                        <td id="selec">
                          <input type="checkbox" id="copy2" name="copy2">
                          <label for="copy2">Nombre Proyecto</label></th></td>
                        <td> Morbi faucibus arcu accumsan lorem.</td>
                           <td>27/04/2017</td>
                      </tr>
                      <tr>
                        <td id="selec">
                          <input type="checkbox" id="copy3" name="copy3">
                          <label for="copy3">Nombre Proyecto</label></th></td>
                        <td>Vitae integer tempus condimentum.</td>
                           <td>27/04/2017</td>
                      </tr>
                      <tr>
                        <td id="selec">
                          <input type="checkbox" id="copy4" name="copy4">
                          <label for="copy4">Nombre Proyecto</label></th></td>
                        <td>Ante turpis integer aliquet porttitor.</td>
                           <td>27/04/2017</td>
                      </tr>
                    </tbody>

                  </table>
                  <div class="w3-bar w3-border w3-round">
                    <div class="w3-bar">
                      <a href="#" class="w3-bar-item w3-button"> &laquo; </a>
                      <a href="#" class="w3-button"> 1 </a>
                      <a href="#" class="w3-button"> 2 </a>
                      <a href="#" class="w3-button"> 3 </a>
                      <a href="#" class="w3-button"> 4 </a>
                      <a href="#" class="w3-button"> &raquo; </a>
                    </div>
                  </div>
                </div>  
              </div>
            </div>
          </section>
        </div>
      </div>
    </section>
	  <!-- FOOTER -->   

    <%@ include file="../fragments/footer.jspf" %>


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








<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CVKard - Buzon</title>
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
            <a href="#" class="button alt fit small">Recibidos</a>
            <a href="#" class="button alt fit small">Enviados</a>
            <a href="#" class="button alt fit small">Destacados</a>
            <div class="box">

              <div class="row">                
                <div class="table-wrapper">
                  <table>
                    <thead>
                      <tr>                   
                        <th id="selec">Asunto del correo</th>
                        <th>Description</th>
                        <th>Fav</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${user.receivedMessages}" var="m" begin="${(pag-1)*9}" end="${9*pag}"> 
                      	<tr> 
	                      	<td class="selec">
	                          <input type="checkbox" id="copy${m.id}" name="copy${m.id}">
	                          <label for="copy${m.id}">${m.subject}</label>
	                        </td>
                            <td>${m.description}</td>  
                      	</tr> 
                     </c:forEach>
                    </tbody>

                  </table>
                  <div class="w3-bar w3-border w3-round">
                    <div class="w3-bar">
                      <a href="/buzon/${pag>=5 ? pag-4 : 1}" class="w3-bar-item w3-button"> &laquo; </a>
                      <a href="/buzon/${pag}" class="w3-button"> ${pag} </a>
                      <a href="/buzon/${pag+1}" class="w3-button"> ${pag+1} </a>
                      <a href="/buzon/${pag+2}" class="w3-button">${pag+2} </a>
                      <a href="/buzon/${pag+3}" class="w3-button"> ${pag+3} </a>
                      <a href="/buzon/${pag+4}" class="w3-button"> &raquo; </a>
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
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
            <a href="/buzon/N/0" id ="new" class="button alt fit small">Nuevo</a>
            <a href="/buzon/R/1" class="button alt fit small">Recibidos</a>
            <a href="/buzon/E/1" class="button alt fit small">Enviados</a>
            <a href="/buzon/D/1" class="button alt fit small">Destacados</a>
            <div class="box">

              <div class="row"> 
              <!-- Si se trata de destacados muestra un formulario, sino muestra los mensajes -->
              	<c:choose>
				    <c:when test="${type=='N'}">
						<h3>Componer</h3>
							 <form method="post" action="#">
							 	<div class="row">
				                    <div class="u">
				                    	<div class="column1">
				                    		<ul style="list-style:none;">
				                    			<li><input type="text" name="name" id="name" value="" placeholder="Name"></li></br>
				                    			<li><input type="text" name="asunto" id="asunto" value="" placeholder="Asunto"></li></br>
				                    			<li>
							                    	<input type="checkbox" id="copy" name="copy">
							                    	<label for="copy">Email me a copy of this message</label>
							                    </li>
				                    		</ul>
				                    	</div>
				                    </div>
				                    <div class="u">
				                    	<div class="column1">
				                    		<ul style="list-style:none;">
				                    			<li><input type="email" name="email" id="email" value="" placeholder="Email"></li></br>
				                    			 <li>
							                    	<div class="select-wrapper">
								                        <select name="category" id="category">
								                          <option value="">- Category -</option>
								                          <option value="1">Questions</option>
								                          <option value="1">Interview</option>
								                          <option value="1">Contract</option>
								                          <option value="1">Other</option>
								                        </select>
		                      						</div> <br></br>
		                      					</li>
				                    		</ul>
				                    	</div>
				                    </div>
				                    <div class="u2">
				                    	<div class="column1">
				                    		<ul style="list-style:none;">
				                    			<li><textarea name="message" id="message" placeholder="Escribe tu mensaje aqui..." rows="7"></textarea></li>
				                    			
				                    		</ul>		                    		     
				                    	</div>
				                    </div>
				                    
				                </div>
				                <div class="row">
				                    <input type="submit" value="Enviar">
				                </div>
							 </form>
				    </c:when>    
				    <c:otherwise>
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
		                     <c:forEach items="${type == R ? user.receivedMessages : type == S ? user.sentMessages : destacados}" var="m" begin="${(pag-1)*10}" end="${((pag-1)*10)+9}"> 
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
		                      <a href="/buzon/${type}/${pag>=5 ? pag-4 : 1}" class="w3-bar-item w3-button"> &laquo; </a>
		                      <a href="/buzon/${type}/${(pag)*10 <= size ? pag : pag}" class="w3-button"> ${(pag)*10 <= size ? pag : pag} </a>
		                      <a href="/buzon/${type}/${(pag+1)*10 <= size ? pag+1 : pag}" class="w3-button"> ${(pag+1)*10 <= size ? pag+1 : pag} </a>
		                      <a href="/buzon/${type}/${(pag+2)*10 <= size ? pag+2 : pag}" class="w3-button">${(pag+2)*10 <= size ? pag+2 : pag} </a>
		                      <a href="/buzon/${type}/${(pag+3)*10 <= size ? pag+3 : pag}" class="w3-button">${(pag+3)*10 <= size ? pag+3 : pag} </a>
		                      <a href="/buzon/${type}/${(pag+4)*10 <= size ? pag+4 : pag}" class="w3-button"> &raquo; </a>
		                    </div>
		                  </div>
		                </div> 
				    </c:otherwise>
				</c:choose>                
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
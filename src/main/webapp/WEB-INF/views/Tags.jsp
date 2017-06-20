
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CVKard - Tags</title>
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
					<a href="/Tags/N" id="new" class="button alt fit small">Nuevo</a>
					
					<div class="box">

						<div class="row">


							<!-- Si se trata de componer un mensaje muestra un formulario, sino muestra los mensajes -->
							<c:choose>
								<c:when test="${pag=='N'}">
									<form method="post" action="/Tag/createTag">
										<div class="row">
											<div class="u">
												<div class="column1">
													<ul style="list-style: none;">
														<li><input type="text" name="name" id="name"
															placeholder="name"
															style="width: 250px; max-width: 250px"> <br></br>
														</li>
													</ul>
												</div>
											</div>


				                  
				                    
				                </div>
				                <div class="row">
				                    <input type="submit" value="Enviar">
				                </div>
				                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							 </form>
				    </c:when>    
				    <c:otherwise>
						<div class="table-wrapper">
						<form action="/Tag/actionOnMarks" method="POST">
		                  <table>
		                    <thead>
		                      <tr>
								<th style="width:10%" class="selec">
									Marcados
									<select onChange="checkMarcados(this)" name="markOptions" id="markOptions" style=" height: 20px;line-height: 1.5;font-size: 12px;padding: 1px 5px;border-radius: 3px;">
			                          <option value="opciones">- Opciones -</option>
			                          <option value="borrar">Borrar</option>
			                        </select>
									<button id="buttonM" style ="display:none;" type="submit">Aplicar</button>
								</th>                  
		                      		
									<th style="width: 30%;">Tag</th>
									<th style="width: 50%;">Nombre</th>
									
													
		                      </tr>
		                    </thead>
				           <tbody>
		                     <c:forEach items="${Alltag}" var="t" begin="${(pag-1)*10}" end="${((pag-1)*10)+9}"> 
		                      	<tr>
			                      	<td style="width: 10%" class="selec">
			                          <input type="checkbox" id="copy${t.id}" name="checked" value="${t.id}"></input>
			                          <label for="copy${t.id}"></label>
   			                        </td>
   			                        <td style="width: 30%"><a href=""></a></td>
			                        <td style="width: 50%"><a href="">${t.name}</a></td>
		                      	</tr>
		                     </c:forEach>
		                    </tbody>
		
		                  </table>
		                  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 					
		                  </form>
		            	<div class="w3-bar w3-border w3-round">
											<div class="w3-bar">
												<a href="/Tags/${pag>=5 ? pag-4 : 1}"
													class="w3-bar-item w3-button"> &laquo; </a> <a
													href="/Tags/${pag}" class="w3-button">
													${pag} </a> <a
													href="/Tags/${(((pag)*10)+1) <= size ? pag+1 : pag}"
													class="w3-button"> ${(((pag)*10)+1) <= size ? pag+1 : '-'}
												</a> <a
													href="/Tags/${(((pag+1)*10)+1) <= size ? pag+2 : pag}#"
													class="w3-button">${(((pag+1)*10)+1) <= size ? pag+2 : '-'}
												</a> <a
													href="/Tags/${(((pag+2)*10)+1)<= size ? pag+3 : pag}#"
													class="w3-button">${(((pag+2)*10)+1) <= size ? pag+3 : '-'}
												</a> <a
													href="/Tags/${(((pag+3)*10)+1) <= size ? pag+4 : pag}#"
													class="w3-button"> &raquo; </a>
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
      <script>
      function checkMarcados(marks){
    	  var $b = document.getElementById("buttonM");
    		 if(marks.value =='opciones'){
    			 $b.style.display = "none";
    			
    			 }
    		 else{

    			 $b.style.display = "block";
    		 }
    	}
      </script>
      <script src="${s}js/jquery.min.js"></script>
      <script src="${s}js/jquery.dropotron.min.js"></script>
      <script src="${s}js/login.js"></script>
      <script src="${s}js/jquery.scrollgress.min.js"></script>
      <script src="${s}js/skel.min.js"></script>
      <script src="${s}js/util.js"></script>
      <script src="${s}js/main.js"></script>
   </body>
</html>



<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>CVKard - Usuarios</title>
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
			
					<div class="box">

						<div class="row">


							<!-- Si se trata de componer un mensaje muestra un formulario, sino muestra los mensajes -->
							
						<div class="table-wrapper">
						<form action="/offer/actionOnMarks" method="POST">
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
		                      		
									<th style="width: 30%;">Usuarios</th>
									<th style="width: 50%;">Nombre</th>
									<th style="width: 20%;">Rol</th>
													
		                      </tr>
		                    </thead>
				           <tbody>
		                     <c:forEach items="${Alluser}" var="u" begin="${(pag-1)*10}" end="${((pag-1)*10)+9}"> 
		                      	<tr>
			                      	<td style="width: 10%" class="selec">
			                          <input type="checkbox" id="copy${u.id}" name="checked" value="${u.id}"></input>
			                          <label for="copy${u.id}"></label>
   			                        </td>
   			                        <td style="width: 30%"><a href=""></a></td>
			                        <td style="width: 50%"><a href="">${u.name}</a></td>
		                            <td style="width: 20%">${u.roles}</td> 
		                      	</tr>
		                     </c:forEach>
		                    </tbody>
		
		                  </table>
		                  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 					
		                  </form>
		            	<div class="w3-bar w3-border w3-round">
											<div class="w3-bar">
												<a href="/tablaofertas/${pag>=5 ? pag-4 : 1}"
													class="w3-bar-item w3-button"> &laquo; </a> <a
													href="/Usuarios/${pag}" class="w3-button">
													${pag} </a> <a
													href="/Usuarios/${(((pag)*10)+1) <= size ? pag+1 : pag}"
													class="w3-button"> ${(((pag)*10)+1) <= size ? pag+1 : '-'}
												</a> <a
													href="/Usuarios/${(((pag+1)*10)+1) <= size ? pag+2 : pag}#"
													class="w3-button">${(((pag+1)*10)+1) <= size ? pag+2 : '-'}
												</a> <a
													href="/Usuarios/${(((pag+2)*10)+1)<= size ? pag+3 : pag}#"
													class="w3-button">${(((pag+2)*10)+1) <= size ? pag+3 : '-'}
												</a> <a
													href="/Usuarios/${(((pag+3)*10)+1) <= size ? pag+4 : pag}#"
													class="w3-button"> &raquo; </a>
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


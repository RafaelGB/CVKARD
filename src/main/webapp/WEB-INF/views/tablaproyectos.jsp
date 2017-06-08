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
            <a href="/tablaproyectos/N/0" id ="new" class="button alt fit small">Nuevo</a>
            <a href="#" class="button alt fit small">Modificar</a>
            <a href="#" class="button alt fit small">Eliminar</a>
			<a href="#" class="button alt fit small">Buscar</a>
            <div class="box">

              <div class="row"> 
              
              <!-- Si se trata de crear un proyecto muestra un formulario, sino muestra los mensajes -->
              <!-- Falta el formulario de creación, lo que hay no funciona -->
              	
              	<c:choose>
				    <c:when test="${type=='N'}">
						<h3>Componer</h3>
						
						<form method="post" action="/proyect/createProyect/">
						 <div class="row">
				                    <div class="u">
				                    	<div class="column1">
				                    		<ul style="list-style:none;">
				                    			<li>
				                    				<input type="text" name="title" id="title"  placeholder="Título del proyecto" style="width:250px;max-width:250px">
				                    				<br></br>
				                    			</li>
				                    			<li><input type="date" name="date" id="date"
															 placeholder="Fecha"
															style="width: 200px; max-width: 200px"> <br></br></li>
												<li>Tags:<input type="checkbox" id="desWeb" name="checked" value="Desarrollo web" ></input>
												<label for="desWeb">Desarrollo web</label>
												<input type="checkbox" id="progJava" name="checked" value="Programacion java" ></input>
												<label for="progJava">Programacion java</label>
												
				                    		</ul>
				                    	</div>
				                    </div>				                    
			                 			                   
			                    	<textarea name="description" id="description" placeholder="Escribe una descripción del proyecto..." rows="10" cols="40"></textarea>			                    				                    		     
			                    
				                  
				                    
				                </div>
				                <div class="row">
				                    <input type="submit" value="Crear">
				                </div>
				                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				    </c:when>
				    
			<c:otherwise>       
		                <div class="table-wrapper">
		                <form action="/proyect/actionOnMarks" method="POST">
		                  <table>
		                    <thead>
		                      <tr>                   
		                        <th id="selec">Proyectos
		                        <select onChange="checkMarcados(this)" name="markOptions" id="markOptions" style=" height: 20px;line-height: 1.5;font-size: 12px;padding: 1px 5px;border-radius: 3px;">
		                        <option value="opciones">- Opciones -</option>
		                        <option value="borrar">Borrar</option>
			                    </select>
			                    <button id="buttonM" style ="display:none;" type="submit">Aplicar</button>
		                        </th>
		                        <th>Nombre</th>
		                        <th>Fecha</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                    <c:forEach items="${user.proyects}" var="p" begin="${(pag-1)*5}" end="${((pag-1)*5)+4}"> 
		                      <tr>
		                        <td class="selec">
		                          <input type="checkbox" id="copy${p.id}" name="checked" value="${p.id}"></input>
		                          <label for="copy${p.id}"></label>
		                          </td>
		                        <td><a href="/editProyect/${p.id}"><c:out value="${p.title}"></c:out></a></td>  
		                        <td>${p.date}</td>
		                      </tr>
		                     </c:forEach>
		                     
		                    </tbody>
		
		                  </table>
		                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 	
		                  </form>
		                  <div class="w3-bar w3-border w3-round">
		                    <div class="w3-bar">
		                      <a href="/tablaproyectos/${type}/${pag>=5 ? pag-4 : 1}" class="w3-bar-item w3-button"> &laquo; </a>
		                      <a href="/tablaproyectos/${type}/${pag}" class="w3-button"> ${pag} </a>
		                      <a href="/tablaproyectos/${type}/${(((pag)*5)+1) <= size ? pag+1 : pag}" class="w3-button"> ${(((pag)*5)+1) <= size ? pag+1 : '-'} </a>
		                      <a href="/tablaproyectos/${type}/${(((pag+1)*5)+1) <= size ? pag+2 : pag}#" class="w3-button">${(((pag+1)*5)+1) <= size ? pag+2 : '-'} </a>
		                      <a href="/tablaproyectos/${type}/${(((pag+2)*5)+1)<= size ? pag+3 : pag}#" class="w3-button">${(((pag+2)*5)+1) <= size ? pag+3 : '-'} </a>
		                      <a href="/tablaproyectos/${type}/${(((pag+3)*5)+1) <= size ? pag+4 : pag}#" class="w3-button"> &raquo; </a>
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
    		 }else{
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







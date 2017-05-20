<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>CVKard - Empresas</title>
    <link rel="stylesheet" type="text/css"  href="${s}css/main.css">
    <link rel="stylesheet" type="text/css"  href="${s}css/style.css"> 
    <script src="${s}resources/js/passwords.js"></script>
    <script src="${s}resources/js/mail.js"></script>
    <script src="${s}resources/js/reqUsuario.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2"></script>
    <script src="${s}js/login.js"></script>
    <style type="text/css">
      
         ul.radio_search li{
            display: inline-block;
         }       
     
   </style>
</head>
   
<body class="landing" style="background: url(${s}images/banner.jpg);background-repeat: no-repeat;background-attachment: fixed; background-size: 100%;">
    <div id="page-wrapper">
     <%@ include file="../fragments/header.jspf" %>
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
           
               
                <div class="box" style="padding-bottom:0px">
                  <div class="row">
                    <div class = "u2">
                    	<div class="column1">
                    		<ul style="list-style:none;">
			                	<li>
			                		<form action ="/ search" method ="get">	                    	
	                        			<input name ="s" type="text" id="buscador" placeholder="Find">
	                     			</form>
	                     		</li>
			                    <li>
				                    <ul class= "radio_search" >
				                        <li ><input type="radio" id="radio_proy" name="tipo_busqueda">
				                        <label for="radio_proy">Proyectos</label></li>
				                        <li ><input type="radio" id="radio_of" name="tipo_busqueda">
				                        <label for="radio_of">Ofertas</label></li>
				                        <li><input type="radio" id="radio_usu" name="tipo_busqueda" checked>
				                        <label for="radio_usu">Usuarios</label></li>
				                        
		                      		</ul>
		                      	</li>
		                      	<li>
		                      		
		                      	</li>			                   			                      	
			                </ul>	                    
                      	</div>                     
                    </div>
                    
                    
                    
                    <div class="u" >
                    	<div class="column1" style="margin-left:2em">	
                    		<h4>Buscar en</h1>                     	
	                    	<select name="cat_busqueda" id="cat_busqueda" multiple class="form-control" style="height:5em">	                       
	                          <option value="1"> Empresas</option>
	                          <option value="2"> Trabajadores</option>
	                          <option value="3"> Ambos</option>
	                        </select>
					    </div>
                    </div>
                    
                    <div class="u">
                      <div class="column1"  style="padding-top:20%">
                      	<a href="#" class="button special icon fa-search">Find</a>
                      </div>
                    </div>
                    
                
                    
                  </div>
                  <div class="6u 12u(mobilep)" id="DivOferta" style="display:none;">
                  <p>Parametros opcionales de búsqueda</p>
                  <input name ="Sueldo" type="text" id="Sueldo" placeholder="Sueldo min">
                  	<div class ="select-wrapper">
                        <select name="selectTemp" id="selectTemp">
                          <option value="0"> -Contratación-</option>
                          <option value="1"> Temporal</option>
                          <option value="2"> Definitiva</option>
                        </select>
                      </div>
                  	<div class ="select-wrapper">
                        <select name="selectValOf" id="selectValOf">
                          <option value="0"> -Valoración de la oferta en estrellas-</option>
                          <option value="1"> 0+</option>
                          <option value="2"> 1+</option>
                          <option value="3"> 2+</option>
                          <option value="4"> 3+</option>
                          <option value="5"> 4+</option>
                          <option value="6"> 5</option>
                        </select>
                      </div>
                   
                  </div>
                   <div class="6u 12u(mobilep)" id="DivProyecto" style="display:none;">
                   <p>Parametros opcionales de búsqueda</p>
                  <input name ="Sueldo" type="text" id="LineasCodigo" placeholder="Lineas Codigo">
                  <input name ="Sueldo" type="text" id="Tags" placeholder="Añade tags para la búsqueda">
                  	<div class ="select-wrapper">
                        <select name="selectValOf" id="selectValProy">
                          <option value="0"> -Valoración del proyecto en estrellas-</option>
                          <option value="1"> 0+</option>
                          <option value="2"> 1+</option>
                          <option value="3"> 2+</option>
                          <option value="4"> 3+</option>
                          <option value="5"> 4+</option>
                          <option value="6"> 5</option>
                        </select>
                      </div>
                  </div>
                </div>
                <div class="box">
                  <section>
                    <h3>Resultados de la búsqueda</h3>
                    <div class ="table-wrapper" id="tabla_usu">
                      <table>
                        <thead>
                          <tr>
                            <th> Imagen </th>
                            <th> <a href="#">Nombre</a></th>
                            <th> <a href="#">Tipo</a></th>
                          </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Usuario1</a></td>
                              <td> Trabajador </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/></td>
                              <td> <a href="#"> Usuario2</a></td>
                              <td> Trabajador </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/></td>
                              <td> <a href="#"> Empresa1</a></td>
                              <td> Empresa </td>
                           </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class ="table-wrapper" id="tabla_ofertas"  style="display:none;">
                      <table>
                        <thead>
                          <tr>
                            <th> Imagen </th>
                            <th> <a href="#">Nombre</a></th>
                            <th> <a href="#">Empresa</a></th>
                            <th> <a href="#">Contratación</a></th>
                            <th> <a href="#">Sueldo</a></th>
                            <th> <a href="#">Valoración(en estrellas)</a></th>
                          </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Oferta1</a></td>
                              <td> <a href="#"> Empresa2</a></td>
                              <td> Temporal </td>
                              <td> 1200€ </td>
                              <td> 3 </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Oferta2</a></td>
                              <td> <a href="#"> Empresa1</a></td>
                              <td> Definitiva </td>
                              <td> 2300€ </td>
                              <td> 5 </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Oferta3</a></td>
                              <td> <a href="#"> Empresa1</a></td>
                              <td> Temporal </td>
                              <td> 1560€ </td>
                              <td> 4 </td>
                           </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class ="table-wrapper" id="tabla_proyectos"  style="display:none;">
                      <table>
                        <thead>
                          <tr>
                            <th> Imagen </th>
                            <th> <a href="#">Nombre</a></th>
                            <th> <a href="#">Propietario</a></th>
                            <th> <a href="#">LíneasCodigo</a></th>
                            <th> <a href="#">Valoración(en estrellas)</a></th>
                          </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Proyecto1</a></td>
                              <td> <a href="#"> Usuario1</a></td>
                              <td> 1469 </td>
                              <td> 5 </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Proyecto2</a></td>
                              <td> <a href="#"> Usuario3</a></td>
                              <td> 987 </td>
                              <td> 3 </td>
                           </tr>
                           <tr>
                              <td> <img src="${s}images/users.png" alt="" WIDTH=50 HEIGHT=50/> </td>
                              <td> <a href="#"> Proyecto3</a></td>
                              <td> <a href="#"> Usuario2</a></td>
                              <td> 2457 </td>
                              <td> 4 </td>
                           </tr>
                        </tbody>
                      </table>
                    </div>
                  </section>
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
      <script>
		     $(document).ready(function(){
			 $("input[name=tipo_busqueda]").change(function(){

				 	$("#DivProyecto").hide();
				 	$("#DivOferta").hide();
				 	$("#tabla_proyectos").hide();
				 	$("#tabla_ofertas").hide();
				 	$("#tabla_usu").hide();
			 	if($(this).attr('id')=="radio_proy")
			 	{
				 	var valores={ '1':'C', '2':'Php','3':'Java'};
				 	var selectedOption= '0';
				 	$("#DivProyecto").show();
				 	$("#tabla_proyectos").show();
			 	}
			 	else if ($(this).attr('id')=="radio_of")
			 	{
				 	var valores={ '1':'Diseño Web', '2':'Diseño PHP','3':'Diseño Java'};
				 	var selectedOption= '0';
				 	$("#DivOferta").show();
				 	$("#tabla_ofertas").show();
			 		
			 	}
			 	else if($(this).attr('id')=="radio_usu"){
			 	var valores={ '1':'Empresas', '2':'Trabajadores','3':'Ambos'};
			 	var selectedOption= '0';
			 	$("#tabla_usu").show();
				 }
			 	var select=$("#cat_busqueda");
			 	var options=select.prop('options');
			 	$('option',select).remove();
			 	$.each(valores,function(val,text)
			 	{
			 		options[options.length]= new Option(text, val);
			 	});
			 	select.val(selectedOption);
			   
			 });
		});
		</script>
   </body>
</html>
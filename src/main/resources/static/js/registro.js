/**
 * 
 */
var CaptchaCallback = function() {
	widgetId1 = grecaptcha.render('RecaptchaField1', {'sitekey' : '6Lf1NyMUAAAAAALwub84xp42yPQpKAo8CXSeJX9W'});
	widgetId2 = grecaptcha.render('RecaptchaField2', {'sitekey' : '6Lf1NyMUAAAAAALwub84xp42yPQpKAo8CXSeJX9W'});
};
function changeForm(type){
	  var $userForm = document.getElementById ("employee");
	  var $bussinesForm = document.getElementById ("bussines");
	  if(type == 'Empresa'){
		  $userForm.style.display = "none";
	   	  $bussinesForm.style.display = "block";
	  }else{
		  $userForm.style.display = "block";
	   	  $bussinesForm.style.display = "none";
		  }
	  grecaptcha.reset();
  }
function checkAndCreateE(){
	 if (grecaptcha.getResponse(widgetId1).length == 0){
		    alert("hmmm... ¡verificate como humano!");
		} else {
			var $pass1 = document.getElementById("passE");
			var $pass2 = document.getElementById("passConfirmE");
			if($pass1.value.length < 6){
				alert("contraseña poco segura");
			}else if($pass1.value != $pass2.value){
				alert("contraseña mal verificada,prueba de nuevo");
			}else{
				document.getElementById("employee-form").submit();
			}	
		}
}
function checkAndCreateB(){
	 if (grecaptcha.getResponse(widgetId2).length == 0){
		    alert("hmmm... ¡verificate como humano!");
		} else {
			var $pass1 = document.getElementById("passB");
			var $pass2 = document.getElementById("passConfirmB");
			if($pass1.value.length < 6){
				alert("contraseña poco segura");
			}else if($pass1.value != $pass2.value){
				alert("contraseña mal verificada,prueba de nuevo");
			}else{
				document.getElementById("bussines-form").submit();
			}	
		}
}
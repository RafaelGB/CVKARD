/**
 * 
 */
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
  }

var CaptchaCallback = function() {
    grecaptcha.render('RecaptchaField1', {'sitekey' : '6Lf1NyMUAAAAAALwub84xp42yPQpKAo8CXSeJX9W'});
    grecaptcha.render('RecaptchaField2', {'sitekey' : '6Lf1NyMUAAAAAALwub84xp42yPQpKAo8CXSeJX9W'});
};
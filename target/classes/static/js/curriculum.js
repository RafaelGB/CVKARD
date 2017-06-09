/**
 * 
 */
var CaptchaCallback = function() {
	widgetId = grecaptcha.render('myRecaptcha', {'sitekey' : '6Lf1NyMUAAAAAALwub84xp42yPQpKAo8CXSeJX9W'});
};

function checkAndCreateMessage(){
	 if (grecaptcha.getResponse(widgetId).length == 0){
		    alert("hmmm... ¡verificate como humano!");
		} else {
				document.getElementById("contact-form").submit();
		}	
}
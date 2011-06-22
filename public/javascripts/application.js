// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function add_fields(link, association, content) {  
  var new_id = new Date().getTime();  
  var regexp = new RegExp("new_" + association, "g");  
  $(link).parent().prepend(  
    content.replace(regexp, new_id)  
  );  
}

$(function(){
	$(document).konami({
	     callback: function() {
	         x = window.innerWidth+300;
			$(".konami").animate({ 
			        left: "+="+x,
			      }, 10000 	, function() {
					$('.konami').css("left","-300px");
					$('.konami').hide();
					  });
	     }
	 });
})


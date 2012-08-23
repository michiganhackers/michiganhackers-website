$(document).ready(function(){
	
	// Signup form
	$("#email-signup-form").submit(function(e) {
		
		// Override the default form submission
		e.preventDefault();

		MHACK.ajaxPOST($(this).attr("action"), $(this).serializeArray(), function(msg) {
			
		});

	})
})
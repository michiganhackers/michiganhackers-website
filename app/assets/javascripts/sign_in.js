$(document).ready(function() {
	
	$("#notice_msg").hide();
	
	$("#sign-in-form").submit(function(e) {
		
		// Per Gaurav's request
		var tooSlowForGaurav = false;
		
		// Ignore the default form action
		e.preventDefault(); 
		
		var timeoutId = setTimeout(function() {
			tooSlowForGaurav = true;
			$("#notice_msg").html("Thank you for signing in. We hope that you enjoy the event!");
			$("#notice_msg").fadeIn().delay(1500).fadeOut();
		}, 1500)
		
		
		// Send it away!
		MHACK.ajaxPOST($(this).attr("action"), $(this).serializeArray(), function(r) { 
			clearTimeout(timeoutId);
			if(!tooSlowForGaurav) {
				$("#notice_msg").html(r.message).fadeIn().delay(1500).fadeOut(function() {});
			}
		});		
	})
	
})
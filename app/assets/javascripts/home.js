// Switch placeholder text based on selected button
$(document).ready(function() {
	
	$(".email-signup-form .radio-btn").on("change", function() {
		var placeholderText = "please enter your email";
		if($(this).val() === "student") { placeholderText = "please enter your @umich email" }
		$("#user_email").attr("placeholder", placeholderText);
	})
})

// AJAX for sign up form submission
$(document).ready(function() {
	
	var ajaxResponseText = $("#ajax-response-text");
	
	// Signup form
	$("#email-signup-form").submit(function(e) {
		
		// Override the default form submission
		e.preventDefault();

		// Reset the display text
		ajaxResponseText.hide()
		ajaxResponseText.html("")

		// Perform validation - this is good enough for now
		if(!($("#user_email").val().match(/(\w+)@(\w+)\.(\w+)/))) {
			ajaxResponseText.html("The email address you entered is invalid.")
			ajaxResponseText.show();
			return setTimeout(function() { ajaxResponseText.fadeOut(200) }, 2000);
		}
		
		// Perform the AJAX request
		MHACK.ajaxPOST($(this).attr("action"), $(this).serializeArray(), function(res) {
			// Regardless of the return status, these need to occur
			ajaxResponseText.html(res.message || "")
			ajaxResponseText.show();

			ajaxResponseText.removeClass("error").removeClass("success")
			if(res.status == 200) {
				ajaxResponseText.addClass("success")
				$("#user_email").val("")				
				setTimeout(function() { ajaxResponseText.fadeOut(200) }, 2000);
			} else if(res.status == 400) {
				ajaxResponseText.addClass("error")
			}

		});

	})
})
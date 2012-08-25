// Set up the global MH functions
(function(MHACK) {

	MHACK.getCSRF = function getCSRF() {
		var k = $("meta[name=csrf-param]").attr("content")
			, v = $("meta[name=csrf-token]").attr("content")
		;
		
		return {name: k, value: v}
	}
	
	MHACK.ajaxPOST = function ajaxPOST(url, data, cb) {

		// Ensure the callback is a function
		if(!(cb instanceof Function)) { cb = function() {} }

		// Enforce parameter validity 
		if(typeof(url) !== "string" || !(data instanceof Array)) { cb({status: 400}); }

		// NOTE - The CSRF param may already be in data
		data.push(MHACK.getCSRF())

		$.ajax({
			url: url
		, data: data
		, type: "POST"
		, dataType: "json"
		, success: cb
		})
	}
	
})(window.MHACK=window.MHACK||{});

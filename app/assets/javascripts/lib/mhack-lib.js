// Set up the global MH functions
(function(MHACK) {

	MHACK.getCSRF = function getCSRF() {
		var k = $("meta[name=csrf-param]").attr("content")
			, v = $("meta[name=csrf-token]").attr("content")
			, o = {}
		;

		o[k] = v;
		return o;
	}
	
	MHACK.ajaxPOST = function ajaxPOST(url, data, cb) {

		console.log("A")

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

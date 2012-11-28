$(document).ready(function() {

	var end_time = new(Date)(2012, 11, 3, 8).getTime()
		, secs_div = (1000)
		, mins_div = secs_div*60
		, hour_div = mins_div*60
	;
	
	updateClock();
	setInterval(updateClock, 1000);

	function updateClock() {
		var time_diff = end_time - (new(Date)());
		$("#hour").html(Math.floor(time_diff / hour_div));
		$("#mins").html(Math.floor(time_diff / mins_div));
		$("#secs").html(Math.floor(time_diff / secs_div));
	}
})
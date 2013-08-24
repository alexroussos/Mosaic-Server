$(document).ready(function () {
	$(".tooltip-info").popover();  
	
	$(".tooltip-info").bind({
		mouseenter : showTooltip,
		mouseleave: hideTooltip
	});
});

var showTooltip = function(e){
	$(e.target).popover('show');
}

var hideTooltip = function(e){
	$(e.target).popover('hide');
}
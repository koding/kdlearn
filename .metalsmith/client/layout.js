$(document).ready(function () {
	$('.topSearchButton').on('click',function(){
        $('.topSearchBox').slideToggle();
        $('.topSearchBox #topSearch').focus();
	});
});

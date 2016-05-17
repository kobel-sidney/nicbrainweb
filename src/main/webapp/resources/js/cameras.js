var cameras = {};

cameras.toggleColumns = function(number) {
	if (number == 2) {
		$('.camera').removeClass('col-md-4');
		$('.camera').addClass('col-md-6');
	} else {
		$('.camera').removeClass('col-md-6');
		$('.camera').addClass('col-md-4');
	}
}

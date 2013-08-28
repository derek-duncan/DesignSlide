$(window).scroll(function() {
	if ($(window).scrollTop() > 200) {
		$('.container').css({
			'margin-top' : $('.header').innerHeight()
		});
		$('.header').addClass('fixedHeader');
	}
	else {
		$('.container').css({
			'margin-top' : 0
		});
		$('.header').removeClass('fixedHeader');
	}
});

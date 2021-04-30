/**
 * 	notice들 rolling하는 js
 */

$(document).ready(function() {

	var height = $(".notice").height();
	var num = $(".rolling li").length;

	var max = height * num;
	var move = 0;


	function noticeRolling() {

		move += height;
		$(".rolling").animate({ "top": -move }, 600, function() {

			if (move >= max) {
				$(this).css("top", 0);
				move = 0;

			};
		});
	};
	noticeRollingOff = setInterval(noticeRolling, 2500);
	$(".rolling").append($(".rolling li").first().clone());
});


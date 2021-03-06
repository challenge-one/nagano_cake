// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function (){
	$("#theTarget").skippr({
		trancition : 'slide',
		speed : 1000,
		easing : 'easeOutQuart',
		navType : 'bubble',
		childrenElementType : 'div',
		arrows :false,
		autoPlay :true,
		autoPlayDuration :2000,
		keyboardOnAlways :true,
		hidePrevious :false
	});
});
$(document).on('turbolinks:load', function() {
    $('#item_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
    }
// ここまで
    reader.readAsDataURL(e.target.files[0]); 
});
});

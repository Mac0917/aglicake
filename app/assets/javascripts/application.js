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
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require jquery.jposta
//= require bxslider
//= require_tree . 
//= require bootstrap-sprockets

//repuire_tree .はすべてのjsを呼び込んでいる
//gemを使うjavascriptは//= require jquery.jpostaのように記述する必要がある
//skipprはjavascript/にskippr.jsとstylesheetsにskipper.jsでできる

//背景画像をスライダーにする
$(function() {
	$('.bg-slider').bgSwitcher({
		images: ['/assets/cake12.jpg','/assets/cake7.jpg','/assets/cake8.jpg',],   //画像を呼び込むにはこの記述しかない
		interval: 10000,
		loop: true,
		shuffle: true,
		effect: "fade", // fade,blind,clip,slide,drop,hide
		duration: 5000,
		easing: "swing" // linear,swing
	});
});




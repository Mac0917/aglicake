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
//= require jquery.jposta
//= require_tree . 
//= require bootstrap-sprockets

//repuire_tree .はすべてのjsを呼び込んでいる

//skipprはjavascript/にskippr.jsとstylesheetsにskipper.jsでできる
$(function () {
	$("#theTarget").skippr({
	  // スライドショーの変化 ("fade" or "slide")
	  transition : 'slide',
	  // 変化に係る時間(ミリ秒)
	  speed : 1000,
	  // easingの種類
	  easing : 'easeOutQuart',
	  // ナビゲーションの形("block" or "bubble")
	  navType : 'block',
	  // 子要素の種類("div" or "img")
	  childrenElementType : 'div',
	  // ナビゲーション矢印の表示(trueで表示)
	  arrows : true,
	  // スライドショーの自動再生(falseで自動再生なし)
	  autoPlay : true,
	  // 自動再生時のスライド切替間隔(ミリ秒)
	  autoPlayDuration : 3000,
	  // キーボードの矢印キーによるスライド送りの設定(trueで有効)
	  keyboardOnAlways : true,
	  // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
	  hidePrevious : false
	});
	});


//背景画像をスライダーにする
$(function() {
	$('.bg-slider').bgSwitcher({
		images: ['/assets/cake9.jpg','/assets/cake7.jpg','/assets/cake8.jpg','/assets/test1.jpg',],   //画像を呼び込むにはこの記述しかない
		interval: 10000,
		loop: true,
		shuffle: true,
		effect: "fade", // fade,blind,clip,slide,drop,hide
		duration: 5000,
		easing: "swing" // linear,swing
	});
});


//スクロールでフェードイン
$(function(){
    var effect_pos = 5000; // 画面下からどの位置でフェードさせるか(px)
    var effect_move = 50; // どのぐらい要素を動かすか(px)
    var effect_time = 800; // エフェクトの時間(ms) 1秒なら1000

    // フェードする前のcssを定義
    $('.scroll-fade').css({
        opacity: 0,
        transform: 'translateY('+ effect_move +'px)',
        transition: effect_time + 'ms'
    });

    // スクロールまたはロードするたびに実行
    $(window).on('scroll load', function(){
        var scroll_top = $(this).scrollTop();
        var scroll_btm = scroll_top + $(this).height();
        effect_pos = scroll_btm - effect_pos;

        // effect_posがthis_posを超えたとき、エフェクトが発動
        $('.scroll-fade').each( function() {
            var this_pos = $(this).offset().top;
            if ( effect_pos > this_pos ) {
                $(this).css({
                    opacity: 1,
                    transform: 'translateY(0)'
                });
            }
        });
    });
});



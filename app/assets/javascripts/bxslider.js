$(function(){
    $('.bxslider').bxSlider({
      auto: true,           // 自動スライド
      speed: 1000,          // スライドするスピード
      moveSlides: 8,        // 移動するスライド数
      pause: 5000,          // 自動スライドの待ち時間
      maxSlides: 3,         // 一度に表示させる最大数
      slideWidth: 250,      // 各スライドの幅
      randomStart: false,    // 最初に表示するスライドをランダムに設定
      autoHover: true,        // ホバー時に自動スライドを停止
      infiniteLoop: true,
      controls: false,
      tickerHover: false,
      responsive: false,
      touchEnabled: false
    });
  });


  
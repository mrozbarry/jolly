// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require highcharts
//= require highcharts.gray
//= require jquery.highchartTable
//= require turbolinks
//= require amazium/amazium
//= require_tree .

$(document).ready(function(){
  $('.mobile-nav').click(function(){
      $('.navigation').slideToggle('slow');
  });
  $(window).resize(function(){
    var currentWidth = $(window).width();
    if (currentWidth >= 768) {
        $('.navigation').show();
        $('.navigation').css("display","");
    } else {
      if( $('.navigation').css("display") == 'none' ) $('.navigation').hide();
    }
  });
});